# Program takes in 5 input files and creates venn diagrams based on the common elements in all pairwise files based on a specified column
# Program also prints a text file with all the gene ids and gene names common among the group comparisons.

# Function to find overlaps. The idea is to iterate over the pairs and create multiple objects, record their lengths and create venn. It also subsets gene information from the common list.
# An update to this would be to automate with functions that take in targets file with information about the files and labels that need to be compared.
# Current format : Rscript venn.R label1 file1 label2 file2 label3 file3 label4 file4

library(VennDiagram)
args <- commandArgs(TRUE)

overlap <- function(l) {
        results <- list()

        l <- lapply(l, unique)

        for (m in seq(along=l)) {
                for (indices in combn(seq(length(l)), m, simplify=FALSE)) {
                        name <- paste(names(l)[indices], collapse="_")

                        results[[name]] <- Reduce(intersect, l[indices])
                }
        }
	results
}

label1 <- args[1]
file1  <- args[2]
label2 <- args[3]
file2 <- args[4]
label3 <- args[5]
file3 <- args[6]
label4 <- args[7]
file4 <- args[8]
outfile <- args[9]
#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=TRUE)
#head(f1)
f2 <- read.delim(file2, sep="\t", header=TRUE)
f3 <- read.delim(file3, sep="\t", header=TRUE)
f4 <- read.delim(file4, sep="\t", header=TRUE)

############################################################
############################################################
# Individual sets
f1id <- f1$RhesusEnsembl
f2id <- f2$RhesusEnsembl
f3id <- f3$RhesusEnsembl
f4id <- f4$RhesusEnsembl
print (f1id)
print (f2id)
print (f3id)
print (f4id)
n1 <- length(f1id)
n2 <- length(f2id)
n3 <- length(f3id)
n4 <- length(f4id)
print(n1)
print(n2)
print(n3)
print(n4)
############################################################
############################################################

# Pairwise comparisons
n12 <- length(tail(overlap(list(f1id, f2id)), n=1)[[1]])
n13 <- length(tail(overlap(list(f1id, f3id)), n=1)[[1]])
n14 <- length(tail(overlap(list(f1id, f4id)), n=1)[[1]])
n23 <- length(tail(overlap(list(f2id, f3id)), n=1)[[1]])
n24 <- length(tail(overlap(list(f2id, f4id)), n=1)[[1]])
n34 <- length(tail(overlap(list(f3id, f4id)), n=1)[[1]])

print(n12)
print(n13)
print(n14)
############################################################
############################################################

# Three-way comparisons
n123 <- length(tail(overlap(list(f1id, f2id, f3id)), n=1)[[1]])
n124 <- length(tail(overlap(list(f1id, f2id, f4id)), n=1)[[1]])
n134 <- length(tail(overlap(list(f1id, f3id, f4id)), n=1)[[1]])
n234 <- length(tail(overlap(list(f2id, f3id, f4id)), n=1)[[1]])
###########################################################
###########################################################

# Four-way comparisons
n1234 <- length(tail(overlap(list(f1id, f2id, f3id, f4id)), n=1)[[1]])
print(n1234)
print(tail(overlap(list(f1id,f2id,f3id,f4id)), n=1)[[1]])
##########################################################
##########################################################

# Draw venn diagram
category <- c(label1, label2, label3, label4)
#category <- c("1", "2", "3", "4")
print(category)
output <- paste(outfile, ".png", sep="")
fill <- c("dodgerblue", "goldenrod1", "seagreen3", "orchid3")
main= "Venn Diagram for 4-way comparison"
cat.col <- rep("black", 4)
png(output, height=1000, width=1000)
draw.quad.venn(n1,n2,n3,n4,n12,n13,n14,n23,n24,n34,n123,n124,n134,n234,n1234, cat.col=cat.col, fill=fill, category=category, cex=rep(4,15), fontfamily=rep("arial", 15), cat.cex=rep(2,4), cat.fontfamily=rep("arial", 4))
dev.off()
