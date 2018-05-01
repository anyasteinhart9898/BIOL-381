
#this is super maybe as well but we are chilling
#Like scatter d3, the network d3 package can create html widget with network graphs.
library(networkD3)
#Creating a simple graph

MisLinks
MisNodes
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)

sankeyNetwork(Links=MisLinks, Nodes=MisNodes, Source="source",
              Target ="target", Value="value",
              NodeID = "name", fontSize = 12, nodeWidth = 25, height=700, width=1000)
              