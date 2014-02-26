###mkComs = simulated community maker
###produces a set of communities for
###network and co-occurrence analyses
###and selection experiments.

## Simulate networks with varying levels of genotypic effects 
## Use percent genetic variance equivalent to published community heritability estimates 
## Whitham et al. 2013 (H2C ~ 65% for arthropods)
## Tree clonal phenotype heritability (52% from Lamit's Roughness, similar to tannins from NRG2006)

###Load ComGenR on hoth
###Sourcing ComGenR on hoth
oldwd <- getwd()
setwd('../../packages/ComGenR/R')
cgn.list <- (sapply(dir(),grepl,pattern='~')|sapply(dir(),grepl,pattern='\\#'))==FALSE
sapply(dir()[cgn.list],source)
setwd(oldwd)

###Simulate communities
output.loc <- '../data/coms/'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)
round.sim <- TRUE
threshold <- 5
n.sim <- 3
n.reps <- 3

###Make trees and bugs
tree.gpm <- gpmTrees(reps=n.reps)
#make H2B=55%
trees <- simTrees(tree.gpm,VeT=7.5);h2b <- getH2C(trees,tree.gpm[,1],method='nmds')[2]
while (h2b<0.55|h2b>0.60){trees <- simTrees(tree.gpm,VeT=7.5);h2b <- getH2C(trees,tree.gpm[,1],method='nmds')[2]}
insects <- simSpp()
###write trees and insects out
write.csv(tree.gpm,file='../data/tree_gpm.csv',row.names=FALSE)
write.csv(trees,file='../data/trees.csv',row.names=FALSE)
write.csv(insects,file='../data/insects.csv',row.names=FALSE)
###generate communities
###even communities
print('Even communities...')
out <- list()
for (i in 1:8){
  for (j in 1:n.sim){
    out[[j]] <- cgSim(trees=trees,insects=insects,z=i,Ve=0.1,VeN=3,k.asym=FALSE,artpop.only=TRUE)
    if (round.sim){out[[j]][out[[j]]<threshold] <- 0}
    print(paste(i,j))
    write.csv(out[[j]],file=paste(output.loc,'even',paste(i,j,sep=''),sep=''),row.names=FALSE)
  }
}
###asymptotic communities
print('Asymptotic communities...')
out <- list()
for (i in 1:8){
  for (j in 1:n.sim){
    out[[j]] <- cgSim(trees=trees,insects=insects,z=i,Ve=0.1,VeN=3,k.asym=TRUE,artpop.only=TRUE)
    if (round.sim){out[[j]][out[[j]]<threshold] <- 0}
    print(paste(i,j))
    write.csv(out[[j]],file=paste(output.loc,'asym',paste(i,j,sep=''),sep=''),row.names=FALSE)
  }
}

print('Done.')

###end###
