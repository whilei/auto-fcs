#!/usr/bin/env bash 

dirOut=/Volumes/Beta/data/flow/kmeansValidate/results_r26_TcellSubs_v4/
mkdir -p $dirOut
rsync -av msi:/scratch.global/lanej/flow/full/results_r26_TcellSubs_v4/FULL/openCytoBatch*/kmeans/*counts.txt $dirOut
