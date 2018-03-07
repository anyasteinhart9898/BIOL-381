
library(ggplot2)


nGroup <- 2
nName <- c("8.1", "7.5")
nSize <- c(60, 60)
nMean <- c(317.59, 235.38) 
nSD <- c(30.58, 30.18) # standard deviation within group 
ID <- 1:(sum(nSize)) #unique ID each row is observation 

resVar <- c(rnorm(n=nSize[1], mean=nMean[1], sd=nSD[1]),
            rnorm(n=nSize[2], mean=nMean[2], sd=nSD[2]))
length(resVar)
sum(nSize)
TGroup <- rep(nName, nSize) 
table(TGroup)

ANOdata <- data.frame(ID, TGroup, resVar)
str(ANOdata)
head(ANOdata)

ANOmodel <- aov(resVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)



z <- summary(ANOmodel)
str(z)
aggregate(resVar~TGroup,data=ANOdata,FUN=mean)
unlist(z)
unlist(z)[7]
ANOsum <- list(Fval=unlist(z)[7],probF=unlist(z)[9])
ANOsum

ANOPlot <- ggplot(data=ANOdata,
                  aes(x=TGroup, y=resVar, fill=TGroup)) + geom_boxplot()
print(ANOPlot)  



#--------------------------
library(ggplot2)


nGroup <- 2
nName <- c("8.1", "7.5")
nSize <- c(60, 60)
nMean <- c(317.59, 235.38) 
nSD <- c(30.58, 30.18) # standard deviation within group 
ID <- 1:(sum(nSize)) #unique ID each row is observation 

urchinVar <- c(rnorm(n=nSize[1], mean=nMean[1], sd=nSD[1]),
               rnorm(n=nSize[2], mean=nMean[2], sd=nSD[2]))
urchinVar


TGroup <- rep(nName, nSize) 
table(TGroup)

ANOdata <- data.frame(ID, TGroup, urchinVar)
ANOmodel <- aov(urchinVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)


ANOmodel <- aov(urchinVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)


ANOPlot <- ggplot(data=ANOdata,
                  aes(x=TGroup, y=urchinVar, fill=TGroup)) + geom_boxplot()
print(ANOPlot)  
ggsave(filename = "myBoxPlot.pdf", plot = ANOPlot, device="pdf")


###Second ANOVA. Increase in closeness of the means.  


nGroup <- 2
nName <- c("8.1", "7.5")
nSize <- c(60, ^0)
nMean <- c(317.59, 300.66) 
nSD <- c(55.58, 79.18) # standard deviation within group 
ID <- 1:(sum(nSize)) #unique ID each row is observation 

urchinVar <- c(rnorm(n=nSize[1], mean=nMean[1], sd=nSD[1]),
               rnorm(n=nSize[2], mean=nMean[2], sd=nSD[2]))
urchinVar


TGroup <- rep(nName, nSize) 
table(TGroup)

ANOdata <- data.frame(ID, TGroup, urchinVar)
ANOmodel <- aov(urchinVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)


ANOmodel <- aov(urchinVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)


ANOPlot <- ggplot(data=ANOdata,
                  aes(x=TGroup, y=urchinVar, fill=TGroup)) + geom_boxplot()
print(ANOPlot)  
ggsave(filename = "myBoxPlot.pdf", plot = ANOPlot, device="pdf")
```

#Third ANOVA
```{r}
nGroup <- 2
nName <- c("8.1", "7.5")
nSize <- c(60, 60)
nMean <- c(500.34, 100.38) 
nSD <- c(100.3, 40.18) # standard deviation within group 
ID <- 1:(sum(nSize)) #unique ID each row is observation 

urchinVar <- c(rnorm(n=nSize[1], mean=nMean[1], sd=nSD[1]),
               rnorm(n=nSize[2], mean=nMean[2], sd=nSD[2]))
urchinVar


TGroup <- rep(nName, nSize) 
table(TGroup)

ANOdata <- data.frame(ID, TGroup, urchinVar)
ANOmodel <- aov(urchinVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)


ANOmodel <- aov(urchinVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)


ANOPlot <- ggplot(data=ANOdata,
                  aes(x=TGroup, y=urchinVar, fill=TGroup)) + geom_boxplot()
print(ANOPlot)  
ggsave(filename = "myBoxPlot.pdf", plot = ANOPlot, device="pdf")
