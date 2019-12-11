#!/bin/bash                                                                                        
                                                                           \


#SBATCH -n 2                        # number of cores                                 \            

#SBATCH -t 0-12:00                  # wall time (D-HH:MM)                             \            

##SBATCH -A ssnyde11                # Account hours will be pulled from (commented out with double\
 # in front)                                                             \                         

#SBATCH -o slurm.%j.out             # STDOUT (%j = JobId)                             \            

#SBATCH -e slurm.%j.err             # STDERR (%j = JobId)                             \            

#SBATCH --mail-type=ALL             # Send a notification                             \   

module load java/latest
module load gcc/7x
module load r/3.6.1

cd /home/ssnyde11/scratch/daphnia_stripe_2/tsrchitect
./xdoit_tsr > err
