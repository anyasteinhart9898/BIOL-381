#Preliminaries
library(scatterD3)
library(ggplot2)
library(TeachingDemos)
library(networkD3)
char2seed("Anya Steinhart, Ph.D")
# Based on coding in "Java Script" the package allows us to create HTML widgets that are interactive, and I think looks good!
#Creating a basic INTERACTIVE Scatter plot using scatterd3!
#Lets look at the data set

#Subsetting the data 
data.frame(iris)
iris2 <- iris[sample(1:nrow(iris),25),]
iris2
fit <- lm(Sepal.Length~Petal.Length, data=iris2)
summary(fit)
#Creating basic graphs

scatterD3(data=iris2,
          x=Petal.Length, 
          y=Sepal.Length)
#We can also use categorical variables on one the axis

scatterD3(data=iris2,
          x=Species, 
          y=Petal.Length)

# We can also get rid of the gear menu if we want 
scatterD3(data=iris2, x=Petal.Length, y=Sepal.Length, menu=FALSE)
#Adding point variation,  

scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length,
          point_size = 30, point_opacity = 0.75, fixed = TRUE,
          colors = "RebeccaPurple")
#You can only use specific HTML colors that are supported by browsers, 
#Link to compatable colors: https://www.w3schools.com/tags/ref_colornames.asp
#We can also play with the size of the hover!
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length,
          point_size = 30, point_opacity = 1, fixed = FALSE,
          colors = "RebeccaPurple",  hover_size = 10, hover_opacity = 0.75)
#Adding labels
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length,
          point_size = 30, point_opacity = 1,
          colors = "RebeccaPurple",  hover_size = 6, hover_opacity = 1,
          lab=Species)
#Map variables by size, color and symbol and opacity
#Color- Categorical or continuous
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length, 
          col_var = Species, colors = c("Pink","Plum", "PowderBlue"))
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length, 
          col_var = Sepal.Width, col_continuous = TRUE) 
#shape-categorical variables
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length, 
          symbol_var =Species,
          col_var=Species)
#Size and opacity can both be used for continuous 
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length, 
          colors="Plum",
          size_var =Sepal.Width, 
          size_range = c(10, 100))
#Continuous
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length, 
          colors="Plum",
          opacity_var = Sepal.Length)
#Adding lines in a data frame- need to run analysis on the data, may change
scatterD3(data=iris2, x=Petal.Length, y=Sepal.Length, colors="Plum",  lines = data.frame(slope = 1.79, intercept = -6.31, stroke = "Green", stroke_width = 5, stroke_dasharray = "10.5"))
          
#Adding labels to the axis
scatterD3(data=iris2, x=Petal.Length, xlab="Petal Length", y=Sepal.Length, ylab = "Sepal Length", col_var = Species, colors = c("Pink","Plum", "PowderBlue"),axes_font_size = "110%",legend_font_size = "15px")

#Adding a caption must also occur in a data frame
scatterD3(data=iris2, x=Petal.Length, xlab="Petal Length", y=Sepal.Length, ylab = "Sepal Length", col_var = Species, colors = c("Pink","Plum", "PowderBlue"), 
          caption=list(title="Anya needs a raise",
                       text="Anya needs a raise because she is always covered in salt water and urchin poop, and lifts heavy buckets. She should also get an A in all her classes but Lindin Higgins and Nathan Jebbett are ruining her life"))

tooltips <- paste( "This is an iris <I dont know what this means>","</strong><br/>with a", iris$Petal.Width, "inch petal width!")
scatterD3(data = iris2, x =Petal.Length, y = Sepal.Length, tooltip_text = tooltips)


#Adding a URL when clicking on the point- this took me way too long 
iris2$url <- paste0("https://www.google.com?q=", colnames<-iris2$Species)
scatterD3(data=iris2, 
          x=Petal.Length, 
          y=Sepal.Length, 
          col_var = Species, colors = c("Pink","Plum", "PowderBlue"),
          url_var=url)
#Adding a callback
scatterD3(data = iris2, x = Petal.Length, y = Sepal.Length,
          click_callback = "function(id, index) {
          alert('scatterplot ID: ' + id + ' - Point index: ' + index) 
          }")
#Adding confident ellipses- figure out how to do change the color- I don't think you can 
scatterD3( data=iris2, x=Petal.Length,y=Sepal.Length, col_var = Species, color= c("Pink","Plum", "PowderBlue"), ellipses=TRUE)

#Lasso Plug in 
scatterD3(data=iris2, x=Petal.Length, y=Sepal.Length, col_var = Species, colors = c("Pink","Plum", "PowderBlue"), lab = Species, lasso=TRUE)
#Lasso Call back using java script
scatterD3(data=iris2, x=Petal.Length, y=Sepal.Length, col_var = Species, colors = c("Pink","Plum", "PowderBlue"),lab=Species, lasso=TRUE, lasso_callback= "function(sel) {alert(sel.data().map(function(d) {return d.lab}).join('\\n'));}")
# We can intergrate othe points into other graphing packages,like ggplot2!
scatterD3(data=iris2, x=Petal.Length, y=Sepal.Length, lab=Species)

labels <- read.csv("plots.csv")
graph <- ggplot() + 
  geom_point(data=iris2, aes(x=Petal.Length, y=Sepal.Length)) + 
  geom_text(data=labels,
            aes(x=lab_x,
                y=lab_y,
                label=lab))
print(graph)
library(networkD3)
