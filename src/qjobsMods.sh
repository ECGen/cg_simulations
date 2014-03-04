#!/bin/bash
#PBS -l nodes=1:ppn=1,walltime=02:00,pmem=2g
#PBS -m n
#PBS -N job_case_1224
 
cd $PBS_O_WORKDIR/case_1224
./run_case