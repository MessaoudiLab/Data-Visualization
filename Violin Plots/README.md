# Data-Visualization
header FC and Group
violin_input <- read.delim("VP35m_WT_violin_input.txt", header=TRUE, sep="\t")
violin_input$Group <- as.factor(violin_input$Group)
pdf("VP35m_WT_violin.pdf")
library(ggplot2)
ggplot(violin_input, aes(x=Group, y=FC, fill=Group)) + geom_violin(trim=FALSE) + geom_boxplot(width=0.1, fill="white") + theme_classic()
dev.off()
