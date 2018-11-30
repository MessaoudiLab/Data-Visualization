# Program takes in 2 input files and creates venn diagrams based on the common elements in all pairwise files based on a specified column
# Program also prints a text file with all the gene ids and gene names common and unique among the group comparisons.

# Function to find overlaps. The idea is to iterate over the pairs and create multiple objects, record their lengths and create venn. It also subsets gene information from the common list.
# An update to this would be to automate with functions that take in targets file with information about the files and labels that need to be compared.
# Current format : Rscript venn.R label1 file1 label2 file2 outfile

library(VennDiagram)
args <- commandArgs(TRUE)


#Not efficient
label1 <- args[1]
file1  <- args[2]
label2 <- args[3]
file2 <- args[4]
outfile <- args[5]
#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=TRUE)
#head(f1)
f2 <- read.delim(file2, sep="\t", header=TRUE)

############################################################
############################################################
# Individual sets
n1 <- f1$Gene_Human
n2 <- f2$Gene_Human

print(length(n1))
print(length(n2))
############################################################
############################################################

# Pairwise comparisons
n12 <- intersect(n1, n2)
print(n12)
first_unique <- setdiff(n1, n2)
print(first_unique)
second_unique <- setdiff(n2, n1)
print(second_unique)
############################################################
############################################################

common1 <- f1[f1[,11]%in%n12,]
write.table(common1, file=paste(outfile, "_commonf1.txt", sep=""), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
common2 <- f2[f2[,3]%in%n12,]
write.table(common2, file=paste(outfile, "_commonf2.txt", sep=""), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
first_unique2 <- f1[f1[,11]%in%first_unique,]
write.table(first_unique2, file=paste(outfile, "_first_unique.txt", sep=""), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
second_unique2 <- f2[f2[,3]%in%second_unique,]
write.table(second_unique2, file=paste(outfile, "_second_unique.txt", sep=""), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
#Draw venn diagram
category <- c(label1, label2)
print(category)
output <- paste(outfile, ".pdf", sep="")
fill <- c("seagreen1", "goldenrod1")
cat.col <- rep("black", 2)
pdf(output)
draw.pairwise.venn(length(n1),length(n2),length(n12), cat.col=cat.col, fill=fill, category=category, cat.cex=rep(1,2), cex=rep(1,3))
dev.off()
