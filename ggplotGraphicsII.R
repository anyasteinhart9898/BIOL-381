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

g1 <- ggplot(data=d, mapping =aes(x=displ, y=cty)) + 
  geom_point() + 
  geom_smooth() 
print(g1)

#second graph 
g2 <- ggplot(data=d, mapping= aes(x=fl, fill=I("tomato"), color=I("black"))) + 
  geom_bar(stat="count") + 
  theme(legend.position = "none") 
print(g2)

g3 <- ggplot(data=d,
             mapping=aes(x=displ, fill=I("royalblue"), color=I("black"))) + geom_histogram()
print(g3)

g4<- ggplot(data=d, 
            mapping=aes(x=fl, y=cty, fill=fl)) + geom_boxplot() + theme(legend.position = "none")
print(g4)

#Patchwork for awesome multipanel graphs 

#place two plots horizontally
g1+ g2

#Place three plots vertically
g1+ g2 + g3 + plot_layout(ncol=1)

# Change relative areas of each plot
 
g1 + g2 + plot_layout(ncol=1, heights = c(2,1))

g1 + g2 + plot_layout(ncol=2, widths = c(1,2))

# Add a spacer plot (under construction) 
g1 + plot_spacer() + g2

# set up nested plots

g1 + { 
  g2 + { 
    g3 + 
      g4 + 
      plot_layout(ncol=1)
  }
} + 
  plot_layout(ncol=1)

#minus (-) operator 

g1 + g2 - g3 + plot_layout(ncol=1)

# / | for intuitive layout

(g1 | g2 | g3 ) /g4

(g1 | g2)/(g3 | g4) 

#Swapping access orientation within a plot 

g3a <- g3 + scale_x_reverse()
g3b <- g3 + scale_y_reverse()
g3c <- g3 + scale_x_reverse() + scale_y_reverse()
(g3 | g3a)/(g3b | g3c)

#swtich orientation of coordinarws

(g3 + coord_flip() | g3a + coord_flip())/ (g3b + coord_flip() | g3c + coord_flip()) 

#ggsave for creating and saving plots
ggsave(filename="MyPlot.pdf", plot=g3, 
       device="pdf", width=20, height=20, units="cm", dpi=300)
# mapping of variavle to aesthetics

m1 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, color=class)) + geom_point()
print(m1)

#Limited to 6 shapes 
m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, shape=class)) + geom_point()
print(m2)

# mapping of a distance variable to point size 
m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, size=class)) + geom_point()
print(m2)

#map a continuous variable to point size
m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, size=hwy)) + geom_point()
print(m2)

#map a continuous variable onto cololr 

m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, color=hwy)) + geom_point()
print(m2)

# map two variables to two different aesthetics
m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, shape=class, color=hwy)) + geom_point()
print(m2)

# mapping 3 variables onto shape, size and color
m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, shape=drv, color=fl, size=hwy)) + geom_point()
print(m2)

#mapping a variable to the same aesthetic for two different geoms


m2 <- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty, color=drv)) + geom_point() + geom_smooth(method = "lm")
print(m2) 

# faceting for excellent visualization in a set of related plots

m2<- ggplot(data=mpg, 
             mapping = aes(x=displ, y=cty)) + geom_point() 
m2 + facet_grid(class~fl)
m2 + facet_grid(class~fl,scales="free_y")
m2 + facet_grid(class~fl,scales="free")
#facet on only a single variable 
m2 + facet_grid(.~class)
m2 + facet_grid(class~.)

#use facet wrap for unordered graphs
m2 + facet_wrap(~class)

#combine variables in a facet wrap
m2 + facet_wrap(~class + fl, drop=FALSE)

#use facet in combination with aesthetics 

m2 <- ggplot(data=mpg, mapping= aes(x=displ, y=cty, color=drv)) + 
  geom_point()
m2 +facet_grid(.~ class)

m2 <- ggplot(data=mpg, mapping= aes(x=displ, y=cty, color=drv)) + 
  geom_smooth(method="lm", se=FALSE)
m2 +facet_grid(.~ class)

#Fitting w box plots over a continuous variable 
m2 <- ggplot(data=mpg, mapping =(aes(x=displ, y=cty, group=drv, fill=drv))) + 
  geom_boxplot(method="lm", se=FALSE)
m2 +facet_grid(.~ class)

print(m2)
