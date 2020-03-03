---
title: "String and Date Manipulation"
author: "Bas Machielsen"
date: "3/3/2020"
output:
  html_document:
    keep_md: true
    toc: true
    toc_float:
      collapsed: false
      smooth_scroll: true
---


# Introduction

This lecture will focus on manipulation of strings and dates, two non-straightforward classes of variables. It pays to take the effort to find out how to easily manipulate them, and which difficulties may arise. 

# String manipulation

Character strings in R are object that are not always easy from the perspective of data treatment. For example, string variables might not be coded in the correct way, or you might want to extract a certain text and transform or use it in some other way. For this, we will use the R package **stringr**. From the vignette:

> There are four main families of functions in stringr:

    1. Character manipulation: these functions allow you to manipulate individual characters within the strings in character vectors.

    2. Whitespace tools to add, remove, and manipulate whitespace.

    3. Locale sensitive operations whose operations will vary from locale to locale.

    4. Pattern matching functions. These recognise four engines of pattern description. The most common is regular expressions, but there are three other tools.
    
## What will we use it for?

We will use **string** for two tasks: first, we might want to change the labels of our variables, or values of factors within variables, or character strings. Second, we might want to extract information from untidy data, something I will demonstrate in this session. 

Let us first focus on the first task: wanting to change various labels. 


```r
install.packages('stringr')
```


```r
library(stringr)
```

Let us try to start with a single string, and introduce some straightforward commands:

```r
singlestring <- "My name is Bas"

#str_length measures the length of a string
str_length(singlestring)
```

```
## [1] 14
```

```r
#str_sub filters out a part of the string
str_sub(singlestring, 
        start = 11,
        end = 14)
```

```
## [1] " Bas"
```

```r
#We can also use str_sub with negative numbers as the third argument to specify "n from last":
str_sub(singlestring, 4, -8)
```

```
## [1] "name"
```
We can also use `str_sub` to modify strings. Let us read in some (hopefully familiar) data to illustrate:


```r
getwd()
```

```
## [1] "/home/bas/Documents/R_Introduction/Slides"
```

```r
data <- read.csv("../DataFiles/wb.csv")

names(data)
```

```
##  [1] "Country.Name"   "Country.Code"   "Series.Name"    "Series.Code"   
##  [5] "X2009..YR2009." "X2010..YR2010." "X2011..YR2011." "X2012..YR2012."
##  [9] "X2013..YR2013." "X2014..YR2014." "X2015..YR2015." "X2016..YR2016."
## [13] "X2017..YR2017." "X2018..YR2018."
```
All of the variable names that indicate the years start with X. That is not so nice. Perhaps we could replace X by nothing?


```r
str_sub(names(data)[5:14],1,1) <- ""

names(data)
```

```
##  [1] "Country.Name"  "Country.Code"  "Series.Name"   "Series.Code"  
##  [5] "2009..YR2009." "2010..YR2010." "2011..YR2011." "2012..YR2012."
##  [9] "2013..YR2013." "2014..YR2014." "2015..YR2015." "2016..YR2016."
## [13] "2017..YR2017." "2018..YR2018."
```

That worked very well. Although this is not the most efficient way of data cleaning (there exist more useful commands), it can get the job done in some cases. 

Let us now attempt to do some pattern matching, one of the most often-used features of stringr. From the vignette:

> The vast majority of stringr functions work with patterns. These are parameterised by the task they perform and the types of patterns they match.

For example, let me generate a variable that indicates whether a certain string contains a year or not. 


```r
years <- "[0-9]{4}" # We will get to the meaning of this later
```

The command `str_detect` then finds whether the first argument (in this case, `names(data)`) contains the second string or not, and returns a boolean.

```r
str_detect(names(data), years)
```

```
##  [1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [13]  TRUE  TRUE
```

One of the most important 
# Date manipulation


# Practice using the swirl package

Swirl is a package which can help you learn R and practise a little bit. You can install swirl in the following way.


```r
install.packages('swirl')
```

And get started by registering, and installing a course. [Here](https://github.com/swirldev/swirl_courses) is a page of courses you can install. I recommmend you start with **R Programming**. 


```r
library(swirl)

install_course("R Programming")
```

Then, you can start the application by typing `swirl()` in the console. Everything else happens in the console right now, but occasionally, you might be asked to complete an R script by an assignment. 

Why don't we start with 1, basic building blocks! If all is well, your console now should look something like this:

![](https://raw.githubusercontent.com/basm92/R_Introduction/master/Miscellaneous/picture1c_1.png)
Press enter (in the console) to continue. You can do this tutorial together with me. If you're done or you want to stop, you can press ESC. 




