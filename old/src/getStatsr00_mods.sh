#! /usr/bin/env bash

#loop through null community folders r00, r0, c0, r1
echo r00
echo '...' |mail -s 'hoth: running r00 stats mods' mkl48@nau.edu
Files=/home/mlau/projects/cg_simulations/data/null/r00/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f /home/mlau/projects/cg_simulations/results/modsr00.txt
done

#email notification
echo '...' |mail -s 'hoth: getStatsr00_mods.sh done.' mkl48@nau.edu