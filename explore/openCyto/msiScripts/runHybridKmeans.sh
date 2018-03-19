#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=62000mb,walltime=60:00:00,nodes=1:ppn=5

module load java
module load perl
module load R
module load riss_util
module load samtools
module load python
profile.pl -o /scratch.global/lanej/flow/full/results_r26_TcellSubs_Kmeans_wsp_v8//FULL/openCytoBatch_27.profile &

echo "start openCytoBatch_27 at: " `date`
/bin/hostname
module load R/3.3.3
module load gcc/6.1.0
module load hdf5/hdf5-1.8.9-intel
module load libtiff

java -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Xmx60G -jar /home/tsaim/lane0212/tempGenv1.jar org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline auto=/scratch.global/lanej/flow/wsp_gates_151_openCyto/ wsp=/scratch.global/lanej/flow/manual/kmeans_consolidated/ fcs=/scratch.global/lanej/flow/full/fcs/ out=/scratch.global/lanej/flow/manual/kmeans_consolidated_counts/ pipe=PCTS_CNTS panel=1
java -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Xmx60G -jar /home/tsaim/lane0212/tempGenv1.jar org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline auto=/scratch.global/lanej/flow/wsp_gates_151_openCyto/ wsp=/scratch.global/lanej/flow/manual/kmeans_Panel1_bcellsubs_regated/ fcs=/scratch.global/lanej/flow/full/fcs/ out=/scratch.global/lanej/flow/manual/kmeans_Panel1_bcellsubs_regated_counts/ pipe=PCTS_CNTS panel=1