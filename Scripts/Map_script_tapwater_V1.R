#IsoMap script by Esther Plomp and Joshua Peterson: https://github.com/EstherPlomp/IsoMap 


#install and load the required packages 
if (!require(raster)){ install.packages('raster')}
if (!require(rworldmap)){ install.packages('rworldmap')}
if (!require(RColorBrewer)){ install.packages('RColorBrewer')}
library(raster)
library(rworldmap)
library(RColorBrewer)


#set the colours for the provinces & datapoints
my_palette_data <- colorRampPalette(rev(brewer.pal(n = 7, name ="RdYlBu")))(100) #Pheatmap//Default
my_palette_province <- colorRampPalette(c("#94fdfd", "#a3c6c2" , "#6faaa3" , "#1a564f" , "#44857d" , "#ffffff" , "#167070" , "#316161" , "#289c9c" , "#004252" , "#35d8d8" , "#91ffe6" , "#ffffff" , "#44ae9b" ))(n = 14)

#Import the dataset 
path = choose.files(default = "", caption = "Select the tapwater database") #Database_tapwater.csv
mydata = read.csv(path, sep = ";" , row.names = NULL) 

#Matrix creation
Longitude= as.numeric(gsub(",", ".", gsub("\\.", "", mydata$Longitude..WGS84.)))
Latitude= as.numeric(gsub(",", ".", gsub("\\.", "", mydata$Latitude..WGS84.)))
SR_ratio = as.numeric(gsub(",", ".", gsub("\\.", "", mydata$X87Sr.86Sr))) #Remove stupid comma's!!!!

mymat <-matrix(c(Longitude,Latitude,SR_ratio), ncol = 3)
colnames(mymat) <- c("Longitude", "Latitude", "SR_ratio")

mymat <- as.data.frame(mymat)

##  Get map of provinces (level 1 admin regions)
NetherlandsLevel1<- raster::getData("GADM", country = "Netherlands", level = 1)

## plot map (change NAME_1 to the data you want to plot)
Nederland <- mapPolys(NetherlandsLevel1, nameColumnToPlot="NAME_1", mapTitle = "Dutch tap water" , addLegend=F, colourPalette = my_palette_province)
do.call( addMapLegendBoxes, c(Nederland, x = "right", title = "Province", cex = 0.9, pt.cex = 2))

## plot points onto map
mymat$Col<-my_palette_data[as.numeric(cut(mymat$SR_ratio, breaks = 100, inlcude.lowest = T))]
points(mymat$Longitude, mymat$Latitude, bg = mymat$Col, cex = 2, pch = 21, lwd=2)


## add text labels for provinces
#text(NetherlandsLevel1, label="NAME_1", cex=1)

