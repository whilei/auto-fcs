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

IFS=$'\n'
for i in $(cat missing_desc.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/manualFinal/OC_Fails/missing_desc/
done

   cp  /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/gatesRename/"$i"_panel2Rename.wsp /home/thyagara/shared/HRS/manualFinal/r25OCmanualpanel_missing/panel2/



IFS=$'\n'
for i in $(cat manualWSPs.txt); do
   echo "$i"
   cp  "$i" /home/thyagara/shared/HRS/manualFinal/consolidated/
done



IFS=$'\n'
for i in $(cat /home/tsaim/lane0212/git/auto-fcs/explore/openCyto/extractManualComp/manualUse.100.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/fcs/"$i" /home/thyagara/shared/HRS/OC_manualComparision/
   cp  /scratch.global/lanej/flow/full/results_r25_21full_SS_SubCD8_SCD14/FULL/*/gatesRename/"$i"_panel*Rename.wsp /home/thyagara/shared/HRS/OC_manualComparision/
done



for i in $(cat /home/tsaim/lane0212/toSanityCheck.txt); do
   echo $i
   cp -ru /scratch.global/lanej/flow/full/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/*/panel1Vis/*$i*/ /home/thyagara/shared/HRS/annotation/r25/sanityCheck/
done



for i in $(cat /home/tsaim/lane0212/toSanityCheck_NewManuals.txt); do
   echo $i
   cp -ru /home/thyagara/shared/HRS/annotation/r25/panel1/*/*$i*/ /home/thyagara/shared/HRS/annotation/r25/sanityCheckNewManuals/
done



for i in $(cat toSanityCheck_NewManuals.txt); do
   echo $i
   scp -r msi:/home/thyagara/shared/HRS/annotation/r25/sanityCheck/*$i*/ ./newMansNewImages
done


IFS=$'\n'
for i in $(cat before_after.txt); do
   echo $i
   cp  ./newMansOldImages/*/$i* ./combo/$i.old.png
   cp  ./newMansNewImages/*/$i* ./combo/$i.new.png

done


IFS=$'\n'
for i in $(cat /home/tsaim/lane0212/wspstopull_BADpDCsamples); do
   echo "$i"
   rsync  /scratch.global/lanej/flow/full/fcs/"$i" /home/tsaim/lane0212/wspstopull_BADpDCsamples_wsp_fcs/
   rsync  /scratch.global/lanej/flow/full/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/*/gatesRename/"$i"_panel2Rename.wsp /home/tsaim/lane0212/wspstopull_BADpDCsamples_wsp_fcs/
done



IFS=$'\n'
for i in $(cat mylistOfFCSFiles.txt); do
   echo "$i"
   cp  /scratch.global/lanej/flow/full/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/*/gatesRename/"$i"_panel*Rename.wsp /scratch.global/cole0482/resultsDir/
done


   rsync  /scratch.global/lanej/flow/full/fcs/"$i" /home/tsaim/lane0212/wspstopull_BADpDCsamples_wsp_fcs/


IFS=$'\n'
for i in $(cat /Users/Kitty/Downloads/list.txt); do
   echo "$i"
   scp "msi:/scratch.global/lanej/flow/full/fcs/*$i" /Volumes/Beta/data/flow/zf_ec_tcellTest/
done

scp msi:/scratch.global/lanej/flow/full/fcs/*1_HB-appsettingsreset_Groupone_Ctl-B_005.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631959_005.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631956_004.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1632225_001.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631922_003.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1632167_012.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1632245_010.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631974_008.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631995_001.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631964_005.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1631976_010.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1632206_002.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1632189_005.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1632190_014.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/
scp msi:/scratch.global/lanej/flow/full/fcs/*one_F1636740_021.fcs /Volumes/Beta/data/flow/zf_ec_tcellTest/


for i in $(cat /home/tsaim/lane0212/outliers.txt); do
   echo $i
   cp -ru /scratch.global/lanej/flow/full/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/*/panel2Vis/*$i*/ /home/thyagara/shared/HRS/annotation/r25/sanityCheck/
done


for file in ./results_r25_1*full/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_1*full/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done


for file in ./results_r25_*[^25]full; do
   echo "$file"
done


for file in ./results_r*[^25full_SS_SubCD8_SCD14_Manuals]*/; do
   echo "$file"
done

for file in ./results_r[^25]*/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   echo "$file"
done













for file in ./results_r25_1*full/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done


find  ./results_r25_1*full/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;

find  ./results_r25_20full_SS_SubCD8/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_21full_SS_SubCD8_SCD14/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;

find  ./results_r20/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r21/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r22/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r23/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r24/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r4/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r5/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r6/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r7/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r8/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r9/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r10/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r11/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r12/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r13/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r14/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;



find  ./results_r25/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_2/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_3/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_4/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_5/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_6/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_7/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_8/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;

find  ./results_r25_9full/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_16full/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_17full/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_18full/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;


find  ./results_r25_19full_AllSS/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_19full_SS_SubCD8/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25_19full_SS_SubCD8/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;

find  . -type f -name "gate_plots*.pdf" -exec rm {}  \;

find  ./results_*/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;
find  ./results_r25*/FULL/openCytoBatch_*/panel*Vis/*/ -type f -name "*.png" -exec rm {}  \;





for file in ./results_r25_1*full/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done






for file in ./results_r25_24full_SS_SubCD8_SCD14_Manuals/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_20full_SS_SubCD8/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done





for file in ./results_25_IgD_HelperT_test_79_64/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_CD8_sens_Tcells_71_72_69/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./IgD_HelperT_test_79_64/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_CD8_63_69_73_Tcells_71_Bcells_78/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_CD8_sens_81_Tcells_72/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_2/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done


for file in ./results_r25_3/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done
for file in ./results_r25_4/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done
for file in ./results_r25_5/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done


for file in ./results_r25_23full_SS_SubCD8_SCD14_Manuals/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

for file in ./results_r25_21full_SS_SubCD8_SCD14/FULL/openCytoBatch_*/panel*Vis/*/*.png; do
   rm "$file"
done

rm -r *Tcells* 
rm -r results_25_IgD_HelperT_test_79_64/
rm -r IgD_HelperT_test_79_64/
rm -r results_r25_lymphVersion/
rm -r *LODTest*



find . -type f -name "*.png" -exec rm {}  \; 

find . -type f -name '*.png' -exec du -ch {} + | grep total

find . -name "*.png" -print0 | du -sb --files0-from=-  | awk '{ total += $1} END { print total/1024/1024/1024 }'



find . -name "*.wsp" -print0 | du -sb --files0-from=-  | awk '{ total += $1} END { print total/1024/1024/1024 }'
