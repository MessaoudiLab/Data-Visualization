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
2. 
- nano mastersheet and paste file 2

## Use the script heatmap_enrichment.R
- change the cbind to the titles of the distinguising columns
- Ex: (MARV_unique, MARV_EBOV, EBOV_unique)

## Run the script under the directory containing "list_of_terms.txt" and "FDR.txt"
```
Rscript heatmap_enrichment.R {file1} {file2} name_of_heatmap
```
