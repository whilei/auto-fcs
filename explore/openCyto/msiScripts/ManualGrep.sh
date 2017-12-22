grep "|Manual\|manual" * |cut -f 2 -d "|"| sed "s/fcs.*//g"|sed "s/.*\///g"|more


for i in $(cat toTrans.txt); do
   echo $i
   cp -r ./*/panel2Vis/*$i* /home/thyagara/shared/HRS/annotation/r25_SingleCellBranch/panel2_onlyLiveSingleManuals/
done

grep -i "manual" * |grep "Live_Single_immune_cells"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >toTrans.txt

grep -i "manual" * |grep "cytotoxic_Tcells-CD8"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >~/toTransCyto.txt

+


#number
grep -i "manual" * |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >toTrans.txt
grep -i "manual" * |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT|wc -l
grep -i "manual" *singlecellbranch* |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT|wc -l
grep -i "manual" *r25_panel2* |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT |grep -v Ctl

#counts per
grep -i "manual" * |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr
grep -i "manual" *singlecellbranch* |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr
grep -i "manual" *r25_panel2* |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr

grep -i "manual" *r25_panel2* |cut -f 1,2,3 -d "|"| sed "s/.*IMAGE//g"|sed "s/C:.*\///g"|sed "s/.fcs.*|/|/g" > ~/r25_panel2.txt
cat *singlecellbranch* |cut -f 1,2,3 -d "|"| sed "s/.*IMAGE//g"|sed "s/C:.*\///g"|sed "s/.fcs.*|/|/g" > ~/singlecellbranch.txt



 sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT |grep -v Ctl


for i in $(cat toTransCyto.txt); do
   echo $i
   cp -r ./*/panel1Vis/*$i*/*cytotoxic_Tcells-CD8+*.png /scratch.global/lanej/flow/full/results_r25_19full_AllSS/FULL/cyto/
done


find . -type f -name *F1632119_012*Rename*.wsp
find . -type f -name *F1636707_034*Rename*.wsp
cp *F1632119_012*.fcs /home/thyagara/shared/HRS/annotation/testCD8Wsp
cp *F1636707_034*.fcs /home/thyagara/shared/HRS/annotation/testCD8Wsp

F1632119_012
