#!/bin/bash

#BWAdir=/home/ssnyde11/scratch/daphnia_stripe_test/tagdust_test
GENOME_DIR=/home/ssnyde11/scratch/genomes
GENOME_FILE=PA42.4.1.fasta
TAGDUST=~/genome_analysis/tagdust-2.33/src/tagdust
BWA=/packages/7x/bwakit/0.7.12/bwa.kit/bwa
RNAfile=/home/ssnyde11/scratch/genomes/Dpul-rDNA.fa
fastqDir=/home/ssnyde11/scratch/daphnia_stripe_2/fastqdir
SAMTOOLS=/packages/7x/samtools/1.8/bin/samtools

#Removing ribosomal RNA hits with tagdust:


#Removing ribosomal RNA hits with tagdust:



THREADS=4

SAMPLE1=POV-2014-12-10_S2
SAMPLE2=POV-2014-12-11_S3
SAMPLE3=POV-2014-12-9_S1
SAMPLE4=POV-2014-84-4_S4
SAMPLE5=OA-85-2_S6
SAMPLE6=W-17-1_S14
SAMPLE7=W-17-2_S15
SAMPLE8=W-17-3_S16
SAMPLE9=W-17-4_S17
SAMPLE10=TEX-2014-36-5
SAMPLE11=TEX-2014-36-4
SAMPLE12=TEX-2014-36-3
SAMPLE13=POV-2014-84-6_S5
SAMPLE14=PA-42-1_S20
SAMPLE15=OA-85-4_S8
SAMPLE16=OA-85-3_S7
SAMPLE17=OA-15-8_S10
SAMPLE18=OA-15-7_S9
SAMPLE19=BRV-2-1_S18


daphnia_rep1_R1=${fastqDir}/GSF2380-${SAMPLE1}_R1_001.fastq
daphnia_rep1_R2=${fastqDir}/GSF2380-${SAMPLE1}_R2_001.fastq
daphnia_rep2_R1=${fastqDir}/GSF2380-${SAMPLE2}_R1_001.fastq
daphnia_rep2_R2=${fastqDir}/GSF2380-${SAMPLE2}_R2_001.fastq
daphnia_rep3_R1=${fastqDir}/GSF2380-${SAMPLE3}_R1_001.fastq
daphnia_rep3_R2=${fastqDir}/GSF2380-${SAMPLE3}_R2_001.fastq
daphnia_rep4_R1=${fastqDir}/GSF2380-${SAMPLE4}_R1_001.fastq
daphnia_rep4_R2=${fastqDir}/GSF2380-${SAMPLE4}_R2_001.fastq
daphnia_rep5_R1=${fastqDir}/GSF2380-${SAMPLE5}_R1_001.fastq
daphnia_rep5_R2=${fastqDir}/GSF2380-${SAMPLE5}_R2_001.fastq
daphnia_rep6_R1=${fastqDir}/GSF2380-${SAMPLE6}_R1_001.fastq
daphnia_rep6_R2=${fastqDir}/GSF2380-${SAMPLE6}_R2_001.fastq
daphnia_rep7_R1=${fastqDir}/GSF2380-${SAMPLE7}_R1_001.fastq
daphnia_rep7_R2=${fastqDir}/GSF2380-${SAMPLE7}_R2_001.fastq
daphnia_rep8_R1=${fastqDir}/GSF2380-${SAMPLE8}_R1_001.fastq
daphnia_rep8_R2=${fastqDir}/GSF2380-${SAMPLE8}_R2_001.fastq
daphnia_rep9_R1=${fastqDir}/GSF2380-${SAMPLE9}_R1_001.fastq
daphnia_rep9_R2=${fastqDir}/GSF2380-${SAMPLE9}_R2_001.fastq
daphnia_rep10_R1=${fastqDir}/GSF2380-${SAMPLE10}_R1_001.fastq
daphnia_rep10_R2=${fastqDir}/GSF2380-${SAMPLE10}_R2_001.fastq
daphnia_rep11_R1=${fastqDir}/GSF2380-${SAMPLE11}_R1_001.fastq
daphnia_rep11_R2=${fastqDir}/GSF2380-${SAMPLE11}_R2_001.fastq
daphnia_rep12_R1=${fastqDir}/GSF2380-${SAMPLE12}_R1_001.fastq
daphnia_rep12_R2=${fastqDir}/GSF2380-${SAMPLE12}_R2_001.fastq
daphnia_rep13_R1=${fastqDir}/GSF2380-${SAMPLE13}_R1_001.fastq
daphnia_rep13_R2=${fastqDir}/GSF2380-${SAMPLE13}_R2_001.fastq
daphnia_rep14_R1=${fastqDir}/GSF2380-${SAMPLE14}_R1_001.fastq
daphnia_rep14_R2=${fastqDir}/GSF2380-${SAMPLE14}_R2_001.fastq
daphnia_rep15_R1=${fastqDir}/GSF2380-${SAMPLE15}_R1_001.fastq
daphnia_rep15_R2=${fastqDir}/GSF2380-${SAMPLE15}_R2_001.fastq
daphnia_rep16_R1=${fastqDir}/GSF2380-${SAMPLE16}_R1_001.fastq
daphnia_rep16_R2=${fastqDir}/GSF2380-${SAMPLE16}_R2_001.fastq
daphnia_rep17_R1=${fastqDir}/GSF2380-${SAMPLE17}_R1_001.fastq
daphnia_rep17_R2=${fastqDir}/GSF2380-${SAMPLE17}_R2_001.fastq
daphnia_rep18_R1=${fastqDir}/GSF2380-${SAMPLE18}_R1_001.fastq
daphnia_rep18_R2=${fastqDir}/GSF2380-${SAMPLE18}_R2_001.fastq
daphnia_rep19_R1=${fastqDir}/GSF2380-${SAMPLE19}_R1_001.fastq
daphnia_rep19_R2=${fastqDir}/GSF2380-${SAMPLE19}_R2_001.fastq


OP1=${SAMPLE1}_trno_tagdusted
OP2=${SAMPLE2}_trno_tagdusted
OP3=${SAMPLE3}_trno_tagdusted
OP4=${SAMPLE4}_trno_tagdusted

OP5=${SAMPLE5}_trno_tagdusted
OP6=${SAMPLE6}_trno_tagdusted
OP7=${SAMPLE7}_trno_tagdusted
OP8=${SAMPLE8}_trno_tagdusted

OP9=${SAMPLE9}_trno_tagdusted
OP10=${SAMPLE10}_trno_tagdusted
OP11=${SAMPLE11}_trno_tagdusted
OP12=${SAMPLE12}_trno_tagdusted

OP13=${SAMPLE13}_trno_tagdusted
OP14=${SAMPLE14}_trno_tagdusted
OP15=${SAMPLE15}_trno_tagdusted
OP16=${SAMPLE16}_trno_tagdusted

OP17=${SAMPLE17}_trno_tagdusted
OP18=${SAMPLE18}_trno_tagdusted
OP19=${SAMPLE19}_trno_tagdusted


cd $fastqDir

${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep1_R1} ${daphnia_rep1_R2} -o ${OP1}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep2_R1} ${daphnia_rep2_R1} -o ${OP2}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep3_R1} ${daphnia_rep3_R1} -o ${OP3}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep4_R1} ${daphnia_rep4_R2} -o ${OP4}

${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep5_R1} ${daphnia_rep5_R2} -o ${OP5}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep6_R1} ${daphnia_rep6_R2} -o ${OP6}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep7_R1} ${daphnia_rep7_R2} -o ${OP7}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep8_R1} ${daphnia_rep8_R2} -o ${OP8}

${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep9_R1} ${daphnia_rep9_R2} -o ${OP9}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep10_R1} ${daphnia_rep10_R2} -o ${OP10}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep11_R1} ${daphnia_rep11_R2} -o ${OP11}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep12_R1} ${daphnia_rep12_R2} -o ${OP12}

${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep13_R1} ${daphnia_rep13_R2} -o ${OP13}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep14_R1} ${daphnia_rep14_R2} -o ${OP14}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep15_R1} ${daphnia_rep15_R2} -o ${OP15}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep16_R1} ${daphnia_rep16_R2} -o ${OP16}

${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep17_R1} ${daphnia_rep17_R2} -o ${OP17}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep18_R1} ${daphnia_rep18_R2} -o ${OP18}
${TAGDUST} -ref ${RNAfile} -dust 97 -t ${THREADS} -fe 3 -1 R:N ${daphnia_rep19_R1} ${daphnia_rep19_R2} -o ${OP19}

done
