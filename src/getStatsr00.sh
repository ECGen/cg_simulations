#! /usr/bin/env bash

#loop through null community folders r00, r0, c0, r1
echo r00
echo '...' |mail -s 'hoth: running r00 nestedness and cscore' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/r00/*
for f in $Files
do
    echo $f
#     echo modularity
#     Rscript getMods.R $f ~/projects/cg_simulations/results/modsr00.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestr00.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csr00.txt    
done

#email notification
echo '...' |mail -s 'hoth: getStatsr00.sh done.' mkl48@nau.edu