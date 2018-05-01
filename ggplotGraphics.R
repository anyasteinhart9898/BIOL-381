#Hadly Wickham, ggplot. And Winston Chang- R Graphics cookbook
#ggplot graphics 
# 5 april 2018
# NJG

#preliminaries
library(ggplot2)
install.packages("ggthemes")
library(ggthemes)
library(patchwork)
library(TeachingDemos)
char2seed("10th Avenue Freeze-Out")
d<-mpg
str(d)

# qplots for use while coding 

#Basic Histogram
qplot(x=d$hwy)
qplot(x=d$hwy, fill=I("khaki"), color=I("black"))

# density plot
qplot(x=d$hwy, geom="density")

# BAsic scatter plot
qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"))
qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"), method="lm") #linear regression has been added

#Basic Box plot 
qplot(x=d$fl, y=d$cty, geom="boxplot", fill=I("green"))

#basic barplot
qplot(x=d$fl, geom="bar", fill=I("dark salmon"))

#Not what you expect 
qplot(x=d$fl, geom="bar", fill="dark salmon") # this will map the variable, not the color we want, its considered an element. its red bc its the first color that comes up. CORRECT VARIABLES

#plotting curves and fucntions

myVec <- seq(1,100, by=0.1)
myFun <- function(x)  sin(x) + 0.1*x

#Plor built in functions 
qplot(x=myVec, y=sin(myVec), geom="line")

#Plot Density distributios 
qplot(x=myVec, y=dgamma(myVec, shape=5, scale=3), geom="line")

#plot user defined distributions for probabilty funcitons
qplot(x=myVec, y=myFun(myVec), geom="line")


#--------------------------------------

p1 <- ggplot(data=d, mapping=aes(x=displ, y=cty)) + geom_point()
print(p1)

p1 + theme_classic() # gets rid of the grid screen in the back. better for publication 

p1 + theme_linedraw()

p1 + theme_dark() #good for bright points

p1 + theme_base() #looks like base r 

p1 + theme_par() #uses current par settings

p1 + theme_void() # just data points

p1 + theme_solarized() #good colors

p1 + theme_economist() # many specialized themes 

p1 + theme_grey() 

# use theme paraeters to modify font and font size

p1 + theme_classic(base_size = 30, base_family = "serif") # base_family= font, base_size= size of font 

p2<- ggplot(data=d,
             mapping=aes(x=fl, fill=fl)) + geom_bar()

print(p2)
#flip the two coordinate axes
p2 + coord_flip() + theme_grey(base_size = 20, base_family = "Courier")

# minor theme modification 
p1 <- ggplot(data=d, 
             mapping=aes(x=displ, y=cty)) + geom_point(size=5, shape=21, color="black", fill="coral") 
print(p1)
#See cheat sheet for the shapes and colors 

p1 <- ggplot(data=d, 
             mapping=aes(x=displ, y=cty)) + geom_point(size=5, shape=21, color="black", fill="coral") + ggtitle("Hello")
print(p1)
p1 <- ggplot(data=d,mapping=aes(x=displ, y=cty)) + geom_point(size=5, shape=21, color="black", fill="coral") + ggtitle("Hello") + xlab("My x label") + ylab("My Y label") + xlim(0,4)+ ylim(0,20)
p1

g1 <- ggplot(data=d, mapping =aes(x=displ, y=cty)) + 
  geom_point() + 
  geom_smooth() 
print(g1)

#second graph 
g2 <- ggplot(data=d, mapping= aes(x=fl, fill=I("tomato"), color=I("black"))) + 
  geom_bar(stat="count") + 
  theme(legend.position = "none") 
print(g2)
