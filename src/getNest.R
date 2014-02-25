###getNest = test the nestedness for a network
##25Feb2014
library(bipartite)
library(methods)
                                        #take shell input
                                        #null file location
args <- commandArgs(trailingOnly = TRUE)
x <- read.csv(as.character(args[1]))
x[x!=0] <- 1
null <- sign(x)[,apply(x,2,sum)!=0]
print('Null Nestedness')
if (all(null==1)){nest.null <- NA}else{nest.null <- nested(null)}
cat(mod.null,file=as.character(args[2]),append=TRUE,sep=' ')
###end###
