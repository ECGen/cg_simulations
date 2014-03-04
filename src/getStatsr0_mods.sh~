#! /usr/bin/env bash

echo r0
echo '...' |mail -s 'hoth: running r0 mods' mkl48@nau.edu
Files=../data/null/r0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsr0.txt
done

#email notification
echo '...' |mail -s 'hoth: getStatsr0_mods.sh done.' mkl48@nau.edu