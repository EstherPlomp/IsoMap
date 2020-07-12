# IsoMap
Data and script to generate a map of the Netherlands for isotopic analyses (strontium isotopes).

# Motivation
Most maps generated in the current isotopic literature are creating using ArcGIS. The reproducibility of these maps can be improved by using open source software, such as R, and sharing the data and scripts so that others can review and reuse the data/code. 

# Installation
These scripts were generated in R and RStudio (Version 1.2.5019). Required packages: pheatmap, raster, rworldmap, RColorBrewer.

Installation of the packages and loading the data should only take several minutes. 

# How to use
You can run each script separately with the data provided (Kootker et al. 2020), or use your own dataset.

There are two similar scripts running on two seperate datasets (enamel and tapwater). These have both been included to allow anyone to reproduce Figures 7.2 and 7.3 in Plomp 2020.

## Heatmap scripts
Heatmap_script_enamel_V1.R

Heatmap_script_tapwater_V1.R

The heatmap scripts make use of the sorted datasets (Database_enamel_sort.csv), as otherwise the order of the heatmap will be random.

## map scripts
Map_script_enamel_V1.R

Map_script_tapwater_V1.R 

## Examples of the output
Examples of the resulting images using the enamel scripts can be found in the "Images" directory.

### Notes
Mind whether you are using . or , in your dataset (see the #remove comma's comments in the scripts).

# Contributors
Esther Plomp - [EstherPlomp](https://github.com/EstherPlomp) - [0000-0003-3625-1357](https://orcid.org/0000-0003-3625-1357)

Joshua Peterson - [J-PTRson](https://github.com/J-PTRSON) - [0000-0001-5792-2725](http://orcid.org/0000-0001-5792-2725)

# License
This project is licensed under the MIT License - see the LICENSE.md file for details.

# How to cite?
Plomp, E. and Peterson, J. C., 2020 IsoMAP, DOI *To be added*

# Related References 
## Dataset: 
Kootker, L. M., Plomp, E., Ammer, S. T. M., Hoogland, V. and Davies, G. R. 2020. Spatial patterns in 87Sr/86Sr ratios in modern human dental enamel and tap water from the Netherlands: Implications for forensic provenancing, https://doi.org/10.1016/j.scitotenv.2020.138992 

## Figures 
Plomp, Esther. 2020. Unlocking Teeth: Development and application of isotopic methods for human provenance studies. PhD thesis, Vrije Universiteit Amsterdam. https://doi.org/10.5281/zenodo.3929551

