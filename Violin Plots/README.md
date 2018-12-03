# Violin Plots
## Input data format
Input dataframe should consist of 2 columns. The first column is the numeric/quantitative column that will be plotted on the y-axis (i.e. RPKM, fold change, etc). The second column should distinguish the first column into groups (i.e. infected versus uninfected, stim versus nostim). Data frame should have a header that labels first and second column. See "input_DF_example.txt"

Can use "rpkm_to_vioplot_2.R" to quickly convert standard sequencing data set into desired format.

## Plot 
Load ggplot2
```
R
library(ggplot2)
```
Read in input data
```
data <- read.delim("input_DF_example.txt", sep="\t", header=TRUE)
```
Save group information as a factor. 
- Note you must use the header label for the group column. In the example below the header label is "Group" as seen in example file
```
data$Group <- as.factor(data$Group)
```

Open PDF
```
pdf("Violinplot.pdf")
```

Plot 
Note x and y are set equal to the header label of your input data frame
```
ggplot(data, aes(x=Group, y=Count, fill=Group)) + geom_violin(trim=FALSE) + geom_boxplot(width=0.1, fill="white") + geom_dotplot(binaxis='y', stackdir='center', dotsize=1, fill="black") + theme_classic()
```

Turn PDF off
```
dev.off()
```

