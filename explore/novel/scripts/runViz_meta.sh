#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=150gb,walltime=96:00:00,nodes=1:ppn=8

module load java
module load parallel
module load R/3.5.0
module load hdf5/hdf5-1.8.9-intel
module load libtiff
module load gcc/8.1.0







genvisis=/home/tsaim/lane0212/genvisis.viz.jar
baseDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v5_control_examples/
fcs=$baseDir
wsp=$baseDir
out=/scratch.global/lanej/flow/novel/detect_NoNorm_v5_control_examples_meta_viz/
gateOverride=$baseDir
repoDir=/home/tsaim/lane0212/git/auto-fcs
gateOverrideMatchup=$repoDir/explore/novel/scripts/resources/ovvrMatch_update.txt
clusterDir=$baseDir




echo "prepping for meta clusters"
mkdir -p $baseDir"bakInts/"

mv $baseDir/*.IntMatrix.txt.gz  $baseDir"bakInts/"
mapFile=/home/tsaim/lane0212/git/auto-fcs/explore/novel/report/summary.metaMap

Rscript  /home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/ApplyMetaMap.R --inputDirectory $baseDir"bakInts/" --inputMap $mapFile --outputDir $baseDir

java -jar $genvisis org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline \
    fcs=$fcs \
    wsp=$wsp \
    out=$out \
    panel=1 \
    pipe=VIZ \
    gateOverride=$gateOverride \
    gateOverrideMatchup=$gateOverrideMatchup \
    clusterDir=$clusterDir