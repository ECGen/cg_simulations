#! /usr/bin/env bash

echo r1
echo '...' |mail -s 'hoth: running r1 nestedness and cscore' mkl48@nau.edu
Files=../data/null/r1/*
for f in $Files
do
    echo $f
#     echo modularity
#     Rscript getMods.R $f ../results/modsr1.txt
    echo nestedness
    Rscript getNest.R $f ../results/nestr1.txt
    echo SES
    Rscript getCscore.R $f ../results/csr1.txt    
done


#email notification
echo '...' |mail -s 'hoth: getStatsr1.sh done.' mkl48@nau.edu