# Trying different plots in scatter d3!
# April 18th 2018
# ALS
#https://www.w3schools.com/tags/ref_colornames.asp

# This package creates interactive scatter plots, most basic command 
library("scatterD3")
library(ggplot2)
d <- iris
print(d)
#this is the preferred way to call the data
scatterD3(data=iris, x=Petal.Length, y=Petal.Width)
#Categorical variables
scatterD3(data=iris, x=Species, y=Petal.Length)
#using the left_margin to flip the axis. While the axis will flip without it ,the categorical variable labels will be cut off
scatterD3(data=iris, y=Species, x=Petal.Length, left_margin = 50)
#adding points

scatterD3(data=iris, x=Petal.Length, y=Petal.Width, lab = Species, labels_size = 9)
# Mapping colors, symbols, size and opacity to variables
#Adding color 
scatterD3(data=iris, x=Petal.Length, y=Petal.Width, col_var = Species)
#You can in fact change the color to not the default colors
scatterD3(data=d, x=Petal.Length, y=Petal.Width, col_var = Species, colors=c("versicolor"="Pink", "virginica"="Plum","setosa"= "PowderBlue"))
#Colors ain't your thing? you can add symbols! WILD

scatterD3(data=d, x=Petal.Length, y=Petal.Width, symbol_var = Species, color=c("Black"))
#Changing the symbols
scatterD3(data=d, x=Petal.Length, y=Petal.Width, symbol_var = Species)
# Adding the different si
scatterD3(data=d, x=Petal.Length, y=Petal.Width, size_var=Sepal.Length, size_range=c(1,100), point_opacity=0.7)

#changing the axis of the graph- I don't like these 
scatterD3(data=iris, x=Petal.Length, y=Petal.Width, col_var = Species, color=c("Pink", "Plum", "PowderBlue"), xlim=c(2,10), ylim=c(0,1))

#Adding something caption
