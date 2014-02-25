###getCscore = get the Cscore for a given null matrix
##25Feb2014
library(bipartite)
library(methods)
                                        #Sourcing ComGenR on hoth
oldwd <- getwd()
setwd('../../packages/ComGenR/R/')
cgn.list <- (sapply(dir(),grepl,pattern='~')|sapply(dir(),grepl,pattern='\\#'))==FALSE
sapply(dir()[cgn.list],source)
setwd(oldwd)
                                        #take shell input
                                        #null file location
args <- commandArgs(trailingOnly = TRUE)
x <- read.csv(as.character(args[1]))
x[x!=0] <- 1
null <- sign(x)[,apply(x,2,sum)!=0]
print('Null Cscore')
null.cs <- cscore(null)
cat(null.cs,file=as.character(args[2]),append=TRUE,sep=' ')
###end###
