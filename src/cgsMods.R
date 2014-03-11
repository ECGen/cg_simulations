###Get modularity and write out.

###Two arguments: 1 = input file, 2 = output file
args <- commandArgs(trailingOnly = TRUE)
x <- read.csv(as.character(args[1]))
x[x!=0] <- 1
if (all(x==0)|all(x==1)){
  out <- NA
}else{
  library(bipartite)
  library(methods)
  mod <- computeModules(x,steps=1000000)
  out <- slot(mod,'likelihood')
}
info <- unlist(strsplit(as.character(args[1]),split='\\/'))
info <- info[length(info)]
cat(paste(paste(info,'_',sep=''),out,' ',sep=''),file=as.character(args[2]),append=TRUE)
