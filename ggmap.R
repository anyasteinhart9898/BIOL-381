# ggmap with alex
install.packages("ggmap")
install.packages("rgdal")
install.packages("foreign")

library(ggmap) # automatically loads ggplot
library(rgdal) # automatically loads sp (Cheat sheet for sp : http://rspatial.r-forge.r-project.org/gallery/)
#sp is also used for plotting spatial information
library(foreign)
head(read.dbf(file="CountyBoundaries/VTCountyBoundaries.dbf"))
#what is ggmap
#ggmap goed out to differnt map serers 
#raster objects lets you plot on those maps much like ggplot, ccan chancge you coordinate systems and datums
#?ggmap

#some example map fetching
avl <- get_map(location="Asheville, North Carolina")
ggmap(avl)

#Different map types- "terrain", "toner", "watercolor"
avl <- get_map(location = "Asheville", maptype = "watercolor")
ggmap(avl)

#Certain maptypes for certain sources

#different source include google, stamen, OSM, 
avl <- get_map(location="Ashville", maptype="watercolor", source="stamen", zoom=15)
ggmap(avl)

#change the zoom, Whole number, 1 to 21 for google, 1 to 18 for stamen, 
# 1 is the world, 21 or 18 is house level zoom
YD <- get_map("Yaounde, Cameroon", source="google", maptype = "terrain", zoom=11)
ggmap(YD)

# Vermont example with shape files ----------------------------------------

# Get a raster object, overset it with shape file, and add GPS 
# 1. Get the map of VT
VT <- get_map("Salisbury, Vermont", zoom=8, maptype = "roadmap", source="google")
VTMap <- ggmap(VT, extent="normal")
VTMap
# REading in a VT database file of county boundaries from Vermont geodata portal (FREE)
#read.dbf turns your data base file into a data frame
head(read.dbf(file="CountyBoundaries/VTCountyBoundaries.dbf"))
#readOGR is from a rgdal package-- turns your data into a usable spatial vector object
VTcountyB <- readOGR(dsn = "CountyBoundaries/VTCountyBoundaries.shp", 
                     layer="VTCountyBoundaries")
## Reproject you data projection datum 
VTcountyB <- spTransform(VTcountyB, 
                         CRS("+proj=longlat +datum=WGS84"))
#Fortify converting spatial data into a data frame 
fortify(VTcountyB)
#Plot the shape file on raster object 
VTCountyMap <- VTMap+geom_polygon(aes( x=long, y=lat, group=group),
                                      fill="green",
                                      size=.2,
                                      color="black", 
                                      data=VTcountyB, 
                                      alpha=0.3)
VTCountyMap 

# With GPS coorinates -----------------------------------------------------
GPS_Coords <- read.table("GPS_coords.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)
str(GPS_Coords)
VTtownMap+geom_point(data=GPS_Coords, mapping= aes(x=Lon, y=Lat),  
                        color="purple", size=4)
