#!/bin/bash
##Submit script qsub -v caselist="case_1 case_2 ... case_n" jobscript
#PBS -l nodes=1:ppn=1,walltime=01:40:00,pmem=2g
#PBS -m n
#PBS -N job_case_1201-1250
 
for casenumber in {1..1000}

do
 
    echo "starting case number $casenumber"
 
#    cd $PBS_O_WORKDIR/case_$casenumber
#    ./run_case
    echo $PBS_O_WORKDIR/case_$casenumber
    echo "completed case number $casenumber"
 
done