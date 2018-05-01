#Network d3 is a great way to continue using hmtl widget to create interactive grpahing 
#Here are three graphs we can make with the networkD3 package
#Simple network graphs
#Create a random set of data. We need target and a source
 
library(networkD3)
src <- c("A", "A", "A", "A",
         "B", "B", "J", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)
#plot
simpleNetwork(networkData)

#We can make even more complicated graphics as well
#Force network graphics 
#Using the built in data set "misNodes" and "misLinks" 
#based on characters and their interactions from Les Miserables
#Load data
data(MisLinks)
data(MisNodes)
#look real fast
MisNodes
MisLinks
#Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)
