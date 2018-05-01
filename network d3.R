install.packages("networkD3")
library(networkD3)
library(networkD3)

# Create fake data
src <- c("Alkaid", "Alioth", "Alioth", "Megrez",
         "Phecda", "Merak", "Dubhe")
target <- c("Mizar", "Megrez", "Phecda",
            "Merak", "Dubhe", "Megresz")
networkData <- data.frame(src, target)

# Plot
simpleNetwork(networkData)


# Load data
data(MisLinks)
data(MisNodes)

# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)

