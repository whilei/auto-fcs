 grep "|Manual\|manual" * |cut -f 2 -d "|"| sed "s/fcs.*//g"|sed "s/.*\///g"|more



for i in $(cat toTrans.txt); do
   echo $i
   cp -r ./*/panel2Vis/*$i* /home/thyagara/shared/HRS/annotation/r25_SingleCellBranch/panel2_onlyLiveSingleManuals/
done

grep -i "manual" * |grep "Live_Single_immune_cells"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >toTrans.txt

grep -i "manual" * |grep "cytotoxic_Tcells-CD8"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >/scratch.global/lanej/flow/full/results_r25_19full_AllSS/FULL/toTransCyto.txt

+


#number
grep -i "manual" * |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >toTrans.txt

#counts per
grep -i "manual" * |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr




for i in $(cat toTransCyto.txt); do
   echo $i
   cp -r ./*/panel1Vis/*$i*/*cytotoxic_Tcells-CD8+*.png /scratch.global/lanej/flow/full/results_r25_19full_AllSS/FULL/cyto/
done


find . -type f -name *F1632119_012*Rename*.wsp
F1632119_012
