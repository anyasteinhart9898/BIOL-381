#Kyle Dittmer 
#02 May 2018
install.packages("lubridate") 
library(lubridate)

#use base R

date<- as.POSIXct("02-05-2018", format="%d-%m-%Y", tz="UTC")
# use lubridate
date- dmy("01-05-2018", tz="UTC")
#using base R

date <- as.POSIXct(format(date, "%Y-2-%d", tz="UTC"))

month(date) <- 2

date<- dmy("02-05-2018", tz="America/New_York")
date <- date - days(29)
date

dmy(c("31.12.2010", "01.01.2011"))
dmy(180502)

span <- interval(ymd("2009-01-01"), ymd("2009-08-01"))
as.duration(span)

diff<- make_difftime(days=150)
as.interval(diff,ymd=("2018-05-02"))
            
 
#determine what date it is
x <-as.Date("2009-09-02")
wday(x)
yday(x)

wday(ymd(180502))
wday(ymd(180502),label=TRUE, abbr=FALSE)

wday(ymd(180502) + days(-2:3),label=TRUE, abbr=FALSE)

duration(1.5, "days")
duration(second=3, minute=3.5, hour=2, day=6, week=1)
duration("2d, 2H,2M,2S")

leap_year(2008)

#Create objects of a class date
make_datetime(year=1999, month=12,day=22,hour=c(10,11))

x <- seq.Date(as.Date("2009-08-02"), by="year", length.out = 2)       
x
pretty_dates(x,12)
#Create time stamps
M <- ymd_hms("2018-05-01 10:00:00", tz= "America/New_York") + weeks(0:6)
stamp("May 1, 2018")(M)
meeting <- stamp("Meet with Carol on Tuesday, May 1, 2018 at 10:00")                
#--------------
date <- ymd("2019-01-01")
month(date) <- 11
wday(date, label = TRUE)
date<-date+ days(6)
date + weeks(3)
