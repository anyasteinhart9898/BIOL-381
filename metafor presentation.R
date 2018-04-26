install.packages("metafor")
library(metafor)

dat <- dat.normand1999
dat

SMDdat <- escalc(measure = "SMD", m1i=m1i, sd1i = sd1i, n1i=n1i, m2i=m2i, sd2i = sd2i, n2i=n2i, data=dat)

myModel <- rma(yi,vi, data=SMDdat)
print(myModel)

dat <- dat.curtis1998
head(dat.curtis1998)

dat <- dat.mcdaniel1994
Zdat <- escalc(measure="ZCOR", ri=ri, ni = ni, data=dat)
head(Zdat)
myModel <- rma(yi, vi, data=Zdat)
print(myModel)
