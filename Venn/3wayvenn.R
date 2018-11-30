# Program takes in 3 input files and creates venn diagrams based on the common elements in all pairwise files based on a specified column
# Program also prints a text file with all the gene ids and gene names common among the group comparisons.

# Function to find overlaps. The idea is to iterate over the pairs and create multiple objects, record their lengths and create venn. It also subsets gene information from the common list.
# An update to this would be to automate with functions that take in targets file with information about the files and labels that need to be compared.
# Current format : Rscript venn.R label1 file1 label2 file2 label3 file3

library(VennDiagram)
args <- commandArgs(TRUE)


#Not efficient
label1 <- args[1]
file1  <- args[2]
label2 <- args[3]
file2 <- args[4]
label3 <- args[5]
file3 <- args[6]
outfile <- args[7]
#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=TRUE)
#head(f1)
f2 <- read.delim(file2, sep="\t", header=TRUE)
f3 <- read.delim(file3, sep="\t", header=TRUE)

############################################################
############################################################
# Individual sets
n1 <- f1$GENE
n2 <- f2$GENE
n3 <- f3$GENE

print(length(n1))
print(length(n2))
print(length(n3))
############################################################
############################################################

# Three-way comparisons
n123 <- intersect(n12, n3)
print(n123)
###########################################################
###########################################################

write.table(n123, file=paste(outfile, "_allcommon.txt", sep=""), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
# Draw venn diagram


category <- c(label1, label2, label3)
print(category)
output <- paste(outfile, ".pdf", sep="")
fill <- c("dodgerblue", "goldenrod1", "seagreen3")
main= "Venn Diagram for 4-way comparison"
cat.col <- rep("black", 3)
pdf(output)
draw.triple.venn(length(n1),length(n2),length(n3),length(n12),length(n23),length(n13),length(n123), cat.col=cat.col, fill=fill, category=category, cat.cex=rep(2,3), cex=rep(2,7))
dev.off()
