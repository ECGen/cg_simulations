#! /usr/bin/env bash

echo c0
echo '...' |mail -s 'hoth: running c0 nestedness and cscore' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/c0/*
for f in $Files
do
    echo $f
#     echo modularity
#     Rscript getMods.R $f ~/projects/cg_simulations/results/modsc0.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestc0.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csc0.txt    
done

#email notification
echo '...' |mail -s 'hoth: getStatsc0.sh done.' mkl48@nau.edu