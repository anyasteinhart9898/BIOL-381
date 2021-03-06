# basic code for batch processing 
# 27 March 2018 
# NJG

###########################
# Function: FileBuilder
# create a set of random files for regression 
# input:fileN = number of files to create, 
#       fileFolder = name of the folde for random files, 
#       fileSize= c(min,max) number of rows in file 
#       fileNA = number on average of NA per column     

# output:set of random files
#--------------------------------

FileBuilder <- function(fileN=10,
                        fileFolder="RandomFiles/",
                        fileSize= c(15,100),
                        fileNA=10){
for (i in seq_len(fileN)) {
  fileLength <- sample(fileSize[1]:fileSize[2], size=1)
  varX <- runif(fileLength) #random x values
  varY <- runif(fileLength) #random y values
  dF <- data.frame(varX, varY) #bind to data
  badVals <- rpois(n=1,lambda=fileNA) #number of NA 
  dF[sample(nrow(dF), size=badVals),1] <- NA
  dF[sample(nrow(dF), size=badVals),2] <- NA
  # create a consecutive file name for this data set
  fileLabel = paste(fileFolder, 
                    "ranFile",
                    formatC(i,
                    width = 3,
                    format = "d",
                    flag = "0"), 
                    ".csv", sep="")
  # Set up data file and incorporate time stamp 
  # and minimal metadata
write.table(cat("# Simulate random data file ", 
                "for batch processing", "\n", 
                "# timestamp: ", as.character(Sys.time()),"\n",
                "#ALS", "\n",
                "#---------------------------", "\n", 
                "\n", 
                file = fileLabel, 
                row.names="", 
                col.names="", 
                sep = ""))
#add data frame now 
write.table(x=dF, 
            file = fileLabel,
            sep= ",",
            row.names= FALSE,
            append = TRUE)
}
}


###########################
# Function: regStats
# fit linear model, get regression stats
# input: 2-column data frame 
# output: slope, p value, and r2
#--------------------------------
regStats <- function(d=NULL) {
            if(is.null(d)) { 
              xVar <- runif(10)
              yVar <- runif(10)
              d <- data.frame(xVar, yVar)
            }
  . <- lm(data=d,d[,2]~d[,1])
  . <- summary(.)
  statsList <- list(Slope=.$coefficients[2,1], 
                    pVal = .$coefficients[2,4], 
                    r2=.$r.squared)
  return(statsList)
} #close functions
regStats()
##----------
# Start of body or programs
library(TeachingDemos)
char2seed("Freezing March")
#--------------------------
# Global variabes 
fileFolder <- "RandomFiles/"
nFiles <- 100
fileOut <- "StatsSummary.csv"

#create 100 random data
FileBuilder(fileN=nFiles)

########## New code for the day 

fileNames <- list.files(path = fileFolder)
#create a data frame to hold file summary stats
ID <- seq_along(fileNames)
fileName<- fileNames
slope <- rep(NA, nFiles)
pVal <- rep(NA, nFiles)
r2 <- rep(NA, nFiles)


statsOut <- data.frame(ID,fileName,slope,pVal,r2)

#batch processing by looping through individual files 
for (i in seq_along(fileNames)) { 
  data <- read.table(file=paste(fileFolder, fileNames[i], sep=""), 
                     sep=",",
                     header=TRUE) #read in next file
        dClean <- data[complete.cases(data),] #getclean cases
        . <- regStats(dClean) # pull regression stats from clean file
        statsOut[i,3:5] <- unlist(.) #unlist, copy into last three columns 
}
#set up output and incorporate time stamp and minimal meta data 
write.table(cat("# Summary stats for ",
                "batch processing of regression models","\n",
                "# timestamp: ",as.character(Sys.time()),"\n",
                "# NJG","\n",
                "# ------------------------", "\n",
                "\n",
                file=fileOut,
                row.names="",
                col.names="",
                sep=""))
# now add data frame
write.table(x=statsOut, 
            file=fileOut,
            row.names=FALSE,
            col.names=TRUE,
            sep=",",
            append=TRUE)
          
          
          
        
          
        
          


