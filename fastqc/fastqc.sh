#!/bin/bash                                                                                    

#SBATCH -n 2                        # number of cores
#SBATCH -t 0-12:00                  # wall time (D-HH:MM)
##SBATCH -A ssnyde11                # Account hours will be pulled from (commented out with double # in front)
#SBATCH -o slurm.%j.out             # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err             # STDERR (%j = JobId)
#SBATCH --mail-type=ALL             # Send a notification


                                                             
BWAdir=/home/ssnyde11/scratch/daphnia_stripe_2
GSF=${GSF2380}

module load fastqc/0.11.7

cd $BWAdir                                                                                                                                                 
echo "Starting fastqc job"                                                                                                                                 
#for fq in GSF2380-*-*-?_S*_R?_001.fastq                                                       

for fq in *.fastq 

#GSF2380-OA-15-7_S9_R1_001.fastq
#GSF2380-W-17-4_S17_R2_001.fastq                                                                           
do                                                                                                                                                        
fastqc $fq                                                                                                                                                 
done
