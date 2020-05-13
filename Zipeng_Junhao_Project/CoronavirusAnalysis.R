library(dplyr)
library(tidyverse)
library(janitor)
library(lubridate)
library(maptools)
library(viridis)
library(sf)

data(wrld_simpl)

#Find the URL
data <- list(confirmed = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv",
     deaths = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv",
     recovered = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")

#read data into R
data <- lapply(data, read.csv)

#clean the data
data <- data %>%
    lapply(pivot_longer, -c(Province.State:Long)) %>%
    lapply(group_by, Country.Region, name) %>%
    lapply(summarize, value = sum(value)) %>%
    lapply(mutate, name = str_replace(name, "X", "")) %>%
    lapply(mutate, name = mdy(name))
    
#Merge the data
data <- data[[1]] %>%
    merge(data[[2]], 
          by.x = c("Country.Region", "name"),
          by.y = c("Country.Region", "name")) %>%
    merge(data[[3]],
          by.x = c("Country.Region", "name"),
          by.y = c("Country.Region", "name")
          ) %>%
    rename(confirmed = value.x, deaths = value.y, date = name, recovered = value)

#analyze the data

countries <- c("China", "Netherlands", "Belgium")

data %>%
    filter(is.element(Country.Region, countries)) %>%
    ggplot(aes(x = date, y = confirmed, group = Country.Region, color = Country.Region)) +
    geom_line() + ggtitle("A First Analysis")

#analyze the data more deeply
population <- read.csv("API_SP.POP.TOTL_DS2_en_csv_v2_988606.csv", skip = 3)

population <- population %>%
    select(Country.Name, X2018) %>%
    rename(pop_2018 = X2018) %>%
    mutate(Country.Name = str_replace(Country.Name, 
                                      c("Russian Federation","United States"), 
                                      c("Russia", "US")))

data <- data %>%
    merge(population, by.x = "Country.Region",
          by.y="Country.Name")

data <- data %>%
    mutate(confirmedpercapita = confirmed/pop_2018)

#Analysis 
data %>%
    filter(is.element(Country.Region, countries)) %>%
    ggplot(aes(x = date, y = confirmedpercapita, group = Country.Region, color = Country.Region)) +
    geom_line() + ggtitle("A First Analysis")

most <- data%>%
    filter(date == "2020-05-12") #%>%


hallo <- wrld_simpl[wrld_simpl$REGION != 0,] 

hallo@data <- hallo@data %>%
    mutate(NAME = str_replace(NAME, "United States", "US"))

hallo2 <- sp::merge(hallo, most, 
                    by.x = "NAME", by.y = "Country.Region")


ggplot() +
    geom_sf(data = sf::st_as_sf(hallo2), aes(fill = confirmedpercapita)) +
    scale_fill_viridis(option = "plasma", limits = c(0, 0.005)) + 
    theme(legend.title = element_text(size = 10), 
          legend.text = element_text(size = 4)) + labs(fill = "Hallo")

