#more basic coding tools for matrices and lists
#8 February 2018
#ALS (taught by gotelli)

library(ggplot2)

#create a matrix from an atomic vector- must vector and whatever I dont know 

m <-matrix(data=1:12, nrow = 4, byrow = TRUE)
m
dim(m) #gives dimensions of the matrix 
dim(m) <- c(6,2) #re dimensioning to 6 by 2 row 
m
dim(m) <- c(4,3)
m
nrow(m)
ncol(m) #gives number of columns
length(m)

#add names to rows, columns 
rownames(m) <- c("a", "b", "c", "d")
m
colnames(m) <- LETTERS[1:ncol(m)]
m

#subsetting in matrix values
print(m[2,3]) #provides value at matrix at that spot? CHARACTER STRING - c(blah)
print(m["b","C"])
print(m[2,]) #leaving empty specifies row 2, all columns 
print(m[,2]) #all rows second coloums 
print(m[,])
print(m[c(1,4), c(1,3)])

rownames(m) <- paste("Species", LETTERS[1:nrow(m)],sep="") 
m
colnames(m) <- paste("Site", 1:ncol(m), sep="")
m

#add names through the dun command with a list
dimnames(m) <- list(paste("Site", 1:nrow(m), sep=""), paste("Species", ncol(m):1,sep=""))
m
#he reversed the names! 

t(m) #flips rows and columns "transposes"

# add a row ro m with rbind 
m2 <- t(m)
m2
m2 <- rbind(m2, c(10,20,30,40))
m2
rownames(m2)[4] <- "Species X"
m2
m2["Species X", c("Site3", "Site4")]

#can always convert this back into an atomic vector
myVec <- as.vector(m)
myVec

#lists are  vectors but each element can hold things of different sizes and different type s

myList <- list(1:10, matrix(1:8,nrow = 4, byrow=TRUE), letters[1:3], pi)
myList
str(myList)

# lists dont behave as you think they should 
myList[4] - 3 #error, brackets give us list item the fuck that means i dont even know 
myList[[4]]
str(myList[[4]])
myList[[4]]

#combine single and double brackets to acccess items 
myList[[2]]
myList[[2]][4,1] #go to my list, pull out second thing, and pull from the second thing that at 4,1

#name list items as we create them 
myList2 <- list(Tester=FALSE, littleM=matrix(1:9,nrow = 3)) #tester is atomic vecture of one 
myList2$littleM[2,3] #get row 2, column 33
myList2[["Tester"]]

m

m[1]
m[4]
length(m)
#------------------------------------End class
#--------------------------------------- Feb 13th 2018


