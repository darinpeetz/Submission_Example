#!/bin/bash

#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --job-name=Matlab


# Clear the value set in the DISPLAY environment variable
# to run the CLI version of MATLAB
unset DISPLAY

# Load MATLAB module (Enable MATLAB in user environment)
module load matlab

# Run matlab code and redirect output into a file whose
# name include the numeric portion of the pbs jobid.
for i in {0..11}
do
    matlab -nodisplay -r "num = $i; mat_script" &
done
