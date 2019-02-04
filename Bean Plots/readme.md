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

##Re-ordering y-axis with multiple variables
This is how to reorder the y-axis by providing your order of factors or Pathway_Name column as is in the above code. Run this after you read in your input file.

```
Up_Down$Pathway_Name2 <- factor(Up_Down$Pathway_Name, levels = c("IL-2", "IFNg", ...))
```
When you go to run the above script, change the y variable to the new column you just created.

```
ggplot(file, aes(y=Pathway_Name2, ...
```

##Changing the color of the gradient
Adding the function below to the end of the script will change the color of the gradient to the low and high color you specify. 

```
+ scale_fill_gradient(low = "pink",high = "red")
```

##Changing the limits of the gradient
Adding the limits argument to the scale_fill_gradient function allows you to change the gradient limits with a numerical vector. You could use this so that only bubbles with a significant p-value will fall within the gradient. Anything that does not fall in the gradient will be colored grey. 

```
+ scale_fill_gradient(low = "pink",high = "red", limits=c(lower_limit, upper_limit))
```
To only adjust one end of the gradient, use NA to refer to the existing limit.

## References
https://cran.r-project.org/web/packages/beanplot/vignettes/beanplot.pdf

Written by Brian Ligh
