###getMods = test the modularity for a network
##25Feb2014
library(bipartite)
library(methods)
                                        #take shell input
                                        #null file location
args <- commandArgs(trailingOnly = TRUE)
x <- read.csv(as.character(args[1]))
null <- sign(x)[,apply(x,2,sum)!=0]
print('Null Modules')
mod.null <- slot(computeModules(null),name='likelihood')
cat(mod.null,file=as.character(args[2]),append=TRUE,sep=' ')
cat(as.character(args[1]),file=paste('names_',as.character(args[2]),sep=''),append=TRUE,sep=' ')
###end###
