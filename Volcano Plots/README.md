# Volcano Map

Will create volcano maps to visualize RNA-seq data

### Required file

RNA-seq data frame containing list of genes, fold change, and p-value (or FDR p-value)
See "input_data.txt" as example

### Load libraries
```
library(ggplot2)
library(ggrepel)
```

### Read in input file
```
genes <- read.delim("input_data.txt", sep="\t", header=TRUE)
head(genes)
```

### Create column that distinguishes each gene as significant or not significant
```
genes$Significant <- ifelse(genes$p_val < 0.05, "pval < 0.05", "Not Sig")
```

### Plot
```
pdf("Volcano.pdf")
ggplot(genes, aes(x = avg_logFC, y = -log10(p_val))) + geom_point(aes(color = Significant), shape=17) + scale_color_manual(values = c("black", "red")) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_rect(colour = "black", size=4, fill=NA))
dev.off


