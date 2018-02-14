## Basic R coding and usage
## 30 january 2018
## ALS
library(ggplot2)
#using the assignment operator 
x <- 5 #preferred 
print(x)
y = 4 #legal but not used except in function 
y= y +1.1 
y <- y+1
plantHeight <- 5.5
#--------------------------------------------------{end class}

# The combine function
z <- c(3,7,7,10) # simple atomic vector 
print(z)
typeof(z) #get variable type (double is numbers) 
str(z)  # get structure of the variable
is.numeric(z) # logical test for variable type
is.character(z)


# c always "flattens" to an atomic vector 

z <- c(c(3,4), c(5,6))
print(z)
# character strings with single or double quotes 
z <- c("perch", "bass", "trout", "red snapper")
print(z)

#use nboth quote types fpr an internal quote

z <- c("htis is only 'one' character strong", 'a second string')
str(z)

#logical TRUE FALSE 
z <- c(TRUE, TRUE, FALSE)
is.numeric(z)
is.logical(z)

#Three properties of ataomic vectors 
#type of atomic vector
z <- c(1.2,2.2,3.2)
typeof(z)
is.numeric(z)

#length of vector
length(z)

#name of vector element (optional)
z <- runif(5) #random uniforn (0,1)
names(z)

#add names after variable is created 
names(z) <- c("chow", "pug", "beagle", "greyhound", "akita")
print(z)

#add names when variable is built 
z2 <- c(gold=3.3, silver=10, lead=2)
print(z2)
names(z2) <- NULL
print(z2)
names(z2) <- c("copper","Zinc")
print(z2)


#Special data values

#NA for missing values
z <- c(3.2, 3.3, NA)
length(z)
typeof(z[3])
# missing values can trip up basic functions 
mean(z) # does not work 
is.na(z) #checks for missid
!is.na(z) # ! is the NOT
mean(!is.na(z)) #WROOONG- mean of the true false values, 2/3 were true. be clear
mean(z[!is.na(z)]) #do it this way
#-------------------------------
#NaN, Inf -Inf
# bad results from nmumeric calc
z <- 0/0
print(z)
z <- 1/0
print(z)
z <- -1/0
print(z)
z <- 0/1
print(z)
z <- 1/0
typeof(z)
#------------------
#NULL is an object that is nothing 
z <- NULL
typeof(z)
length(z)
is.null(z)
#Three properities of atomic vectors
#coercion
a <- c(2.1, 2.2)
typeof(a)
b <- c("purple", "green")
typeof(b)
d <- c(a,b)
print(d)
typeof(d)
#numbers have been coerced into character strings 
# hierarchy of conversions
#logical -> integers-> double-> character

a <- runif(10)
print(a)
a > 0.5    #logical operation 
temp <- a > 0.5  #hold thsese logical variable 
sum(temp)
# what proportion of the values are >0.5
mean(a>0.5)

# qualify exam question: approx proportion of observation from a normal (0,1) random variable are >2.0
mean(rnorm(1000000)>2.0)
#------------ VEctorization 
z <- c(10,20,30) 
z + 1
y <- c(1,2,3)
z+y #element-by-element matching 

short <- c(1,2)
z + short #what willl happen@
z^2

#creating vectors
#create an empty vector 
z <- vector(mode="numeric", length=0)
print(z)
#add elements to empty vectori
z <- c(z,5) #dont do this in your code
print(z)
#insitead create a vector of predefined length 
z <- rep(NA,100)
z[1] <- 3.3
head(z)
z <- rep(NA, 100) 
head(z)
typeof(z)
z[c(1:20)] <- c("Washington", 2.2) 
typeof(z)
head(z)
z[1:30]

#generate a long list of names 
myVector <- runif(13) #get 100 random uniform 
myNames <- paste("File",seq(1:length(myVector)), ".csv", sep="")
head(myNames)                
names(myVector) <- myNames
head(myVector)
#using rep to repeat elements 

#-----------------------------------------------------------end feb 1 2018 

#---------------------------------------------- Feb 6th 2018
#using rep to repeat elements and create vectors 

rep(0.5,6)
rep("mystring", 3)
#more formal way of command 
rep(x=0.5, times=6)
rep(times=6 , x=0.5)
myVec <- c(1,2,3)
rep(myVec, times=2)
rep(x=myVec, each=2)
rep(x=myVec, times=myVec)
rep(x=1:3, times=3:1)


#seq funciton for creating sequences 
seq(from=2,to=4)
seq(from=2,to=4,by=0.5)
seq(from=2,to=4,length=7)
x <- seq(from=2,to=4,length=7)
1:length(x)
seq_along(x) #faster, better
1:5
seq(1,5)
seq_len(10)
#why are we using seq along 
x <- vector(mode="numeric", length=0)
str(x)
#num(0) is empty vector
1:length(x) #interpreted one to zero 
seq_along(x)
#seq and rep will generate values, give ordered values that are known

#using random numbers
runif(1)
set.seed(100)
runif(1)
runif(n=5, min=100,max=200)
library(ggplot2) #graphics library
z <- runif(n=1000,min=30,max=300)
qplot(x=z)


#random normal values
z <- rnorm(1000)
qplot(x=z)
z <- rnorm(n=1000, mean=30, sd=20)
qplot(x=z)

#use sample function to draw from existing vector 

longVec <- seq_len(10)
longVec
sample(x=longVec)
sample(x=longVec, size=3) # Sample withoyt replacement 
sample(x=longVec,size=3, replace=TRUE)
myWeights <- c(rep(20,5), rep(100,5))
myWeights
sample(x=longVec, replace=TRUE, prob=myWeights) 

sample(x=longVec,replace=FALSE, prob=myWeights)

#subsetting of atomic vectors
z <- c(3.1,9.2, 1.3, 0.4, 7.5)
#Subsetting on positive index values
z[2]
z[c(2,3)]

#ssubset on negative index values 
z[-c(2,3)]

#subset by creating a boolean vector to select elements to meet a condition 
z<3
z[z<3]
#ABove, got only the individual elements that satisfed z<3
which(z<3)
#"which" gives us actual locations of the elements thar satisfy the command, unless with the bracket as three lines below gives us values
myCriteria <- z<3
z[myCriteria]
z[which(z<3)]
zx <- c(NA,z)
zx[zx<3] #missing value is retained 
zx[which(zx<3)] #missing value is dropped

#keeps entire vector
z[]
z[-(length(z):(length(z)-2))] #- in front is get rid of what is in brackets and give me what is left. in bracket it "says"- give me elements from 5 to three, bu then get ride of it 
#subset on names of vector elements 
z
names(z) <- letters[seq_along(z)]
z
z[c("b","d","e")]

#arithmetic operators 
10+3
10-3
10*3
10/3
10^3
log(10)
log10(10)


#modulus operator (remainder)
10%%3

#interger division 
10%/%3

#generate the set of all numbers from 1 to 100 that are divisible by 9? the fuckkk- remainder value thing 

q <- seq_len(100)
q[q%%9==0]
#-------------------------------------END CLASS FEB 6 

#--------------------------------------- Begin class feb 8 

#relational operators 
#all return a boolean 
3<4
3>5:7
3 >= 3
3<=3
3==4 #DOUBLE !!!!
3 = 4 #throws an error 
3 != 4 # != not equal to 

#set operator s
#compare two atomic vectors 
#return one atomic vector 
#always strip out duplicate elements 
# Before the comparisons 

i <- c(1,1:7)
print(i)
j <- 3:10
print(j)

union(i,j) #all elements
intersect(i,j) #common elements
setdiff(i,j) #unique elements of i not j 
setdiff(j,i) #unique elements of j not in i 

#set of operators that return a single boolean (T or F) 
setequal(i,j) #asking if they are same 
setequal(i,i)
is.element(i,j) #compare elements one at a time in i to j 
is.element(j,i) #(or i %in% J)

# Logical operators
z <- 10:20
z<15
z < 20 & z >17 #when ran, goes thru each one #AND operator 
z <20 | z>17 #OR operator 
#atomic vector- all elements must be same type, and are one dimension 
