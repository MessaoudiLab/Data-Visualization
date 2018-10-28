# Scatterplots
## STEP1: Read in input file

### Input file
Input file should have three columns. First column is the common parameter that is being compared between two conditions (i.e. GENE ID). Second and third column are the quantitative measurements (i.e. fold change) of each condition that will be used to plot x-axis and y-axis, respectively. For example, header should be "GENE" "FC.x" "FC.y"

View "scatter_input.txt" in Excel for an example

### Read in file
```
input <- read.delim("scatter_input.txt", header=TRUE, sep="\t")
```
## STEP2: Load Libraries
```
library(ggplot2)
library(ggrepel)
```

## STEP3: Plot
x = header of values you want to plot on x-axis
y = header of values you want to plot on y-axis
scale_x_continuous = can customize limits and axis breaks
```
pdf("Common_genes_scatter.pdf")
ggplot(input, aes(x=WT_FC, y=VP35m_FC)) + geom_point(aes(color="#66A61E"), shape=8) + scale_x_continuous(limits=c(-3.2,9), breaks=c(-3.2,0,3,6,9)) + scale_y_continuous(limits=c(-3.2,9), breaks=c(-3.2,0,3,6,9)) + scale_color_manual(values = c("#E7298A", "#decbe4")) + geom_smooth(method=lm, se=FALSE, fullrange=TRUE, linetype='twodash', color='#7570B3') + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_rect(colour = "black", size=2, fill=NA)) + geom_text_repel(data = subset(input, input$GENE!=""), aes(label = GENE),size = 2,box.padding = unit(0.35, "lines"), point.padding = unit(0.3, "lines"))
> dev.off()
```
