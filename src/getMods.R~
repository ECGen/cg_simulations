###getMods = test the modularity for a network
##25Feb2014
library(bipartite)
library(methods)
                                        #take shell input
                                        #null file location
args <- commandArgs(trailingOnly = TRUE)
x <- read.csv(as.character(args[1]))
x <- x[,grepl('S',colnames(x))]
null <- sign(x)[,apply(x,2,sum)!=0]
print('Null Modules')
mod.null <- slot(computeModules(null,steps=10000),name='likelihood')
cat(mod.null,file=as.character(args[2]),append=TRUE)
cat(as.character(args[1]),file=paste(as.character(args[2]),'.names.txt',sep=''),append=TRUE)
###end###
