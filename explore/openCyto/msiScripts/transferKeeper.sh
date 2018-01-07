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




for i in $(cat /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/toCD14Trans.txt); do
   echo $i
   cp -ru /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/panel2Vis/*$i*/ /home/thyagara/shared/HRS/annotation/r25/r25_CD14Branch/
done


for i in $(cat /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/newImagesPanel1.txt); do
   echo $i
   cp -ru /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/panel1Vis/*$i*/ /home/thyagara/shared/HRS/annotation/r25/r25_NewImages/panel1/
done

for i in $(cat /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/newImagesPanel2.txt); do
   echo $i
   cp -ru /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/panel2Vis/*$i*/ /home/thyagara/shared/HRS/annotation/r25/r25_NewImages/panel2/
done


IFS=$'\n'
for i in $(cat /scratch.global/lanej/flow/full/panel1_OC_Fails.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/manualFinal/OC_Fails/panel1/
done

for i in $(cat /scratch.global/lanej/flow/full/panel2_OC_Fails.txt); do
   echo "$i"
   cp /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/manualFinal/OC_Fails/panel2/
done


for i in $(cat /home/tsaim/lane0212/tmp/missingFCS.txt); do
   val=$(find . -type f -name *$i* | wc -l)
   echo -e "$i\t$val"
done >~/missingRun.txt



IFS=$'\n'
for i in $(cat finaltransfers.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/manualFinal/singletBranchCD14BranchNewFiles/
   cp  /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/gatesRename/"$i"_panel*Rename.wsp /home/thyagara/shared/HRS/manualFinal/singletBranchCD14BranchNewFiles/
done



IFS=$'\n'
for i in $(cat panel1.missing.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/manualFinal/r25OCmanualpanel_missing/panel1/
   cp  /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/gatesRename/"$i"_panel1Rename.wsp /home/thyagara/shared/HRS/manualFinal/r25OCmanualpanel_missing/panel1/
done


IFS=$'\n'
for i in $(cat panel2.missing.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/manualFinal/r25OCmanualpanel_missing/panel2/
   cp  /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/gatesRename/"$i"_panel2Rename.wsp /home/thyagara/shared/HRS/manualFinal/r25OCmanualpanel_missing/panel2/
done






