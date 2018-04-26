# Trying different plots in scatter d3!
# April 18th 2018
# ALS
#https://www.w3schools.com/tags/ref_colornames.asp

# This package creates interactive scatter plots, most basic command 
library("scatterD3")
d <- iris
scatterD3(x=iris$Petal.Length, y=iris$Petal.Width)
#this is the preferred way to call the data
scatterD3(data=iris, x=Petal.Length, y=Petal.Width)


