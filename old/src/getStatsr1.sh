#! /usr/bin/env bash

echo r1
echo '...' |mail -s 'hoth: running r1 nestedness and cscore' mkl48@nau.edu
Files=/home/mlau/projects/cg_simulations/data/null/r1/*
for f in $Files
do
    echo $f
#     echo modularity
#     Rscript getMods.R $f /home/mlau/projects/cg_simulations/results/modsr1.txt
    echo nestedness
    Rscript getNest.R $f /home/mlau/projects/cg_simulations/results/nestr1.txt
    echo SES
    Rscript getCscore.R $f /home/mlau/projects/cg_simulations/results/csr1.txt    
done


#email notification
echo '...' |mail -s 'hoth: getStatsr1.sh done.' mkl48@nau.edu