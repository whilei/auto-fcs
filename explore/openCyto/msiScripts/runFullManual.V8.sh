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

java -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Xmx60G -jar /home/pankrat2/lane0212/genvisisFlow.jar org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline auto=/scratch.global/lanej/flow/wsp_gates_151_openCyto/ wsp=/scratch.global/lanej/flow/manual/panel1_v8/ fcs=/scratch.global/lanej/flow/full/fcs/ out=/scratch.global/lanej/flow/manual/panel1_v8_counts/ pipe=PCTS_CNTS panel=1



# cd /home/thyagara/shared/HRS/manualFinal/panel 1- v8 manual upload
# cp ./*/*.wsp /scratch.global/lanej/flow/manual/panel1_v8


# cd /home/thyagara/shared/HRS/manualFinal/panel 1- v3 manual upload
# cp ./*/*.wsp /scratch.global/lanej/flow/manual/panel1_v3