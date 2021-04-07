#!/bin/bash

#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --job-name=Serial_Script

mkdir $SLURM_JOBID_$SLURM_JOBNAME

cd $SLURM_JOBID_$SLURM_JOBNAME

mpiexec ../program > output
