#!/usr/bin/env sh
#$ -N r1
#$ -pe mpi 10
#$ -M mkl48@nau.edu
#$ -m eas
#Wall time:
#$ -l h_rt=12:00:00

###Submission loop:
###for case in $ql; do qsub -o ~/qmonitor -e ~/qmonitor -cwd -v case=$case $cgssrc/qStats_r1.sh; sleep 10; done
###Note: sleep 10 allows a minimum of 10s between submissions

cp /home/mlau/projects/cg_simulations/src/cgsMods.R ./
cp /home/mlau/projects/cg_simulations/src/cgsNest.R ./
cp /home/mlau/projects/cg_simulations/src/cgsCscore.R ./
echo "starting case number $case"
Rscript cgsMods.R $case ~/projects/cg_simulations/results/mods_r1.txt
Rscript cgsNest.R $case ~/projects/cg_simulations/results/nest_r1.txt
Rscript cgsCscore.R $case ~/projects/cg_simulations/results/cscore_r1.txt
echo "completed case number $case"

### Fix this!
### rm $PBS_O_WORKDIR/cgsMods.R
### rm $PBS_O_WORKDIR/cgsNest.R
### rm $PBS_O_WORKDIR/cgsCscore.R