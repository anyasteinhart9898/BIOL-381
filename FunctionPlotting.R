#plotting functions, sweeping parameters, 
# 20 MArch 2018
#NJG

# use differing numbers of matrix rows and columns 

z <- matrix(runif(9), nrow=3)
z[3,3]
z <- matrix(runif(20), nrow=5)
z[5,4]
z[4,5]

#using double for loops
m <- matrix(round(runif(20), digits = 2),nrow = 5)
m
#looping over row
for(i in 1:nrow(m)){
  m[i,] <- m[i,]+1 #says operate on the whole row, takes value wn matrix, and add the value of the index (in this case it will add one) 
}
m

for (j in 1:ncol(m)) {
  m[,j] <- m[,j] +j
}
m
j

#loop over rows and columns
for (i in 1:nrow(m)) {
  for (i in 1:ncol(m)){
    m[i,j] <- m[i,j]+i+j
  } #end of column loop 
} # ends row loop
m

# sweeping over parameters in an equation 
# S=cA^z z and c the parameters

###########################
# Function: SpeciesAreaCurve
# creates power function for relationship of s and a 
# input: A= vector of island area 
#       c= intercept constant
#       z=slope constant  
# output: S= vector of species richness
#--------------------------------
SpeciesAreaCurve <- function(A=1:5000, 
                             c=0.5,
                             z=0.25) {
  S <- c*(A^z)
  return(S)
}
#head(SpeciesAreaCurve())

###########################
# Function: SpeciesAreaPlot
# plot curve in base graphics 
# input: A= vector of areas
#        c = intercept parameter
#        z = slope 
# output: base graph with parameter values 
#--------------------------------
SpeciesAreaPlot <- function(A=1:5000,
                            c=0.5,
                            z=0.26) {
plot(x=A, y=SpeciesAreaCurve(A,c,z), #base graphics need a lot of parameters
       type="l", #l=line
       xlab="Island Area",
       ylab="S",
       ylim=c(0,2500))
  mtext(paste("c=", c,"z=",z),cex = 0.7) #margin text, brings in graphic
  return()
}

SpeciesAreaPlot()

# now build a grid of plots 
#each with a different parameters values
# global variables
cPars <- c(100,150,175)
zPars <- c(0.10,0.16, 0.26, 0.30)
par(mfrow=c(3,4)) # ugly 

#enter into a DOUBLE loop for plotting 
for (i in 1:length(cPars)) {
  for (j in 1:length(cPars)) {
    SpeciesAreaPlot(c=cPars[i], z=zPars[j])
  }
}
par(mfrow=c(1,1))
# plotting redox with ggplot
library(ggplot2)
cPars <- c(100,150,175)
zPars <- c(0.10,0.16, 0.26, 0.30)
Area <- 1:5

#set upp model frames
modelFrame <- expand.grid(c=cPars,
                          z=zPars,
                          A=Area)
str(modelFrame)
print(modelFrame)
modelFrame$S <- NA
modelFrame
#tricky double loop for filling new data frame

for (i in 1:length(cPars)){
  for(j in 1:length(zPars)){
    modelFrame[modelFrame$c==cPars[i] & modelFrame$z==zPars[j],"S"] <- SpeciesAreaCurve(A=Area, c=cPars[i], z=zPars[j])
  } #close z par loop
} #close c par loop
modelFrame
p1<- ggplot(data=modelFrame)
p1 + geom_line(mapping=aes(x=A, y=S))+ facet_grid(c~z)

p2<-p1
p2 + geom_line(mapping=aes(x=A, y=S, group=c))+ facet_grid(.~z)
