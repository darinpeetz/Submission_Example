#!/bin/sh

#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --job-name=Serial_Script

# Build the software
gmake clean
gmake Serial_Program

# Create a directory specific to this job to work out of
mkdir ${SLURM_JOBID}_${SLURM_JOB_NAME}
cd ${SLURM_JOBID}_${SLURM_JOB_NAME}

# Run the program
../Serial_Program
