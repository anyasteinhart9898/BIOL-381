#Using open air package for time series
#25 April 2018
#WBG 

#analyze air pollution 
#good over 4 plotting function
# summaryPlot: getting to know your dataset 
# windRose: for wind speed and direction
# timePlot: multiple line graphs for time series (before I knew about patchwork...)
# calendarPlot: calendar days with wind direction and intensity- wind and water qual

# Preliminaries 
library(openair)
library(dplyr)
#load the data set
dbBuoy <- read.csv("HF_MB_forOpenAir.csv")
head(dbBuoy)
#need date and time in correct format
dbBuoy$date <- as.POSIXct(strptime(dbBuoy$timestamp,format = "%m/%d/%Y %H:%M", tz = "Etc/GMT-4"))
head(dbBuoy)

#Summary Plot
#missing days of data, summary stat, distribution of data 
summaryPlot(select(dbBuoy,date, windSpeed, CHL_CONC, PC_RFU, wTEMP))
summaryPlot(select(dbBuoy,date, windSpeed, CHL_CONC, PC_RFU, wTEMP), period = "months", avg.time="week")

#time plot
#Same y axis
timePlot(dbBuoy,pollutant=c("wTEMP", "PC_RFU", "CHL_CONC"))
#all on one plot
timePlot(dbBuoy,pollutant=c("wTEMP", "PC_RFU", "CHL_CONC"), group = TRUE)
#Diff y-axis and stack them 
timePlot(dbBuoy,pollutant=c("wTEMP", "PC_RFU", "CHL_CONC"), y.relation = "free", ref.y=list(h=8, lty=5), name.pol=c("temp (C)", "PC (RFU_)", "ch1 (ug/L)"))


#wind rose
windRose(dbBuoy, ws="windSpeed", wd="windDir", type="season")

#calenderPlot
dbBuoy <- rename(dbBuoy,wd = windDir,  ws = windSpeed)
calendarPlot(dbBuoy, pollutant = "PC_RFU")
calendarPlot(dbBuoy, pollutant = "PC_RFU", annotate = "ws", cols = c("white", "dodgerblue", "dodgerblue3", "dodgerblue4"))
calendarPlot(dbBuoy, pollutant = "ws", annotate = "wd")
