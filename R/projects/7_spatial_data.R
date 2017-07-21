if(!require(rgdal)) install.packages("rgdal")
setwd("data/shp_global110")  # set working directory 
getwd() # print working directory

## use readOGR(dsn, layer) to read shapefile
land <- readOGR(".", "110m_land")   # "." represents current working directory
admin <- readOGR(".", "110m_admin_0_countries")

plot(land)
class(land)
#str(land)

# access some information about this object
proj <- proj4string(land)	# get the projection / coordinate reference system
proj

bbox(land)	# bounding box
land@bbox

xy <- coordinates(land)	# coordinates
summary(xy)
points(xy, pch=16,col="red")	# These are only the centre coordinates of the polygons!

# access the attribute table of a vector dataset with @data
data.df <- land@data
library(knitr)
kable(head(data.df,10))
summary(data.df)


setwd("data/shp_global110") 
getwd()
files <- list.files(pattern=".shp")
files	# filenames of the files to be read

world <- readOGR(".","110m_land")
plot(world,col="grey",border="blue",bg = "lightblue")
plot(admin,add=TRUE)

lakes <- readOGR(".","110m_lakes")
plot(lakes,add=TRUE,col = "blue")

ocean <- readOGR(".","110m_ocean")
plot(ocean,add=TRUE,col = "lightblue")


setwd("output") 
getwd()

library(rgdal)
writeOGR(land,dsn = ".",layer = "land",driver="ESRI Shapefile",overwrite_layer = TRUE)
shp <- readOGR(dsn = ".", layer = "land")
plot(shp)


bbox(shp)
proj4string(shp)
xy <- coordinates(shp)
df <- shp@data
names(df)
names(xy)
slotNames(shp)
plot(shp)
points(xy, pch=16,col="red")


library(rgdal)
setwd("data/shp_global110") 
folder <- getwd()
shp <- readOGR(dsn = folder,layer = "continent")
plot(shp,col="grey")

plot(shp,lwd=2,add=TRUE)
df <- shp@data
library(knitr)
kable(head(df,10))

sel <- df$CONTINENT == "North America"
plot(shp[sel,])


setwd("data/gimms_ndvi/")
getwd()
if(!require(ncdf4)) install.packages("ncdf4")
library(ncdf4)
library(raster)
ndvi <- raster("GIMMS.NDVI.360.720.2000.2002.30days.nc")
ndvi
plot(ndvi)
str(ndvi)


nrow(ndvi)
ncol(ndvi)
ncell(ndvi)
extent(ndvi)
bbox(ndvi)
res(ndvi)
projection(ndvi)


setwd("data/gimms_ndvi/")
getwd()
ndvi.rb <- brick("GIMMS.NDVI.360.720.2000.2002.30days.nc")
ndvi.rb
ndvi2000 <- ndvi.rb[[1:12]] # select bands as a new raster
plot(ndvi.rb)      # plot all bands
plot(ndvi.rb,6)    # plot a single band
plot(ndvi.rb,1:12) # plot selected bands


plot(ndvi.rb,1) 
#values <- click(ndvi.rb, n=1, xy=TRUE)	
#values <- click(ndvi.rb, n=1, xy=FALSE)
values <- ndvi.rb[50,50]
plot(as.vector(values), type="b")

