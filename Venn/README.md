# Venn Diagrams

## 2Way Venn
2wayvenn.R is an R script that creates venn diagrams based on common elements from 2 dataframes. You need to specify which columns in the dataframe need to be compared.

Usage
```
Rscript 2wayvenn.R label1 {file1} label2 {file2} name_of_output
```

This script will write out 4 tab delimited files:
  - "_commonf1.txt" Common list of elements with all corresponding information (i.e. fold change, FDR) from 1st file
  - "_commonf2.txt" Common list of elements with all corresponding information from 2nd file
  - "_first_unique.txt" Unique list of elements with all corresponding information from 1st file
  - "_second_unique.txt" Unique list of elements with all corresponding information from 2nd file

### Modifications
1. Copy the script into your working directory using nano (text editor)
```
nano 2wayvenn.R
```
2. Specify which columns are to be compared (lines 24 and 25 of script)
```
##examples
n1 <- f1$Gene_Human
n1 <- f1$Rhesus_ID
```
3. In the "#Extract" section, specify the corresponding column numbers in each of the files of the columns compared. For example, I'm comparing geneIDs common to file1 and file2. The geneID column in file 1 is #11 while the geneID column in file2 is #3. 
```
##example
common1 <- f1[f1[,11]%in%n12,]
write.table(common1, file=paste(outfile, "_commonf1.txt", sep=""), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
common2 <- f2[f2[,3]%in%n12,]
write.table(common2, file=paste(outfile, "_commonf2.txt", sep=""), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
```

4. Change colors of Venn on line 55


## 3Way Venn
3wayvenn.R is an R script that creates venn diagrams based on common elements from 3 dataframes. You need to specify which columns in the dataframe need to be compared.

Usage
```
Rscript 3wayvenn.R label1 {file1} label2 {file2} label3 {file3} name_of_output
```

### Modifications
1. Copy the script into your working directory using nano (text editor)
```
nano 3wayvenn.R
```
2. Specify which columns are to be compared (lines 29, 30, 31 of script)
```
##examples
n1 <- f1$Gene_Human
n1 <- f1$Rhesus_ID
```
3. Change colors of Venn on line 52

## 4Way Venn
4wayvenn.R is an R script that creates venn diagrams based on common elements from 4 dataframes. You need to specify which columns in the dataframe need to be compared.

Usage
```
Rscript 4wayvenn.R label1 {file1} label2 {file2} label3 {file3} label4 {file4} name_of_output
```

### Modifications
1. Copy the script into your working directory using nano (text editor)
```
nano 4wayvenn.R
```
2. Specify which columns are to be compared (lines 45, 46, 47, 48 of script)
```
##examples
n1 <- f1$Gene_Human
n1 <- f1$Rhesus_ID
```
3. Change colors of Venn on line 98
