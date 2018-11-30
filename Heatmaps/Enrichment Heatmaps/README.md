# Functional Enrichment Heatmap

## Required files
File1: List of functional enrichment terms to display on heatmap without a header

See "list_of_terms.txt" in excel for an example

File 2: data frame of functional enrichment terms and corresponding FDR
The file should be a tab delimited text file and the first column should contain the functional enrichment terms. This file must contain the corresponding terms found in "list_of_terms.txt". Subsequent columns should contain the -log(FDR) value for each functional enrichment term for different conditions (timepoint, stim_vs_nostim, etc). 

View "FDR.txt" in Excel for an example

## Modifications to the heatmap script
1. Copy heatmap_enrichment.R in working directory using nano
```
nano heatmap_enrichment.R
```
2. Merge by correct header. In line 26, make sure "by.y" is correctly defined using the header label of the list of terms in "FDR.txt" file.

3. Define conditions. In line 31, list header labels of the -log(FDR) columns to be visualized in the heatmap
```
###example
heat <- cbind(Day0, Day4)
heat <- cbind(nostim, stim)
```
4. Optional: can change color of heatmap in line 12
```
###example
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
hmcol <- colorRampPalette(brewer.pal(9, "RdBu"))(100)
```

## Run the script under the directory containing "list_of_terms.txt" and "FDR.txt"
```
Rscript heatmap_enrichment.R list_of_terms.txt FDR.txt name_of_heatmap
```
