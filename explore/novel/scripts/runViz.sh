#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=150gb,walltime=96:00:00,nodes=1:ppn=8

module load java

genvisis=/home/tsaim/lane0212/genvisis.viz.jar
baseDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v4_control_examples/
fcs=$baseDir
wsp=$baseDir
out=/scratch.global/lanej/flow/novel/detect_NoNorm_v4_control_examples_viz/
gateOverride=$baseDir
repoDir=/home/tsaim/lane0212/git/auto-fcs
gateOverrideMatchup=$repoDir/explore/novel/scripts/resources/ovvrMatch_update.txt
clusterDir=$baseDir
java -jar $genvisis org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline \
    fcs=$fcs \
    wsp=$wsp \
    out=$out \
    panel=1 \
    pipe=VIZ \
    gateOverride=$gateOverride \
    gateOverrideMatchup=$gateOverrideMatchup \
    clusterDir=$clusterDir