#Scatter D3-a way to create interactive data sets by using the d3.js visualization library
# 02 May 2018
# ALS
library(scatterD3)
library(ggplot2)
library(TeachingDemos)
library(networkD3)
char2seed("Anya Steinhart, Ph.D")

#Randomly sampling from "the data frame "iris"
iris2 <-iris[sample(1:nrow(iris),25),]
print(iris2)

#creating 