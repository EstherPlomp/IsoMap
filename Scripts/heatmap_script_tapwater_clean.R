library(pheatmap)
library(RColorBrewer)


mydata = read.csv("Database_tapwater_sort2.csv", sep = ";" , row.names = NULL) 

#Color Palette

my_palette <- brewer.pal(11, 'Spectral')
my_palette_province <- colorRampPalette(c("#48F0E0", "#89c541" , "#449644" , "#0f8040" , "#9ad2ad"  , "#058457" , "#61bc5c" , "#5ab191" , "#1eb280" , "#43e4a9" , "#93d2bf" , "#9bd291" ))(n = 12)


#matrix creation
mymat <- matrix(mydata$X87Sr.86Sr, ncol=1)
mymat= matrix(as.numeric(gsub(",", ".", gsub("\\.", "", mydata$X87Sr.86Sr))), ncol=1) #DIE stupid comma's!!!!
colnames(mymat) <- "SR-ratio"
rownames(mymat) <- mydata$Sample.ID

mydf <- data.frame(row.names = mydata$Sample.ID, category = mydata$Province)

colnames(mydf)<- "Province"

#Specify colors
ann_colors = list(
Province = c(Drenthe = "#48F0E0", Flevoland = "#89c541", Friesland = "#449644",Gelderland = "#0f8040", Groningen = "#9ad2ad", 
             Limburg = "#058457", Noord_Brabant = "#61bc5c", Noord_Holland = "#5ab191", Overijssel = "#1eb280", Utrecht = "#43e4a9",
             Zeeland = "#93d2bf", Zuid_Holland = "#9bd291"))


# add row annotations
pheatmap(mymat, border_color = 'black', cluster_cols = F, cluster_rows = F, annotation_row = mydf)

# with gaps
pheatmap(mymat, border_color = 'black', main = "Sr-Ratio", show_colnames = F, cellwidth = 30, cellheight = 5, fontsize_row = 7 ,cluster_cols = F, cluster_rows = F, annotation_row = mydf ,annotation_colors = ann_colors ,gaps_row = c(9, 15, 20, 35, 43, 70, 82, 93, 104, 120, 125))
