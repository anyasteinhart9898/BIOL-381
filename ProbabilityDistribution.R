# using probability simulatuin in R
#feb 15 ALS

library(ggplot2)
testdata <- runif(1000)
qplot(x=testdata)

#---------------------------
#function histo
#better histogram
#input xData=numeric vector 
#inpu fColor= fill color 
#output = corrected ggplot histogram
#outpit = sumary stats 
#outputs =95% interval

Histo <- function(xData=runif(1000), fColor="rosybrown1") {
  z <- qplot(x=xData,color=I("black") , fill=I(fColor) , xlab="X", boundary=0) 

  print(z) 
  print(summary(xData))
  print(quantile(xData, probs = c(0.025, 0.975)))
}
#test function now 
Histo()
temp <- rnorm(1000)
Histo(xData=temp, fColor="mediumorchid4")

#Function iHisto (integerhistogram)
#works better for interger values
# input xData = a vector of intergers 
# input fColor = named color 
# output = histogram of interers 
# output = summary of xData 
# output = 95%interval for x data 
iHisto <- function(xData=runif(1000), fColor="powderblue") {
  z <- qplot(x=factor(xData),color=I("black") , fill=I(fColor) , xlab="X", boundary=0) 
  
  print(z) 
  print(summary(xData))
  print(quantile(xData, probs = c(0.025, 0.975)))
}

Histo()
temp <- rnorm(1000)
Histo(xData=temp, fColor="powderblue")

temp2 <- rpois(n=100,lambda = 0.5)
Histo(temp2)
iHisto(xData=temp2, fColor="powderblue")
mean(temp==0) #boolean operater hello hello 

#binomial 
# integer from 0 to number of trials 
# parameters size=number of trial 
# parameter p = probability of success


x <- rbinom(n=1000, size=40, p=0.75)
iHisto(xData=x, fColor="mediumaquamarine")
#-------------------------------------------Begin class feb 20th 
x <- rbinom(n=1000, size=500, p=0.75)
iHisto(xData=x, fColor="mediumaquamarine")


#poisson 
#constant rate process
z<-rpois(n=1000, lambda = 1) 
iHisto(z)
mean(z==0)

#negative binomial
# range fron 0 to infinity 
#n = number of replicates 
# size is the number of trials
# prob= probability of sucess w one trial 
z <- rnbinom(n=1000, size = 2, p=0.5)
Histo(z)
#alternatively call w mu= mean rate
#size= index of overdispersion 
#small size = high dispersion 
z <- rnbinom(n=1000, mu=1.1,size=0.7)
Histo(z)
z <- rnbinom(n=1000, size=1, p=0.95)
Histo(z)
#Multinomial distribution
# "balls in urns"  each urn have seperate probs 

z <- rmultinom(n=5, size=1000, prob = c(0.2, 0.7, 0.1))
z
rowMeans(z)

#creating multinomial finction 
z <- sample(x=LETTERS[1:3], size=20, prob = c(0.2, 0.7, 0.1), replace=TRUE)
z
table(z)
#continuous Distributions
#uniform 
z <- runif(n=1000, min=3, max=10.2)
Histo(z)
#normal distributions 
z <- rnorm(n=1000, mean=2.2, sd=6)
Histo(z)
#gamma distribution 
#distribution of waiting times for failure
#shape and scale parameters
#mean=shape* scale
#variancee=shape*scale^2

z <- rgamma(n=1000, shape=10, scale=10)
Histo(z)

z <- rgamma(n=1000, shape=0.1, scale=0.1)
Histo(z)

#Beta distribution 
#bounded between 0 and 1 
#change boundary by adding or multiplying final vector 

#conjugate prior for a binomial distribution

#binomial
#begin with p 
#generate number of sucesses and failures 
#p is ~ successes/(successes + failures)
#problems at small sample sizes 
#shape1= number of successes + 1
#shape 2= number of failures + 1 

z <- rbeta(n=1000, shape1=1, shape2 = 1)
Histo(z)

z <- rbeta(n=1000, shape1=0.1, shape2 = 0.3)
Histo(z)
#maximum Likelihoofd in R 
library(MASS)
x <- rnorm(n=1000,mean=92.5, sd=2.5) 
Histo(x)

zFit <- fitdistr(x,"normal") 
str(zFit)                
zFit$estimate

#now fit to gamma
zFit <- fitdistr(x, "gamma")
zFit$estimate
zNew <- rgamma(n=1000, shape=1449, rate=15.7)
Histo(zNew)
summary(x)

z <- runif(n=1000, min=85, max=100)
Histo(z)
#-------- End class feb 20th 