###EEN = evolution on ecological networks
###Does genotypic diversity produce robustness through nestedness?
###Simulation experiments
###Initiated 23 Jan 2014

### Simulate networks with varying levels of genotypic effects 
## Use percent genetic variance equivalent to published community heritability estimates 
## Whitham et al. 2013 (H2C ~ 65% for arthropods)
## Tree clonal phenotype heritability (52% from Lamit's Roughness, similar to tannins from NRG2006)

output.loc <- '../results/een_exp/'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)

library(ComGenR)
tree.gpm <- gpmTrees(reps=10)
#make H2B=55%
trees <- simTrees(tree.gpm,VeT=7.5);h2b <- getH2C(trees,tree.gpm[,1],method='nmds')[2]
while (h2b<0.55|h2b>0.60){trees <- simTrees(tree.gpm,VeT=7.5);h2b <- getH2C(trees,tree.gpm[,1],method='nmds')[2]}
insects <- simSpp()
                                        #generate communities
cg.sim <- out <- list()
for (i in 1:9){
  for (j in 1:10){
    out[[j]] <- cgSim(trees=trees,insects=insects,z=i,Ve=0.1,VeN=3,k.asym=TRUE)
    print(paste(i,j))
  }
  cg.sim[[i]] <- out
}
threshold <- 5
com.sim <- list()
for (i in 1:length(cg.sim)){
  for (j in 1:length(cg.sim[[1]])){
    out[[j]] <- cg.sim[[i]][[j]]$art_pop
    out[[j]][out[[j]]<threshold] <- 0
  }
  com.sim[[i]] <- out
}


###For an appendix, develop the use of permanova R2, inlcuding:
##Calculation using Anderson method
##Comparison to NMDS method in Shuster 2006

g <- tree.gpm[,1]
h2c.shuster <- lapply(com.sim,function(x) lapply(x,function(x,g) getH2C(x,g,method='nmds'), g=g))
h2c.perm <- pblapply(com.sim,function(x) lapply(x,function(x,g) getH2C(x,g,method='permanova'), g=g))
write.csv(h2c.shuster,file=paste(output.loc,'h2c_shuster.csv',sep=''),row.names=FALSE)
write.csv(h2c.perm,file=paste(output.loc,'h2c_perm.csv',sep=''),row.names=FALSE)

###Measure nestedness and examine correlation between genetic variance and nestedness

x <- com.sim
cargo <- list()
out <- list()
for (i in 1:length(x)){
  for (j in 1:length(x[[i]])){
    if (any(x[[i]][[j]]==0)){cargo[[j]] <- nestedtemp(x[[i]][[j]])$statistic}else{cargo[[j]] <- 0}
    print(paste(i,j))
  }
  out[[i]] <- cargo
}

nest.sim <- cbind(nestedtemp=as.numeric(unlist(out)),z=as.numeric(gl(length(out),length(out[[1]]))))
write.csv(nest.sim,file=paste(output.loc,'nest_sim.csv',sep=''),row.names=FALSE)

###Conduct Removal experiments (random vs targeted removal):

###Threshold of species loss = number of trees removed until a species
###goes locally extinct This has been moved to een_sym.R and
###een_asym.R which are two linked simulations that use the same
###started points for tree and insect genotype-phenotype mapping.
