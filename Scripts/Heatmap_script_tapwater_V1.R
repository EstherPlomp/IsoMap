#IsoMap script by Esther Plomp and Joshua Peterson: https://github.com/EstherPlomp/IsoMap 


#install and load the required packages 
if (!require(pheatmap)){ install.packages('pheatmap')}
library(pheatmap)


#import the sorted dataset so that the values displayed are sorted rather than randomly distributed
path = choose.files(default = "", caption = "Select the sorted tapwater dataset") #Database_tapwater_sort.csv
mydata = read.csv(path, sep = ";" , row.names = NULL) 

#matrix creation
mymat <- matrix(mydata$X87Sr.86Sr, ncol=1)
mymat= matrix(as.numeric(gsub(",", ".", gsub("\\.", "", mydata$X87Sr.86Sr))), ncol=1) #Remove stupid comma's!!!!
colnames(mymat) <- "SR-ratio"
rownames(mymat) <- mydata$Sample.ID

mydf <- data.frame(row.names = mydata$Sample.ID, category = mydata$Province)

colnames(mydf)<- "Province"

#Specify colors of the province category
ann_colors = list(
  Province = c(Drenthe = "#94fdfd", Flevoland = "#a3c6c2", Friesland = "#6faaa3",Gelderland = "#1a564f", Groningen = "#44857d", 
               Limburg = "#167070", Noord_Brabant = "#316161", Noord_Holland = "#289c9c", Overijssel = "#a3c6c2", Utrecht = "#35d8d8",
               Zeeland = "#91ffe6", Zuid_Holland = "#44ae9b")
)

# with gaps between the province categories (numbers are where the gaps start)
pheatmap(mymat, border_color = 'black', main = "Sr-Ratio", show_colnames = F, cellwidth = 30, cellheight = 5, fontsize_row = 7 ,cluster_cols = F, cluster_rows = F, annotation_row = mydf ,annotation_colors = ann_colors ,gaps_row = c(9, 15, 20, 35, 43, 70, 82, 93, 104, 120, 125))
