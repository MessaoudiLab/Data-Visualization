# Hierarchical clustered heatmap
## Required files

### Raw counts file
The file should be a tab delimited text file that contains the raw count data. Within the data frame, the row names should be an array of gene names, and the column names should be an array of the individual observation points . View "countDF.txt"

### Targets file
The target file provides information about the experimental design and samples. The "SampleName" and "Factor" parameters are required. The "SampleName" must be unique while the "Factor" will categorize groups of samples in the same condition (i.e. day0, mutant, etc). The "Filename" column usually contains the absolute path of each sample's FASTQ file. However, this parameter, in addition to "SampleLong", "Experiment", and "Date" is not required. View "targets.txt" in Excel for an example

## Load R packages
```
R
library(pheatmap)
library(systemPipeR)
library(DESeq2)
```

## Read in files
```
countDF <- read.table("countDF.txt", sep="\t", header=TRUE, row=1)
targets <- read.delim("targets.txt", comment.char="#")
```

Remove rows that sum up to zero from counts file
```
countDF2 <- countDF[rowSums(countDF[,-1]) > 0, ]
```
## DESeq and heatmap
```
colData <- data.frame(row.names=targets$SampleName, condition=targets$Factor)
dds <- DESeqDataSetFromMatrix(countData = countDF2, colData = colData, design = ~ condition)
names <- rownames(countDF2)
y <- assay(rlog(dds))[names, ]
pdf("hierarchical_heatmap.pdf")
pheatmap(y, scale="row", clustering_distance_rows="correlation", clustering_distance_cols="correlation")
dev.off()

```
