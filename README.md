---
title: "Syllabus"
author: "Bas Machielsen"
date: "3/2/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction

Welcome to the three-part course that will (hopefully) convince all of you to start using R and tilt you over the threshold. This course will introduce you to the basic tenets of tidying and analyzing data in R, and more specifically, will (hopefully) convince you that everything that you previously did in Excel can be done **easier and more efficiently** in R. The syntax of R takes a while to get used to, but after an initial period of frustration, you will quickly find yourself making less and less syntactical mistakes, and programming in R will go smoother and smoother. This course is an attempt of making that period of frustration as short as possible. 

First, we will focus on the fundamentals: installing R/Rstudio, and importing and reading data in various formats in R. This is a relatively simple task, but there are several dangers/nuances which are useful to know beforehand. Afterwards, we focus on argueably the most important task: tidying our data. Data comes in many formats, and it is not always straightforward to get the data in a format which can be recognized by programs/functions that perform statistical or graphical analysis. The process of doing this is called **data tidying**, and R programmers have developed a fantastic set of packages called the **tidyverse** to do this. In this course, we will familiarize ourselves with the most common and most useful tidyverse functions to learn how to tidy just about every format of untidy data. 

There are two specific kinds of variables which might be especially hard to 'tidy': **strings** and **dates**. Fortunately, R has several excellent packages which manage to handle this information nicely (unlike Excel). I will pay special attention to these packages, __lubridate__ and __stringr__. 

After you've mastered how to tidy data in R, we can use several plotting environments to create graphs and other visualizations of our data. In the past, many people used Excel or other programs to generate graphs, which harmed reproducibility (there is no code leading up to a graph), and the graphs are ..not aesthetically pleasing. We will learn how to efficiently program visualizations, and make our **workflow** more efficient by learning how to easily update our figures when, for example, we use additional data, or we want to add an additional variable. 

Finally, we will learn how to perform basic statistical analyses in R, and efficiently report them, for example, in your next presentation at a conference, or in your current paper. 

## Prerequisites

This course requires that you be familiar with the basic tenets of data treatment, and more particularly, data treatment in Microsoft Excel. In particular, I will often use Excel as a benchmark against which I contrast the approach using R and various packages. 

## Course objectives

The objectives of this course are: 

- Learn how to use R for basic data treatment and discard Excel entirely. 

- Learn how to effectively visualize data that meets quality standards required for journal submissions

- Learn how to perform basic statistical analyses in R

- Learn to effectively report all previously mentioned aspects using RMarkdown and/or basic LaTeX 

- Develop an effective workflow, and ensure reproducibility of your work

## Course contents

- Lecture 1a: Installing R, RStudio, Basic R Syntax, Object Classes

- Lecture 1b: Tidying Data using the __tidyverse__: `pivot_longer` and `pivot_wider`

- Lecture 1c: String Manipulation using __stringr__, dates using __lubridate__

- Lecture 1d: The apply-functions family using __purr__

- Lecture 2a: __ggplot2__: the basics

- Lecture 2b: __ggplot2__: customizing your visualizations

- Lecture 3a: Introduction to statistical analyses using the __stargazer__ package

- Lecture 3b: Integrating everything in a document or presentation: __xtable__, __kable__, __kableExtra__, RMarkdown, TeX

## Reading

None! At the beginning of each session, you can follow along by downloading the RMarkdown files which I have created for each session. This way, you can (i) reproduce everything I do, and (ii) add spontaneous pieces of code to explore variations. Additionally, it will (hopefully) spontaneously teach you some of the syntax of Markdown and/or LaTeX, and encourage you to use those to make your own workflow as efficient as possible. 

## Cheat sheets

Many packages in R have so-called cheat sheets available. As it takes a lot of time to memorize all commands and arguements, it is more logical to have a cheat sheet at arms length that can (i) briefly describe the most common functions of a particular function and (ii) explain which arguments can and should be specified in a function call. In this section, I provide links to a few cheat sheets for the most often-used R packages:

### Languages/Programs

- [RStudio](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf)

- [Markdown](https://github.com/rstudio/cheatsheets/raw/master/rmarkdown-2.0.pdf)

- [LaTeX](https://wch.github.io/latexsheet/)

### Data treatment

- [Forcats](https://github.com/rstudio/cheatsheets/raw/master/factors.pdf)

- [Data Import](https://github.com/rstudio/cheatsheets/raw/master/data-import.pdf)

- [Dplyr](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf)

- [Stringr](https://github.com/rstudio/cheatsheets/raw/master/strings.pdf)

- [purr](https://github.com/rstudio/cheatsheets/raw/master/purrr.pdf)

- [lubridate](https://github.com/rstudio/cheatsheets/raw/master/lubridate.pdf)

### Data analysis

- [ggplot2](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf)

- [stargazer](https://www.jakeruss.com/cheatsheets/stargazer/)

- [estimatr](https://github.com/rstudio/cheatsheets/raw/master/estimatr.pdf)

## Developments & questions

I plan to extend this course to cover various more advanced aspects of R, most importantly, web scraping (both client-side, and by using API's) and using time series analyses. 

Please mail any questions and suggestions to a.h.machielsen@uu.nl! 
