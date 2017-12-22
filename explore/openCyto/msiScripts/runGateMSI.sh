#!/usr/bin/env bash 
module load java
rev=r25_20full_SS_SubCD8
OUTDIR="/scratch.global/lanej/flow/full/results_"$rev"/"
REPO_DIR="/home/tsaim/lane0212/git/auto-fcs/"
p1Full=$REPO_DIR/explore/openCyto/lymph.dev.LSR.f.txt
p2Full=$REPO_DIR/explore/openCyto/dc.dev.LSR.c.txt
jar=/home/pankrat2/lane0212/genvisisOC.jar
p2=$OUTDIR"p2Trim.txt"
p1=$OUTDIR"p1Trim.txt"
batch=32
threads=5

head -n9 $p2Full > $p2
head -n8 $p1Full > $p1

fcsDir=/scratch.global/lanej/flow/full/fcs/
# LOD setup
java -jar $jar one.JL.fcs.OpenCyto inputFCS=/scratch.global/lanej/flow/full/lodFCS/ panel1Map=$REPO_DIR/explore/openCyto/panel1Map.txt panel2Map=$REPO_DIR/explore/openCyto/panel2Map.txt templateLymph=$p1Full outDir="$OUTDIR/LOD/" rSource=$REPO_DIR/explore/openCyto/Lymph_monoWithQC_v5.R templateMonocyte=$p2Full mapFile=$REPO_DIR/explore/openCyto/fcsMapBlankMap.txt genvisis=/home/pankrat2/lane0212/genvisisOC.jar batch=1 memoryInMb=100000 threads=$threads wallTimeInHour=12



# Full setup w/QC 
java -jar $jar one.JL.fcs.OpenCyto inputFCS=$fcsDir panel1Map=$REPO_DIR/explore/openCyto/panel1Map.txt panel2Map=$REPO_DIR/explore/openCyto/panel2Map.txt templateLymph=$p1Full outDir="$OUTDIR/FULL/" rSource=$REPO_DIR/explore/openCyto/Lymph_monoWithQC_v5.R templateMonocyte=$p2Full mapFile=$REPO_DIR/explore/openCyto/fcsMapBlankMap.txt genvisis=/home/pankrat2/lane0212/genvisisOC.jar batch=$batch memoryInMb=62000 threads=$threads wallTimeInHour=68


# Insilico LOD
java -jar $jar one.JL.fcs.OpenCyto inputFCS=/scratch.global/lanej/flow/full/insilicoLODFCS_Ctls/ panel1Map=$REPO_DIR/explore/openCyto/panel1Map.txt panel2Map=$REPO_DIR/explore/openCyto/panel2Map.txt templateLymph=$p1Full outDir="$OUTDIR/IS_LOD/" rSource=$REPO_DIR/explore/openCyto/Lymph_monoWithQC_v5.R templateMonocyte=$p2Full mapFile=$REPO_DIR/explore/openCyto/fcsMapBlankMap.txt genvisis=/home/pankrat2/lane0212/genvisisOC.jar batch=32 memoryInMb=62000 threads=1 wallTimeInHour=48


cd "$OUTDIR"
sed -i "s/gate_tail/tailgate/g" $OUTDIR/FULL/*.RScript
sed -i "s/gate_tail/tailgate/g" $OUTDIR/IS_LOD/*.RScript

#set up viz

coleInDir=/scratch.global/cole0482/fcsVizPipe/r21/run/
coleOutDir="/scratch.global/cole0482/fcsVizPipe/"$rev"/run/"
mkdir -p $coleOutDir
cp -r $coleInDir"panel1/" $coleOutDir"panel1/"
cp -r $coleInDir"panel2/" $coleOutDir"panel2/"
cp $coleInDir"submit.sh" $coleOutDir"submit.sh"
lowPriorityFile=/scratch.global/cole0482/fcsVizPipe/lowPriority.txt
priorityFile=$REPO_DIR/explore/openCyto/highPriority.txt

sed -i "s/rev=r21/rev=$rev/g" $coleOutDir/*/*.qsub

batchIters=$(($batch-1))
for i in `seq 0 $batchIters`;do
	sub="$OUTDIR/FULL/openCytoBatch_$i.pbs"
	wsp="$OUTDIR/FULL/openCytoBatch_$i/gates/"
	wspRename="$OUTDIR/FULL/openCytoBatch_$i/gatesRename/"
    echo "mkdir -p $wspRename" >> $sub
    echo "cp $wsp/*Rename.wsp $wspRename" >> $sub

	outP1="$OUTDIR/FULL/openCytoBatch_$i/panel1Vis/"
	echo "java -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Xmx60G -jar $jar org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline wsp=$wspRename fcs=$fcsDir out=$outP1 pipe=VIZ panel=1 priority=$priorityFile lowPriority=$lowPriorityFile" >> $sub

    outP2="$OUTDIR/FULL/openCytoBatch_$i/panel2Vis/"
	echo "java -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Xmx60G -jar $jar org.genvisis.one.ben.fcs.auto.FCSProcessingPipeline wsp=$wspRename fcs=$fcsDir out=$outP2 pipe=VIZ panel=2 priority=$priorityFile lowPriority=$lowPriorityFile" >> $sub



	
	done 
