#Hadly Wickham, ggplot. And Winston Chang- R Graphics cookbook
#ggplot graphics 
# 12 april 2018
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

#Standard plot with all of the data 
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy)) +
  geom_point() + geom_smooth()
print(p1)
str(p1)


# Break out the drive types
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy,group=drv)) +
  geom_point() + geom_smooth()
print(p1)

# see effect of color and see what changes (tbh nicer)
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy,color=drv)) +
  geom_point() + geom_smooth()
print(p1)

# Map to fll for confidence interval 
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy,fill=drv)) +
  geom_point() + geom_smooth()
print(p1)

#use both fill  and color for both effects as aesthetics 
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy,color=drv, fill=drv)) +
  geom_point() + geom_smooth()
print(p1)

#use aesthetic mappings within each group to override defaults 
#subset data to get ine group shown
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy,color=drv)) +
  geom_point(data=d[d$data=="4",]) + geom_smooth()
print(p1)

#instead of subsetting, just map an aesthetic 

p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy)) +
  geom_point(mapping=aes(color=drv)) + geom_smooth()
print(p1)

#Mapping smoother, but not data points 
p1 <- ggplot(data=d, mapping=aes(x=displ,y=hwy)) +
  geom_point() + geom_smooth(mapping=aes(color=drv))
print(p1)

#Subset in first layer to eliminate some data entirely
p1 <- ggplot(data=d[d$drv!="4",], mapping=aes(x=displ,y=hwy)) +
  geom_point(mapping=aes(color=drv)) + geom_smooth()
print(p1)

#geoms have an additional attributes that can be set, in addition to any aesthetics that are mapped
p1 <- ggplot(data=d[d$drv!="4",], mapping=aes(x=displ,y=hwy)) +
  geom_point(mapping=aes(color=drv)) + geom_smooth(color="black", size=2, fill="steelblue", method="lm")
print(p1)


# use bar plots for categorical variables

table(d$drv)
p1 <- ggplot(data=d, mapping=aes(x=drv)) + 
  geom_bar(color="black", fill="goldenrod")
print(p1)

p1 <- ggplot(data=d, mapping=aes(x=drv)) + 
  stat_count(color="black", fill="goldenrod")
print(p1)

#can also get out proportions 
p1 <- ggplot(data=d, mapping=aes(x=drv, y=..prop..,group=1)) + 
  geom_bar(color="black", fill="goldenrod")
print(p1)

# aesthetic mapping for multiple groups of bars
p1 <- ggplot(data=d, mapping=aes(x=drv, fill=fl)) + 
  geom_bar()
print(p1)

#unstack bars
p1 <- ggplot(data=d, mapping=aes(x=drv, fill=fl)) + 
  geom_bar(position = "identity")
print(p1)

#make them transparent with alpha attribute
p1 <- ggplot(data=d, mapping=aes(x=drv, fill=fl)) + 
  geom_bar(alpha=1/2, position = "identity")
print(p1)
#make the bar transparent 
p1 <- ggplot(data=d, mapping=aes(x=drv, color=fl)) + 
  geom_bar(fill=NA, position = "identity")
print(p1)

# use position = fill for stacking with equivalent height
p1 <- ggplot(data=d, mapping=aes(x=drv, fill=fl)) + 
  geom_bar(position="fill")
print(p1)

#best to use position= dodge for multiple bars- publication 
p1 <- ggplot(data=d, mapping=aes(x=drv, fill=fl)) + 
  geom_bar(position="dodge", color="black")
print(p1)

# more typical "bar plot" for mean values of a continuous variable 
dTiny <- tapply(X=d$hwy, INDEX = as.factor(d$fl), FUN=mean) #calculate group means 
dTiny <- data.frame(hwy=dTiny)
dTiny <- cbind(fl=row.names(dTiny), dTiny) # set up the data frame  

p2 <- ggplot(data=dTiny, mapping=aes(x=fl,y=hwy,fill=fl)) + 
               geom_bar(stat="identity")
print(p2)

# use the stats geom to create the classic bar plot
p1 <- ggplot(data=d, mapping = aes(x=fl,y=hwy)) +
  stat_summary(fun.y = mean, 
               fun.ymin= function(x) mean(x) - sd(x), 
               fun.ymax= function(x) mean(x) + sd(x))
print(p1)

#now put them together for the bar plot with error bars 
p1 <- ggplot(data=d, mapping = aes(x=fl,y=hwy)) +
  stat_summary(fun.y = mean, 
               fun.ymin= function(x) mean(x) - sd(x), 
               fun.ymax= function(x) mean(x) + sd(x)) + 
  geom_bar(data=dTiny, mapping=aes(x=fl, fill=fl), stat="identity")
print(p1)

#Use a boxplot instead!
p1 <- ggplot(data=d, mapping=aes(x=fl, y=hwy, fill=fl)) + geom_boxplot()
print(p1)

#now add the data
p1 <- ggplot(data=d, mapping=aes(x=fl, y=hwy)) + 
  geom_boxplot(fill="thistle") + 
  geom_point(position=position_jitter(width=0.2, height=0.7), color="grey60")
print(p1)
