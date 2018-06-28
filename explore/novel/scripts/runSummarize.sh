#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=12gb,walltime=96:00:00,nodes=1:ppn=1


profile.pl -o detectNovelSubs.profile &

module load parallel
module load R/3.5.0
module load hdf5/hdf5-1.8.9-intel
module load libtiff
module load gcc/8.1.0

inputDirectory=/scratch.global/lanej/flow/novel/detect_NoNorm_v4_control_examples
outputDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v4_control_examples_summary/

Rscript /home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/summarizeClusters.R --inputDirectory $inputDirectory --outputDir $outputDir