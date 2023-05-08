# ---- Introduction ----
# This script uses logFoldChange (logFC) data derived from an RNAseq analysis of
# RNAseq count data from the PFC of mice exposed/not exposed to flicker in 
# addition to corresponding gene ontology information from DAVID to generate a
# circular heatmap.
#
# Jacob Kraus, Singer Lab
# Spring 2023

# ---- Initialize libraries ----
library(readxl)
library(circlize)

# ---- Import data ----
data = read.csv("20-Hz_March-2023-_1_ copy.csv")

# ---- Sort and prepare data ----
groups = data[,5]
logFC = data[,2]
split = factor(groups,levels = c("a", "b", "c","d"))
col_fun1 = colorRamp2(c(-3, 0, 3), c("blue", "white", "red"))
col_process_type = structure(c('#66C2A5', '#E8E337', '#5C4033', '#E78AC3'), names = unique(groups))

# ---- Render the circular heatmap ----
# Note: disregard the error that the line below will generate. Execute lines 27 & 28 after the error appears.
circos.heatmap(logFC, split = factor(split, levels = c("d", "c", "b", "a")), col = col_fun1, track.height = 0)
circos.heatmap(groups, col = col_process_type, track.height = 0.05)
circos.heatmap(logFC, split = factor(split, levels = c("d", "c", "b", "a")), col = col_fun1, show.sector.labels = FALSE, track.height = 0.12)
circos.clear()
dev.off()

