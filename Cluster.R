install.packages("cluster")
install.packages("factoextra")
install.packages("NbClust")

library(cluster)
library(factoextra)
library(NbClust)
library(ggplot2)

#preapre data
iris.scaled <- scale(iris[,-5])
head(iris.scaled)

#Step 1: do Clusters exist?
Hopkins <- get_clust_tendency(iris.scaled, 
                              n=nrow(iris.scaled) -1,
                              seed=123)
#Step 2 DO U UNDERSTAND THIS AT ALL I DONT
Hopkins$hopkins_stat
distgower <- daisy(iris.scaled, 
                   metric= "gower", 
                   stand=TRUE)
DistanceMap <- fviz_dist(dist.obj = distgower, 
                         show_labels = TRUE, 
                         lab_size = 4)
DistanceMap
#Step 3: Cluster using k means
set.seed(123)
km.res <- kmeans(iris.scaled,
                 centers=6, 
                 iter.max=250, 
                 nstart = 25)
head(km.res)                  

fviz_cluster(km.res, 
             data=iris, 
             choose.var=c("Sepal.Length", "Petal.Width"),
             stand = TRUE)
#Whats the right number of clusters
#Method one - elbow methold
fviz_nbclust(iris.scaled, 
             FUNcluster = kmeans,
             method="wss")
#Method 2: silhouette method
fviz_nbclust(iris.scaled, 
             kmeans,
             method="silhouette") + theme_classic()
#MEthod 3- GAP stat
fviz_nbclust(iris.scaled, 
             kmeans,
             nstart=25,
             method="gap_stat", 
             nboot=500)
#Method4 test all
nb <- NbClust(iris.scaled, 
              distance="euclidean", 
              min.nc = 2,
              max.nc = 10, 
              method = "kmeans")
#Validating results
km.res <- eclust(iris.scaled, 
                 stand=FALSE, 
                 "kmeans", 
                 hc_metric = "manhattan", 
                 k=3)
fviz_silhouette(km.res, palette="jco")
#Approach 2: Hierarchical Cluster
res.agnes <- agnes(x=distgower, 
                   diss=TRUE, 
                   stand=TRUE,
                   metric = "euclidiean",
                   method= "ward")
fviz_dend(res.agnes, 
          cex=0.6)
nb <- NbClust(iris.scaled, 
              distance="euclidean", 
              min.nc = 2,
              max.nc = 10, 
              method = "ward.D2")
fviz_dend(res.agnes, 
          cex=0.6,
          k=2, 
          rect=TRUE)
# Visualizing Dendrograms
fviz_dend(res.agnes, 
          k=2, 
          k_colors = "jco",
          type="phylogenic", 
          repel= TRUE, 
          phylo_layout = "layout.gem")
fviz_dend(res.agnes, 
          k=2, 
          k_color ="jco",
          type="circular")
#Calculate p value 
install.packages("pvclust")
library(pvclust)    
data("lung")
ss <- sample(1:73, 30)
newdata<- lung[,ss]
res.pv <- pvclust(newdata, method.hclust = "average", 
                  method.dist = "correlation",
                  nboot=300)
plot(res.pv)
