#!/usr/bin/env bash 

revIn=r25_6/
revOut=CD14_CD16_83_76_68_V2/

baseInDir="/scratch.global/lanej/flow/full/results_"$revIn"/FULL/"
outDir=/home/thyagara/shared/HRS/annotation/$revOut
# outDir=/scratch.global/flow/$revOut
mkdir -p $outDir"panel1/"
mkdir -p $outDir"panel2/"

rsync -rv $baseInDir*/panel1Vis/* $outDir"panel1/"

rsync -rv $baseInDir*/panel2Vis/* $outDir"panel2/"








# rsync -rv $baseInDir/openCytoBatch_1/panel1Vis/* $outDir"panel1/"
# rsync -rv $baseInDir/openCytoBatch_5/panel1Vis/* $outDir"panel1/"
# rsync -rv $baseInDir/openCytoBatch_10/panel1Vis/* $outDir"panel1/"
# rsync -rv $baseInDir/openCytoBatch_15/panel1Vis/* $outDir"panel1/"
# rsync -rv $baseInDir/openCytoBatch_20/panel1Vis/* $outDir"panel1/"
# rsync -rv $baseInDir/openCytoBatch_25/panel1Vis/* $outDir"panel1/"
# rsync -rv $baseInDir/openCytoBatch_30/panel1Vis/* $outDir"panel1/"




#sync fcs 
