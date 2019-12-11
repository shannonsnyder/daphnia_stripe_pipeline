#!/bin/bash

#Setting variables:
#
DIR=/home/ssnyde11/scratch/daphnia_stripe_2/BWA_alignment
source ${DIR}/configfile

BWAdir=${BASEDIR}/${EXPERIMENT}/BWAdir

mkdir ${BWAdir}
mkdir ${BWAdir}/${GENOME_DIR}
ln -s ${BASEDIR}/${GENOME_DIR}/${GENOME_FILE} ${BWAdir}/${GENOME_DIR}/${GENOME_FILE}


cd ${BWAdir}

echo "Indexing the Paramecium genome using bwa ..."
echo "bwa index ${GENOME_DIR}/${GENOME_FILE}"
${BWA}    index ${GENOME_DIR}/${GENOME_FILE}

echo "Starting alignments ..."
for fq in ${fastqDIR}/*_trno_tagdusted_READ?.fq;
do

    echo "bwa aln -t ${THREADS} -n 3 ${GENOME_DIR}/${GENOME_FILE} -f $(basename ${fq} .fq).sai ${fq}"
    ${BWA}    aln -t ${THREADS} -n 3 ${GENOME_DIR}/${GENOME_FILE} -f $(basename ${fq} .fq).sai ${fq}

done

for fq in ${fastqDIR}/*_trno_tagdusted_READ1.fq; 
do

echo "bwa sampe ${GENOME_DIR}/${GENOME_FILE} $(basename $fq _READ1.fq)_READ1.sai $(basename $fq _READ1.fq)_READ2.sai \
${fastqDIR}/$read1 ${fastqDIR}/$read2 | \
${SAMTOOLS} view -uS - | \
${SAMTOOLS} sort -O BAM - > $(basename $fq _trno_tagdusted_READ1.fq)_sorted.bam"

${BWA} sampe ${GENOME_DIR}/${GENOME_FILE} $(basename $fq _READ1.fq)_READ1.sai $(basename $fq _READ1.fq)_READ2.sai $fq $fastqDIR/$(basename $fq _READ1.fq)_READ2.fq | \
    ${SAMTOOLS} view -uS - | \
    ${SAMTOOLS} sort -O BAM - > $(basename $fq _trno_tagdusted_READ1.fq)_sorted.bam

echo "samtools index -b $(basename $fq _trno_tagdusted_READ1.fq)_sorted.bam "
${SAMTOOLS} index -b $(basename $fq _trno_tagdusted_READ1.fq)_sorted.bam

#FILTERED_BAM=$(basename $fq _trno_tagdusted_READ1.fq)_filtered.bam
#.. post-alignment filtering for proper alignments and MAPQ >= 10:
#
echo "samtools view -f 2 -q 10 -u ${SORTED_BAM} | samtools    sort -O BAM -@ 10 - > $(basename $fq _trno_tagdusted_READ1.fq)_filtered.bam"
${SAMTOOLS}    view -f 2 -q 10 -u $(basename $fq _trno_tagdusted_READ1.fq)_sorted.bam | ${SAMTOOLS} sort -O BAM -@ 10 - > $(basename $fq _trno_tagdusted_READ1.fq)_filtered.bam

echo "samtools index -b $(basename $fq _trno_tagdusted_READ1.fq)_filtered.bam"
${SAMTOOLS}    index -b $(basename $fq _trno_tagdusted_READ1.fq)_filtered.bam

done
