###Get modularity and write out.

###Two arguments: 1 = input file, 2 = output file
args <- commandArgs(trailingOnly = TRUE)
x <- read.csv(as.character(args[1]))
library(bipartite)
library(methods)
mod <- computeModules(x,steps=10000)
out <- slot(mod,'likelihood')
info <- unlist(strsplit(as.character(args[1]),split='\\/'))
info <- info[length(info)]
cat(paste(paste(info,'_',sep=''),out,' ',sep=''),file=as.character(args[2]),append=TRUE)
