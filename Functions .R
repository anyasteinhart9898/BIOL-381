#All about functions
# March 1 2018 
# ALS taught by NJG

#errything is a function 
sum(2,3) # "prefix" function 
3 + 2 #laso a function 
`+`(3,2) # infix function 
#above statements are the same 
y <- 3
`<-` (yy, 3)
print(yy)
print(read.table)
sum
sum #gives function contents
sum(2,3) #function called with inputs 
sum() # uses default function 

#first function (lol) 
##############################################
#FUNCTION: HardyWeinberg
# Calculates Hardy Weinberg alleles frequencies 
#input: alleles frequency  p (0,1)
#output: p and frequencies of AA, BB, AB genotypes
HardyWeinberg <- function(p=runif(1)){
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <-signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits = 3)
  return(vecOut)
}
####################################################################  \
HardyWeinberg()
HardyWeinberg(p=0.5)
p
p<- 0.6
HardyWeinberg(p=p)
p
#first function (lol) 
##############################################
#FUNCTION: HardyWeinberg2
# Calculates Hardy Weinberg alleles frequencies 
#input: alleles frequency  p (0,1)
#output: p and frequencies of AA, BB, AB genotypes
HardyWeinberg2 <- function(p=runif(1)){
  if(p >1.0 | p < 0.0) {
    return("function fails, p out of bounds")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <-signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits = 3)
  return(vecOut)
}
############################################
HardyWeinberg2()
HardyWeinberg2(p=1.1)
temp <- HardyWeinberg2(1.1) 
temp
##############################################
#FUNCTION: HardyWeinberg3
# Calculates Hardy Weinberg alleles frequencies 
#input: alleles frequency  p (0,1)
#output: p and frequencies of AA, BB, AB genotypes
HardyWeinberg3 <- function(p=runif(1)){
  if(p >1.0 | p < 0.0) {
    stop("function fails, p out of bounds")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <-signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits = 3)
  return(vecOut)
}
#####################################
temp <- HardyWeinberg3(1.1)




# undertstanding scope of the local and global variables
myFunc <- function(a=3, b=3){
  z <- a + b
  return(z)
}
myFunc()
myFuncBad <- function(a=3){
  z<- a +bbb
  return(z)
}
myFuncBad()
bbb <- 100
myFuncBad()
#bad coding

#################################
# FUNCTION: fitLinear
#fits linear regression 
#input: Numeric vectors of x and y 
#output slope and p valu e
fitLinear <- function(x=runif(20), y=runif(20) {
  myMod <- lm(y~x) #fits model
  myOut <- c(slope=summary(myMod)$coefficients[2,1], 
             pVal=summary(myMod)$coefficients[2,4])
  plotVar <- qplot(x=x, y=y)
  print(plotVar)
  return(myOut)
}
