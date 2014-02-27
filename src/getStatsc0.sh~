#! /usr/bin/env bash

mkdir ../results/mods
echo c0
echo '...' |mail -s 'hoth: running c0' mkl48@nau.edu
Files=../data/null/c0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsc0.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestc0.txt
    echo SES
    Rscript getCscore.R $f ../results/csc0.txt    
done

#email notification
echo '...' |mail -s 'hoth: getStatsc0.sh done.' mkl48@nau.edu