#! /usr/bin/env bash

echo r1
echo '...' |mail -s 'hoth: running r1 mods' mkl48@nau.edu
Files=/home/mlau/projects/cg_simulations/data/null/r1/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f /home/mlau/projects/cg_simulations/results/modsr1.txt
done


#email notification
echo '...' |mail -s 'hoth: getStatsr1_mods.sh done.' mkl48@nau.edu