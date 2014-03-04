#! /usr/bin/env bash

#loop through null community folders r00, r0, c0, r1
echo r00
echo '...' |mail -s 'hoth: running r00' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/r00/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ~/projects/cg_simulations/results/modsr00.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestr00.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csr00.txt    
done

echo r0
echo '...' |mail -s 'hoth: running r0' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/r0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ~/projects/cg_simulations/results/modsr0.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestr0.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csr0.txt    
done

echo c0
echo '...' |mail -s 'hoth: running c0' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/c0/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ~/projects/cg_simulations/results/modsc0.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestc0.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csc0.txt    
done

echo r1
echo '...' |mail -s 'hoth: running r1' mkl48@nau.edu
Files=~/projects/cg_simulations/data/null/r1/*
for f in $Files
do
    echo $f
    echo modularity
    Rscript getMods.R $f ~/projects/cg_simulations/results/modsr1.txt
    echo nestedness
    Rscript getNest.R $f ~/projects/cg_simulations/results/nestr1.txt
    echo SES
    Rscript getCscore.R $f ~/projects/cg_simulations/results/csr1.txt    
done

#email notification
echo '...' |mail -s 'hoth: getStats.sh done.' mkl48@nau.edu