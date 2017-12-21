 grep "|Manual\|manual" * |cut -f 2 -d "|"| sed "s/fcs.*//g"|sed "s/.*\///g"|more



for i in $(cat toTrans.txt); do
   echo $i
   cp -r ./*/panel2Vis/*$i* /home/thyagara/shared/HRS/annotation/r25_SingleCellBranch/panel2_onlyLiveSingleManuals/
done

grep -i "manual" * |grep "Live_Single_immune_cells"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >toTrans.txt