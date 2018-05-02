#Scatter D3- a way to create interactive scatter plot
#02 May 2018
#ALS
#Preliminaries
library(scatterD3)
library(ggplot2)
library(TeachingDemos)
library(networkD3)
char2seed("Anya Steinhart, Ph.D")

#Cutting down the data via random sampling
iris2 <- iris[sample(1:nrow(iris),25),]
print(iris2)


