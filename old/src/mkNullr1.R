###mkNull = take simulated communities and 
###produce a set of null model communities
###for network and co-occurrence analyses
###and selection experiments.

library(vegan)
n.null <- 1000
  
###Load communities
oldwd <- getwd()
setwd('../data/coms/')
com.list <- (sapply(dir(),grepl,pattern='~')|sapply(dir(),grepl,pattern='\\#'))==FALSE
m <- list()
for (i in 1:length(com.list)){m[[i]] <- read.csv(dir()[com.list][i])}
names(m) <- dir()[com.list]
setwd(oldwd)
m <- lapply(m,function(x) x[,grepl('S',colnames(x))])

###Null communities
## output.loc <- '../data/null/'
## dir.create(output.loc)

###r1
output.loc <- '../data/null/r1/'
dir.create(output.loc)
                                        #burning and writing
for (k in 1:length(m)){
  for (i in 1:n.null){
    null <- commsimulator(m[[k]],method='r1',thin=100)
    for (j in 1:500){null <- commsimulator(null,method='r1',thin=100)}
    write.csv(null,paste(output.loc,'r1',names(m)[k],i,sep=''),row.names=FALSE)
    print(paste(output.loc,'r1',names(m)[k],i,sep=''))
  }
}

print('Done.')

###end###
