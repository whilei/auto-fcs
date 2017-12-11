#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=62000mb,walltime=36:00:00,nodes=1:ppn=2

module load java
module load perl
module load R
module load riss_util
module load samtools
module load python
profile.pl -o /scratch.global/lanej/flow/full/results_r25_9full//FULL/openCytoBatch_5.profile &

echo "start isLOD at: " `date`
/bin/hostname
module load R/3.3.3
module load gcc/6.1.0
module load hdf5/hdf5-1.8.9-intel

Rscript /home/tsaim/lane0212/git/auto-fcs/explore/openCyto/LOD/SubSample.R
