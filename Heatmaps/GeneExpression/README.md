# Heatmaps
## Required files
File1: List of genes to display on heatmap without a header

See "list_of_genes.txt" in excel for an example

File 2: Normalized reads
The file should be a tab delimited text file that contains the normalized count data. Within the data frame, the row names should be an array of gene names, and the column names should be an array of the individual observation points per time point per replicate. This file must contain the corresponding gene IDs found in "list_of_genes.txt"

View "rpkm.txt" in Excel for an example

## Modifications to the heatmap script
Before running the heatmap script, edit the "heatmap.R" script using nano
```
nano heatmap.R
```

The only parameters you need to change are: 1) the "merge_raw" object: by.y will correspond to what you've manually labeled the Gene ID column in the "rpkm.txt" file; 2) the "heat" object: change names corresponding the header labels for each sample

## Run heatmap.R
```
Rscript heatmap.R {File1} {File2} nameofheatmap_prefix
```
