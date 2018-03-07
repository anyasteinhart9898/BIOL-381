# Archetype experiemental designs, data entry, analysis and graphing in r 

#data <- read.table(file="AprilData.csv", row.names=1, 
#                   header=TRUE, sep",", stringAsFactors=FALSE) 

#Omit NA values

#dataClean <- data[complete.cases(data),] #NOTHINg after comma will instruct r to use all the rows. #entire data set is clean 
#will create rows w no missing values, r dont like them. Subsetting function 

#dataClean <- data[complete.cases(data[,5:6]),] #all rowns with no NA in column 5 and 6 

library(TeachingDemos)
library(ggplot2)
char2seed('espresso', set = FALSE)
char2seed('espresso')
runif(1)
#__________________ START CLASS FEB 27 2018 GOTELLI 

library(ggplot2)

#Create regression data frame 
n <- 50 #number of obs 
varA <- runif(n)
varB <- 5.5 + 10*varA + 10*runif(n)
ID <- seq_len(n)
regData <- data.frame(ID, varA, varB)
str(regData)
head(regData)

#basic regression analysis in R 
regModel <- lm(varB~varA, data=regData) #variable B (ind) is a function of var a (dependent) 
print(regModel)
str(regModel)
head(regModel$residuals)

# good stuff is contained in summary 
summary(regModel)
summary(regModel)$coefficients
z <- summary(regModel)
z$coefficients
mySlope <- z$coefficients[2,1]
mySlope

#unlist the summary to get ind iteems
zUnlisted <- unlist(z)
zUnlisted
zUnlisted$r.squared

#create a list w your useful output
regSum <- list(intercept=zUnlisted$coefficient,
               slope= zUnlisted$coefficients2, 
               interceptP=zUnlisted$coefficients3,
               slopeP=zUnlisted$coefficients8,
               r2= zUnlisted$r.squared)
str(regSum)
regSum$slope

#Basic gg plot of regression 

regPlot <- ggplot(data = regData, aes(x=varA, y= varB)) + geom_point() + stat_smooth(method = lm, se=0.99)
print(regPlot)



# data set up for analysis of variance 
nGroup <- 3 # number of treatment groups 
nName <- c("Control", "Treat1", "Treat2")
nSize <- c(12,17,9)
nMean <- c(40, 41, 60) # mean response in each group 
nSD <- c(5,5,5) # standard deviation within group 
ID <- 1:(sum(nSize)) #unique ID each row is observation 

resVar <- c(rnorm(n=nSize[1], mean=nMean[1], sd=nSD[1]),
            rnorm(n=nSize[2], mean=nMean[2], sd=nSD[2]),
            rnorm(n=nSize[3], mean=nMean[3], sd=nSD[3]))  
length(resVar)            
sum(nSize)
TGroup <- rep(nName, nSize) 
table(TGroup)


ANOdata <- data.frame(ID, TGroup, resVar)
str(ANOdata)
head(ANOdata)

#basic ANOVA in r
ANOmodel <- aov(resVar~TGroup, data=ANOdata)
print(ANOmodel)
summary(ANOmodel)

#basic ggplot of ANOVA data
ANOPlot <- ggplot(data=ANOdata,
                  aes(x=TGroup, y=resVar, fill=TGroup)) + geom_boxplot()
print(ANOPlot)  
ggsave(filename = "myBoxPlot.pdf", plot = ANOPlot, device="pdf")
#-------------------------------------- START CLASS MARCH 1t

#data frame contruction for logistic regression 
xVar <- sort(rgamma(n=200, shape=5, scale=5))
yVar <- sample(rep(c(1,0),each=100),prob=seq_len(200))
lRegData <- data.frame(ID=1:200, xVar, yVar)
str(lRegData)

#Logistic regression analysis in R
lRegModel <- glm(yVar~xVar, data=lRegData,
                 family = binomial(link=logit))
summary(lRegModel)              
summary(lRegModel)$coefficients 
#basic ggplot  of logistic regression 
lRegPlot <- ggplot(data=lRegData, aes(x=xVar, y=yVar)) + 
  geom_point() +
  stat_smooth(method = glm, method.args = list(family=binomial))
print(lRegPlot)

#basic contingency table analysis in R 
vec1 <- c(50,66,22)
vec2 <- c(120, 22, 30)
dataMatrix <- rbind(vec1, vec2) #rbind does a thing idk what
dataMatrix
rownames(dataMatrix) <- c("Cold", "Warm")
colnames(dataMatrix) <- c("Aphaenogaster",
                          "Camponotus", "Crematogaster")
dataMatrix
#contingency table analysis 
print(chisq.test(dataMatrix))

mosaicplot(x=dataMatrix, 
           col=c("goldenrod", "grey", "black"), shade=FALSE)
