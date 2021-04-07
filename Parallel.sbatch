#!/bin/sh

#SBATCH --time=00:01:00
#SBATCH --ntasks=12
#SBATCH --job-name=Parallel_Script

mkdir ${SLURM_JOBID}_${SLURM_JOB_NAME}
gmake clean
gmake Program
cd ${SLURM_JOBID}_${SLURM_JOB_NAME}

mpiexec ../Program > output
