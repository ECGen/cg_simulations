#! /usr/bin/env bash

echo r0
echo '...' |mail -s 'hoth: running r0 nestedness and cscore' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/r0/*
for f in $Files
do
    echo $f
#     echo modularity
#     Rscript getMods.R $f ~/projects/cg_simulations/results/modsr0.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestr0.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csr0.txt    
done

#email notification
echo '...' |mail -s 'hoth: getStatsr0.sh done.' mkl48@nau.edu