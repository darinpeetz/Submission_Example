#!/bin/sh

#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --job-name=Serial_Script

mkdir ${SLURM_JOBID}_${SLURM_JOB_NAME}
gmake clean
gmake Serial_Program
cd ${SLURM_JOBID}_${SLURM_JOB_NAME}
pwd
../Serial_Program
