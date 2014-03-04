#!/usr/bin/env sh
#Submit script qsub -v caselist="case_1 case_2 ... case_n" jobscript
#PBS -l nodes=1:ppn=1,walltime=01:40:00,pmem=2g
#PBS -m n

#caselist=$(ls) 

#Make sure to copy the cgsMods.R file into the working directory
cp /Users/Aeolus/projects/cg_simulations/src/cgsMods.R ./

for case in $caselist
do
    echo "starting case number $case"
    Rscript cgsMods.R $case ~/mods.txt
    echo "completed case number $case"
done

rm cgsMods.R