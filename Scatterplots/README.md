# Scatterplots
## STEP1: Read in input file

### Input file
Input file should have three columns. First column is the common parameter that is being compared between two conditions. Second and third column are the quantitative measurements of each condition that will be used to plot x-axis and y-axis, respectively. For example, header should be "GENE" "foldchange.x" "foldchange.y"

View "scatter_input.txt" in Excel for an example

### Read in file
```
object <- read.delim("scatter_input.txt", header=TRUE, sep="\t")
```
## STEP2: Load Libraries
```
library(ggplot2)
```

## STEP3: Plot
```
pdf("Common_genes_scatter.pdf")
ggplot(object, aes(x = FC.x, y = FC.y)) + geom_point(aes(color = "#66A61E"), shape=8) + scale_color_manual(values = c("#E7298A", "#decbe4")) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE, linetype='twodash', color='#7570B3')
+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_rect(colour = "black", size=2, fill=NA))
+ geom_text_repel(data = subset(merge, merge$GENE!=""), aes(label = GENE),size = 2,box.padding = unit(0.35, "lines"), point.padding = unit(0.3, "lines"))
> dev.off()
```
