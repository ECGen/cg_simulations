#! /usr/bin/env bash

echo c0
echo '...' |mail -s 'hoth: running c0 mods' mkl48@nau.edu
Files=../data/null/c0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ../results/modsc0.txt
done

#email notification
echo '...' |mail -s 'hoth: getStatsc0_mods.sh done.' mkl48@nau.edu