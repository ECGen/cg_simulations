pline <- function(x,y,col=1){
    fit <- lm(y~x + I(x^2))
    lines(x,predict(fit),col=col)
}

rplace <- function(x='original',y='replacement list'){
    out <- x
    for (i in 1:length(y)){
        out[out == y[[i]][1]] <- y[[i]][2]
    }
    return(out)
}

cgsMelt <- function(x,zero.na=TRUE){
    x <- strsplit(x,split=' ')[[1]]
    x <- do.call(rbind,strsplit(x,split='_'))
    sim <- substr(x[,1],1,4)
    gef <- as.numeric(substr(x[,1],5,5))
    rep <- as.numeric(sapply(x[,1],function(x) substr(x,6,nchar(x))))
    met <- as.numeric(x[,2])
    rpl <- list(c(1,0),c(2,0.0001),c(3,0.0002),c(4,0.001),c(5,0.002),c(6,0.01),c(7,0.02),c(8,0.05))
    gef <- rplace(gef,rpl)
    out <- data.frame(sim,gef,rep,met)
    out <- out[order(sim,gef,rep),]
    if (zero.na){out$met[is.na(out$met)] <- 0}
    return(out)
}
