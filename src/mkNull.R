###mkNull = take simulated communities and 
###produce a set of null model communities
###for network and co-occurrence analyses
###and selection experiments.

n.null <- 5000
  
###Load communities
oldwd <- getwd()
setwd('../data/coms/')
com.list <- (sapply(dir(),grepl,pattern='~')|sapply(dir(),grepl,pattern='\\#'))==FALSE
m <- sapply(dir()[com.list],read.csv)
names(m) <- com.list
setwd(oldwd)

###Null communities
output.loc <- '../data/null/'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)

###r00
output.loc <- '../data/null/r00'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)
                                        #burning and writing
for (k in 1:length(m)){
  for (i in 1:n.null){
    null <- commsimulator(m[[k]],method='r00',thin=100)
    for (j in 1:500){null <- commsimulator(null,method='r00',thin=100)}
    write.csv(null,paste(output.loc,'r00',names(m)[k],i,sep=''))
    print(paste(output.loc,'r00',names(m)[k],i,sep=''))
  }
}

###r0
output.loc <- '../data/null/r0'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)
                                        #burning and writing
for (k in 1:length(m)){
  for (i in 1:n.null){
    null <- commsimulator(m[[k]],method='r0',thin=100)
    for (j in 1:500){null <- commsimulator(null,method='r0',thin=100)}
    write.csv(null,paste(output.loc,'r0',names(m)[k],i,sep=''))
    print(paste(output.loc,'r0',names(m)[k],i,sep=''))
  }
}

###c0
output.loc <- '../data/null/c0'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)
                                        #burning and writing
for (k in 1:length(m)){
  for (i in 1:n.null){
    null <- commsimulator(m[[k]],method='c0',thin=100)
    for (j in 1:500){null <- commsimulator(null,method='c0',thin=100)}
    write.csv(null,paste(output.loc,'c0',names(m)[k],i,sep=''))
    print(paste(output.loc,'c0',names(m)[k],i,sep=''))
  }
}

###r1
output.loc <- '../data/null/r1'
unlink(output.loc,recursive=TRUE)
dir.create(output.loc)
                                        #burning and writing
for (k in 1:length(m)){
  for (i in 1:n.null){
    null <- commsimulator(m[[k]],method='r1',thin=100)
    for (j in 1:500){null <- commsimulator(null,method='r1',thin=100)}
    write.csv(null,paste(output.loc,'r1',names(m)[k],i,sep=''))
    print(paste(output.loc,'r1',names(m)[k],i,sep=''))
  }
}

print('Done.')

###end###
