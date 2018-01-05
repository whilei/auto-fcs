#!/usr/bin/env bash

outDir=/home/tsaim/lane0212/git/auto-fcs/explore/openCyto/LOD/run/
mkdir -p $outDir

batch=12
batchIters=$(($batch))
for i in `seq 1 $batchIters`;do
	grep -v "Rscript" /home/tsaim/lane0212/git/auto-fcs/explore/openCyto/msiScripts/InsilicoLOD.sh > $outDir/"InsilicoLOD_$i.qsub"
	cp /Users/Kitty/git/auto-fcs/explore/openCyto/LOD/SubSample_NonCtls.R $outDir/"SubSample_NonCtls_$i.R"
	batchFile="P1_P2_matched.goods.batch$i.txt"
	sed -i "s/replaceWithBatch/$batchFile/g" $outDir/"SubSample_NonCtls_$i.R"
done	
