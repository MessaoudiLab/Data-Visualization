# Bean Plot in R

## Prerequisites

### Rstudio
Rstudio is an integrated development environment for R that includes a console with tools for plotting, history, debugging, and workspace management. It is recommended, but not necessary, to operate this pipeline on a local computer with R and Rstudio installed. The Rstudio interface allows the user to easily monitor each step of the pipeline. Download sources for R and Rstudio are below.

```
 https://cran.cnr.berkeley.edu/
 https://www.rstudio.com/products/rstudio/download/#download
``` 

### "beanplot" package
beanplot can be obtained by the following command

```
install.packages('beanplot')
```
Once installed, execute this command to load the package

```
library(beanplot)
```

### Data
The data object should be a tab delimited text file in similar format to ITGB1.txt. The first column should be the group index which includes the group name as well as the number 1 or 2. The two items should be separated by a single space. The second column should be the quantitave value that will serve as the y dimension.

## Function Breakdown
```
beanplot(rpkm ~ Group, data = ITGB1, main = "beanplot", side = "both", border = NA, col = list("#FFFF00", 
+ "#FFCC33", "#66CCCC", "#339999", "#66CCFF", "#006699"))
```
Arguments going from left to right:
1. QuantitaveValue ~ Group: column names go here; notice that the values are not encased in quotation marks so do not use space, hyphen, slash, etc. in names
2. data: data file
3. main (?): unknown
4. side: tells what sides of the beans to plot
5. border: color of bean borders
6. col: fill colors of beans going from left to right

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
https://cran.r-project.org/web/packages/beanplot/vignettes/beanplot.pdf

Written by: Brian Ligh
