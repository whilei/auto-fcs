#!/usr/bin/env bash 

dirOut=/Volumes/Beta/data/flow/kmeansValidate/results_r26_TcellSubs_Kmeans_wsp_v8/
mkdir -p $dirOut
rsync -av msi:/scratch.global/lanej/flow/full/results_r26_TcellSubs_Kmeans_wsp_v8/FULL/openCytoBatch*/kmeans/*counts.txt $dirOut
