#!/bin/sh

#SBATCH --time=00:01:00
#SBATCH --ntasks=4
#SBATCH --job-name=Parallel_Script

# Load the intel and MPI compilers
#module load icc/20.4
#module load openmpi/4.0.5

# Build the software
gmake clean
gmake Program

# Create a directory specific to this job to work out of
mkdir ${SLURM_JOBID}_${SLURM_JOB_NAME}
cd ${SLURM_JOBID}_${SLURM_JOB_NAME}

# Run the program
mpiexec ../Program 100000000
