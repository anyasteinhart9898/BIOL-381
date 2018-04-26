# made4 presentation 
# John Barlow
# 24 april 2018
install.packages("made4")
source("https://bioconductor.org/biocLite.R")
biocLite("made4")
biocLite("BiocUpgrade")                 
library(made4)                
res_mat <- read.csv("res_mat_abun.csv")
bac_mat <- read.csv("bac_mat_abun.csv")
vf_mat <- read.csv("vf_mat_abun.csv")
#Check the structures of the data files- needs teh abundance values to be numeric, and for some reason the data files in csv are integer values are need to be changed
str(res_mat)
str(bac_mat)
str(vf_mat)
#so clean the data by setting all the values to numeric, except not the gene names
str(res_mat)
res_mat_all <- res_mat[,-c(1)]
res_mat_all[] <- lapply(res_mat_all[], as.numeric)
rownames(res_mat_all) <- res_mat$Name
head(res_mat_all)
str(res_mat_all)

none <- lapply(res_mat_all, function(x) all(x==0))
which(none=="TRUE")
#removes these 6 column 
res_mat2 <- res_mat_all[,-c(4,10,11,15,21,24)]
head(res_mat_all)
str(res_mat_all)

#Repeat the rest on the other two data sets
bac_mat_all <- bac_mat[,-c(1)]
bac_mat_all[] <- lapply(bac_mat_all[], as.numeric)
rownames(bac_mat_all) <- bac_mat$Name
bac_mat2 <- bac_mat_all[,-c(4,10,11,15,21,24)]
head(bac_mat2)
str(bac_mat2)

vf_mat_all <- vf_mat[,-c(1)]
vf_mat_all[] <- lapply(vf_mat_all[], as.numeric)
rownames(vf_mat_all) <- vf_mat$Name
vf_mat2 <- vf_mat_all[,-c(4,10,11,15,21,24)]
head(vf_mat2)
str(vf_mat2)

#minus sign inside the brackets is to EXCLUDE those specified columns 
#made4 function- data is ready to be used
browseVignettes("made4")
# teh package is also contaians a data set of genes expression data 

# made4 has a data over view funciton 

overview(res_mat_2)

res_coa <- ord(res_mat2, type ="coa")
summary(res_coa$ord)
plot(res_coa)
heatplot(res_mat2)

plotgenes(res_coa, nlab=1) #if you include "nlab" you can reduce potential clutter and focus n top of the genes on axis
plotarrays(res_coa, graph = "groups")

do3d <- (res_coa$ord$li)
do3d <- (res_coa$ord$co)

#you can generate a list of the variables (genes) at the end of the axis or gradient
topgenes(res_coa, axis=1, n=5, end="pos")

# and compare lists of top genes at the ends of gradients
a<-topgenes(res_coa, axis=2, n=10, end="pos")
b<-topgenes(res_coa, axis=3, n=10, end="pos")
z<-comparelists(a,b)
print.comparelists(z)
z$intersect
z$Set.Diff

#bacteria and ARGs
c <- cia(bac_mat2, res_mat2)
c$coinertia$RV
#0.445
plot.cia(c)

# virulence and ARGs
c2 <- cia(vf_mat2, res_mat2)
c2$coinertia$RV
#0.647
plot.cia(c2)

# virulence and bacteria
c3 <- cia(vf_mat2, bac_mat2)
c3$coinertia$RV
#0.358
plot.cia(c3)

