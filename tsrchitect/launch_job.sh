#!/bin/bash

#PBS -N PdSTRIPE_job
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=48gb
#PBS -l walltime=8:00:00

echo "Launching job"

cd /N/u/rtraborn/Carbonate/ParameciumPromoters/stripe_seq/PdSTRIPE
./xdoit > err

echo "Job complete"
