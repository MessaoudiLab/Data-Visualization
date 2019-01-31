# Bubble Plot in R

## Prerequisites

### Rstudio
Rstudio is an integrated development environment for R that includes a console with tools for plotting, history, debugging, and workspace management. It is recommended, but not necessary, to operate this pipeline on a local computer with R and Rstudio installed. The Rstudio interface allows the user to easily monitor each step of the pipeline. Download sources for R and Rstudio are below.

```
 https://cran.cnr.berkeley.edu/
 https://www.rstudio.com/products/rstudio/download/#download
``` 

### ggplot2 package
ggplot2 can be obtained by the following command

```
install.packages('ggplot2')
```
Once installed, execute this command to load the package

```
library(ggplot2)
```

### Data
The data object should be a tab delimited text file in similar format to Up_Down.txt. Make sure to not include spaces, parenthesis, hyphens, etc. in variable names as it will confuse R when trying to call certain variables. Underscore is ok.

## TLDR
```
pTF <- ggplot(Up_Down, aes(x = Sample, y = Pathway_Name, size = gene_count, fill = p_value)) 
+ geom_point(shape = 21)  + theme_bw() + facet_grid(. ~ Orientation) 
+ theme(axis.title.x=element_blank(), axis.ticks.x = element_blank(), axis.title.y = element_blank()) 
+ labs(size = "Gene Count", fill = "p-value")
```
Applying this code to the dataset “Up_Down.txt” will produce the graph “Up_Down.pdf.” When copying, make sure all code is within one command line.

## Module Breakdown
### 1. ggplot()
```
pTF <- ggplot(Up_Down, aes(x = Sample, y = Pathway_Name, size = gene_count, fill = p_value))
```
The module, "ggplot," indexes the data from the chosen file into 4 different variables, all of which can be continuous or discrete. For this specific application, most variables will be discrete/categorical.

### 2. geom_point()
```
pTF <- pTF + geom_point(shape = 21)
```
"geom_point" lets ggplot2 know that it needs to create a scatter plot. For this application, the argument "shape = 21" is used to create bubbles with empty fill in order to accomadate the variable fill described by the previous module.

### 3. theme()
```
pTF <- pTF + theme_bw() 
+ theme(axis.title.x = element_blank(), axis.ticks.x = element_blank(), axis.title.y = element_blank())
```
"theme_bw" colors the background of the graph white as opposed to the default theme that colors it grey. Be sure to sequence this module before any of the other aesthetic modules, or else default settings of "theme_bw" will overwrite some desired settings. The example arguments within the "theme" module delete the axis titles and x axis ticks

### 4. facet.grid()
```
pTF <- pTF + facet_grid(. ~ Orientation)
```
"facet.grid" separates the data into two separate graphs "Up" and "Down" according to the variable "Orientation."

### 5. labs()
```
pTF <- pTF + labs(size = “Gene Count”, fill = “p-value”)
```
"labs" regards the label names and takes the same arguments as "aes" in the first module. Since, the x and y titles will not be included in this graph

### 6. scale_fill_gradient()
```
+ scale_fill_gradient(low = "pink",high = "red")
```
Adding the function below to the end of the script will change the color of the gradient to the low and high color you specify.

```
+ scale_fill_gradient(low = "pink",high = "red", limits=c(lower_limit, upper_limit))
```
Adding the limits argument to the scale_fill_gradient function allows you to change the gradient limits with a numerical vector. You could use this so that only bubbles with a significant p-value will fall within the gradient. Anything that does not fall in the gradient will be colored grey.

To only adjust one end of the gradient, use NA to refer to the existing limit.

## Reordering Genes

### Reorder by Variable
**Requires only 1 level in X axis**
```
ggplot(file,aes(y=reorder(Pathway_Name,rev(p_value))...
```
By default, the x and y dimensions will be sorted alphabetically. To sort the "pathway names" by "p-value" for example, the reorder function is used to order the levels of "Pathway_Name" by the reverse sequence of "p_value." Reversing the "p_value" sequence makes the most statistically significant pathways appear at the top of the graph. 

### Manual Reorder
**Requires no duplicate row names**
This is how to reorder the y-axis by providing your order of factors or Pathway_Name column as is in the above code. Run this after you read in your input file.

```
Up_Down$Pathway_Name2 <- factor(Up_Down$Pathway_Name, levels = c("IL-2", "IFNg", ...))
```
When you go to run the above script, change the y variable to the new column you just created.

```
ggplot(file, aes(y=Pathway_Name2, ...
```

**OR**


Load the package "dplyr" and create a target vector that describes the desired order of genes. Use the *dplyr* function "reorder.factor" and finalize the changes with the "arrange" function.
```
require(dplyr)
target = c("desired", "order", "of", "genes")
file$Pathway_Name <- reorder.factor(file$Pathway_Name, new.order = target)
file %>% arrange(Pathway_Name)
```

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
* [tutorial for weighted scatter plots](http://t-redactyl.io/blog/2016/02/creating-plots-in-r-using-ggplot2-part-6-weighted-scatterplots.html)
* [ordering y axis](https://stackoverflow.com/questions/18401931/ggplot2-ordering-y-axis)

Written by Brian Ligh, Sloan Lewis
