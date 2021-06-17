#!/bin/sh

#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --job-name=Python

# Run python code and let output be captured in slurm-JOBID.out
python Poisson.py 1001
