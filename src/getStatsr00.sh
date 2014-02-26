#! /usr/bin/env bash

mkdir ../results/mods
#loop through null community folders r00, r0, c0, r1
echo r00
echo '...' |mail -s 'hoth: running r00' mkl48@nau.edu
Files=../data/null/r00/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsr00.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestr00.txt
    echo SES
    Rscript getCscore.R $f ../results/csr00.txt    
done

#email notification
echo '...' |mail -s 'hoth: getStatsr00.sh done.' mkl48@nau.edu