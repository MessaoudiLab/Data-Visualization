# Bubble Plot in ggplot2

## Introduction

## Prerequisites

### Rstudio
Rstudio is an integrated development environment for R that includes a console with tools for plotting, history, debugging, and workspace management. It is recommended, but not necessary, to operate this pipeline on a local computer with R and Rstudio installed. The Rstudio interface allows the user to easily monitor each step of the pipeline. Download sources for R and Rstudio are below.

```
 https://cran.cnr.berkeley.edu/
 https://www.rstudio.com/products/rstudio/download/#download
``` 

### ggplot2 package

### Data

## TLDR

pTF <- ggplot(Up_Down, aes(x = Sample, y = Pathway_Name, size = gene_count, fill = p_value)) + geom_point(shape = 21)  + theme_bw() + facet_grid(. ~ Orientation) + theme(axis.title.x=element_blank(), axis.ticks.x = element_blank(), axis.title.y = element_blank()) + labs(size = "Gene Count", fill = "p-value")

Applying this code to the dataset “Up_Down.txt” will produce the graph “Up_Down.pdf”

## 1. ggplot()
```
pTF <- ggplot(Up_Down, aes(x = Sample, y = Pathway_Name, size = gene_count, fill = p_value))
```

## 2. geom_point()
```
pTF <- pTF + geom_point(shape = 21)
```

## 3. theme()

pTF <- pTF + theme_bw() + theme(axis.title.x = element_blank(), axis.ticks.x = element_blank(), axis.title.y = element_blank())


## 4. facet.grid()
```
pTF <- pTF + facet_grid(. ~ Orientation)
```

## 5. labs()
```
pTF <- pTF + labs(size = “Gene Count”, fill = “p-value”)
```

## Sorting by chosen variable

## Useful Functions
To access help window
```
help()
```
To access underlying code of a function
```
getAnywhere()
```
## References

Written by Brian Ligh
