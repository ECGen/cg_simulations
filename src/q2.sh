#!/usr/bin/env sh
#PBS -l nodes=3:ppn=1,walltime=01:40:00,pmem=2g
#PBS -m n

cp /home/mlau/projects/cg_simulations/src/cgsMods.R ./
echo "starting case number $case"
Rscript cgsMods.R $case ~/mods.txt
echo "completed case number $case"
echo $PBS_O_WORKDIR
echo $PBS_E_WORKDIR
echo $PBS_WORKDIR
rm $PBS_O_WORKDIR/cgsMods.R