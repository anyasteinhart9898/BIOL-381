# Illustrate control structures for programminf flow 



#basic if statements

z <- signif(runif(1), digits=2)
print(z)
z >0.5
if(z > 0.5) cat(z, "is a bigger than average number","\n")

if(z > 0.8) cat(z, "is a bigger than average number", "\n") else 
  if( z < 0.2) cat(z, "is a smaller than average number", "\n") else 
    {cat(z, "is a number of typical size" , "\n") 
      cat("z^2 =", z^2, "\n")} 
# put block statements into functions before using with an if structure 
# "condition inid statemnent returns only a single true or false value

z <- 1:10

if(z>7) print(z) #nothing happens 
if(z < 7) print(z) # not what we want 

#using subsetting
print(z[z<7])

#insect clutch size poisson with lambda= 10.2 
#parasitism probabilty= 0.35 with 0 eggs laid
library(ggplot2)
tester <- runif(1000) # random uniform
eggs <- ifelse(tester > 0.35, rpois(n=1000, lambda = 10.2),0)
hist(eggs)

#use to create vector of states for plottng 
pVals <- runif(1000)
z <- ifelse(pVals<=0.025, "lowerTail", "nonSig")
z[pVals>=0.975] <- "upperTail"
head(z)
table(z)

#alt method 
z1 <- rep( "NonSig", length(pVals))
z1[pVals<=0.025] <- "lower tail"
z1 [pVals>= 0.975] <- "upper Tail"
table(z1)

#Simple for loops 

myDat <- signif(runif(10), digits = 2) 

#for (i in 1:length(myDat)) not so good
for (i in seq_along(myDat)) {
  cat("loop number =", i, "vector element=", myDat[i], "\n")
}
print(i)

#uses a constant to define teh length of the loop 

zz <- 50
zz2 <- 4:6
myDat <- signif(runif(zz), digits=2)
for (i in zz2) {
  cat("loop number =", i, "vector element=", myDat[i], "\n")
}

#dont do anything in the for loop unless you have to!

myDat <- vector(mode="numeric", length=10)
for (i in seq_along(myDat)) {
  myDat[i] <- signif(runif(1), digits=2)
  #dont do this in a loop
  cat("loop number =", i, "vector element=", myDat[i], "\n")
}
#dont change  object dimension in loop 
# c, cbind, rbind, list

myDat <- runif(1)

for (i in 2:10) {
  temp <- signif(runif(1), digits = 2)
  myDat <- c(myDat, temp)
  cat("loop number =", i, "vector element=", myDat[i], "\n")
}
myDat
#------------------------------------------------------------

#dont write a loop if u can vectorize 

myDat <- 1:10
for (i in seq_along(myDat)){
  myDat[i] <- myDat[i] + myDat[i]^2
  cat("loop number =", i, "vector element=", myDat[i], "\n")
}
z<-1:10
z <- z + z^2
z
  
z <- c(10,2,4)
for (i in seq_along(z)){
  cat("i=", i, "z[i]=", z[i],"\n")
}

# counter variable retains its final value 
i
#use "next" to skip elements in a loop
#operate only on odd numbered elements
z <- 1:20
#zstore <- vector(mode="numeric", length=length(z))
zstore <- rep(NA, length(z))
zstore
for (i in seq_along(z)) {
  if( i %% 2==0) next
  print(i)
  zstore[i] <- i 
}
zstore <- zstore[complete.cases(zstore)]

z<- 1:20
zsub <- z[z %% 2!=0]
length(zsub)
for (i in seq_along(zsub)) {
  cat("i=", i , "zsub[i]=", zsub[i], "\n")
}
