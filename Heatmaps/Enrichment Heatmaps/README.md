## Generate required files
```
1. List of terms
- Ex: defense to virus, inflammation, etc.

2. Column of terms followed by distinguishing columns with appropriate -log(FDR) values
- Ex: Term, MARV_unique, MARV_EBOV, EBOV_unique
```
## Log into cluster and input both files under one directory
- nano genelist and paste file 1
- nano mastersheet and paste file 2

## Use the script heatmap_enrichment.R
- change the cbind to the titles of the distinguising columns
- Ex: (MARV_unique, MARV_EBOV, EBOV_unique)

## Run the script under the directory containing file1 and file2
Rscript absolutepathtoheatmap_enrichment.R file1 file2 nameofdesiredheatmap
