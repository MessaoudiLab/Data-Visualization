# PCA
## STEP1: Prerequisites

### Count file
The count file should be a tab delimited text file that contains the normalized count data. Within the data frame, the row names should be an array of gene names, and the column names should be an array of the individual observation points per time point per replicate.

View "count.txt" in Excel for an example

### Target file

The target file provides information about the experimental design and samples. The "SampleName" and "Factor" parameters are required to generate PCAs. The "SampleName" must be unique while the "Factor" will categorize groups of samples in the same condition (i.e. day0, mutant, etc). The "Filename" column usually contains the absolute path of each sample's FASTQ file. However, this parameter, in addition to "SampleLong", "Experiment", and "Date" is not required to generate a PCA. 

View "targets.txt" in Excel for an example

## STEP2: load libraries
```
library(systemPipeR)
library((GenomicFeatures)
library(DESeq2)
```

## STEP3: Import files into R
Read in targets file
```
targets <- read.delim("targets_2", comment.char = "#")
```

Check the targets file is correct
```
targets
```
Read in counts file
```
countDF <- as.matrix(read.table("counts.txt", header=TRUE, row=1))
```

Check counts file is correct
```
head(counts)
```

## STEP3: generate PCA
### Group-wise PCA based on vsd
```
colData <- data.frame(row.names=targets$SampleName, condition=targets$Factor)
dds <- DESeqDataSetFromMatrix(countData = countDF, colData = colData, design = ~ condition)
vsd <- varianceStabilizingTransformation(dds)
pdf("PCA_group_vsd.pdf")
plotPCA(vsd)
dev.off()
```
### Sample-wise PCA based on vsd
```
colData <- data.frame(row.names=targets$SampleName, condition=targets$SampleName)
dds <- DESeqDataSetFromMatrix(countData = countDF, colData = colData, design = ~ condition)
vsd <- varianceStabilizingTransformation(dds)
pdf("PCA_sample_vsd.pdf")
plotPCA(vsd)
dev.off()
```
