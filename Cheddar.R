#Cheddar 
# 25 April 2018
# LP 
#Load in library
install.packages("cheddar")
library(cheddar)
# load data
data(TL84)

# Properties CSV
# Create a community directory 
dir.create("TL84")
#Create  vectors for each field in properties
title = "Tuesday Lake Sampled in 1984"
N.units = "m^-3"
M.units = "kg"
lat = 46.21667
long = 89.53333
habitat = "Freshwater pelagic"
#making a data frame with vectors
properties <- data.frame(title, N.units, M.units, lat, long, habitat)
properties
# write csv
write.csv(properties, file="TL84/properities.csv", row.names=FALSE)

#Nodes
# create vectors
node=TL84$nodes$node
M = TL84$nodes$M
N = TL84$nodes$N
kingdom = TL84$nodes$kingdom
phylum = TL84$nodes$phylum
class = TL84$nodes$class
order = TL84$nodes$order
family = TL84$nodes$family
genus = TL84$nodes$genus
species = TL84$nodes$species
# data frame
nodes <- data.frame(node,M,N,kingdom, phylum, class,order, family, genus, species)
head(nodes)
#Write csv
write.csv(nodes, file="TL84/properities.csv", row.names=FALSE)

#Trophic.links
#create a vector
resource=TL84$trophic.links$resource
consumer=TL84$trophic.links$consumer

#data frame
trophic.links<-data.frame(resource, consumer)
head(trophic.links)
#write csv
write.csv(trophic.links, file="TL84/trophic.links.csv", row.names=FALSE)
#loading our data set
TL84<-LoadCommunity("./TL84", fn='read.csv')

#load data 
data("ChesapeakeBay")
head(ChesapeakeBay$trophic.links)

# Abundance vs mass with a network connection overlay
PlotNvM(TL84, col=1, pch=19, highlight.nodes=NULL, show.web=FALSE) #We can do this is base R 
PlotNvM(TL84, col=1, pch=19, highlight.nodes=NULL, show.web=TRUE)
PlotNvM(TL84, col=1, pch=19, highlight.nodes='Daphnia pulex')
PlotNvM(TL84, col=1, pch=19, highlight.nodes='Daphnia pulex', 
        highlight.links=TrophicLinksForNodes(TL84, 'Daphnia pulex'))
PlotNvM(TL84, col=1, pch=19, highlight.nodes=c('Daphnia pulex','Trichocerca cylindrica'))
#creates a vector of colors with length equaling the number of nodes

node.names<-TL84$nodes$node
for (i in 1:length(node.names)){
  if(node.names[i]=='Daphnia pulex'){
    node.names[i] <- "red"
  } else if(node.names[i]=='Trichocerca cylindrica'){
    node.names[i] <- "blue"
  } else {
    node.names[i] <- "darkgrey"
  }
}

trophic.links<-TL84$trophic.links
trophic.links$color<-"black"
for (i in 1:nrow(trophic.links)){
  if((trophic.links[i,1] =='Daphnia pulex' | trophic.links[i,2] =='Daphnia pulex' )){
    trophic.links[i,3] <- "red"
  } else if((trophic.links[i,1] =='Trichocerca cylindrica'| trophic.links[i,2] =='Trichocerca cylindrica')){
    trophic.links[i,3] <- "blue"
  } else {
    trophic.links[i,3] <- "grey"
  }
}

PlotNvM(TL84,
        col=node.names,
        link.col=trophic.links$color,
        pch=16,
        highlight.nodes=NULL
)

#Food web by level plot 
#Comparing prey-avergae and chain averaged trophic levels 
par(mfrow=c(1,2))
PlotWebByLevel(TL84, ylim=c(1,5.8),level='PreyAveragedTrophicLevel', main='Prey-averaged',col=1, pch=19,           
                highlight.nodes=NULL) # the mean trophic level of the node's resources, using the matrix inversion method of Levine (1980)
PlotWebByLevel(TL84, ylim=c(1,5.8),level='ChainAveragedTrophicLevel', main='Chain-averaged',col=1, pch=19,           
               highlight.nodes=NULL) # 1 plus the average chain length of all paths from each node to a basal species
# Compare the three different x layouts
par(mfrow=c(1,3))
for(x.layout in c('skinny', 'narrow', 'wide'))
{
  PlotWebByLevel(TL84, x.layout=x.layout, main=x.layout, col=1, pch=19, highlight.nodes=NULL)
}

# Compare the three different x layouts
par(mfrow=c(1,3))
for(x.layout in c('skinny', 'narrow', 'wide'))
{
  PlotWebByLevel(TL84, x.layout=x.layout, main=x.layout, col=1, pch=19, highlight.nodes=NULL)
}


# Compare the effect of staggering levels
par(mfrow=c(1,2))
# No staggering - stagger and max.nodes.per.row are ignored
PlotWebByLevel(TL84, y.layout='compress',col=1, pch=19)
# Stagger
PlotWebByLevel(TL84, y.layout='stagger', stagger=0.1,col=1, pch=19,
               max.nodes.per.row=20)

# Highlight pulex
PlotWebByLevel(TL84, y.layout='stagger', stagger=0.1,col=1, pch=19,highlight.nodes='Daphnia pulex',
               max.nodes.per.row=20)  # just node
PlotWebByLevel(TL84, y.layout='stagger', stagger=0.1,col=1, pch=19, highlight.nodes='Daphnia pulex', highlight.links=TrophicLinksForNodes(TL84, 'Daphnia pulex'), max.nodes.per.row=20) # node and trophic links

#Chesapeake bay data, symbolizing lengths
PlotWebByLevel(ChesapeakeBay, col=1, pch=19, highlight.nodes=FALSE)
#develop a linked line width based on biomass flow
link.lwd=log(ChesapeakeBay$trophic.links$biomass.flow)
# plot food web with link weights
PlotWebByLevel(ChesapeakeBay,
               col=1,
               pch=19,
               highlight.nodes=NULL,
               link.lwd=link.lwd,
               main="Chesapeake Bay Weighted by Flow"
)
