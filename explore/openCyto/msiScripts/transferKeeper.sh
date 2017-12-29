#!/usr/bin/env bash


qsub -A thyagara -W group_list=thyagara keepTransfer.qsub

newgrp thyagara
while true; do
for i in $(cat /scratch.global/lanej/flow/full/results_r25_20full_SS_SubCD8/FULL/toTransCyto.txt); do
   echo $i
   cp -ru /scratch.global/lanej/flow/full/results_r25_20full_SS_SubCD8/FULL/*/panel1Vis/*$i*/ /home/thyagara/shared/HRS/annotation/r25/r25_CD8Branch/
done
sleep 300
done