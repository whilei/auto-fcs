grep "|Manual\|manual" * |cut -f 2 -d "|"| sed "s/fcs.*//g"|sed "s/.*\///g"|more


for i in $(cat toTrans.txt); do
   echo $i
   cp -r ./*/panel2Vis/*$i* /home/thyagara/shared/HRS/annotation/r25_SingleCellBranch/panel2_onlyLiveSingleManuals/
done

grep -i "manual" r25_panel2* |grep "Live_Single_immune_cells"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >~/toSingletTrans.txt


grep -i "manual" r25_panel2* |grep "Live_Single_immune_cells"|cut -f 2,3 -d "|"| sed "s/.fcs.*.png//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >~/toSingletTrans.txt

+

grep -i "manual" r25_panel2* |grep "fcs.CD14-"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >~/toCD14Trans.txt



#number
grep -i "manual" * |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >toTrans.txt
grep -i "manual" * |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT|wc -l
grep -i "manual" *singlecellbranch* |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT|wc -l
grep -i "manual" *r25_panel2* |cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT |grep -v Ctl

#counts per
grep -i "manual" * |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr
grep -i "manual" *singlecellbranch* |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr
grep -i "manual" *r25_panel2* |cut -f 1,3 -d "|"| sed "s/.*IMAGE//g"|sort -f |uniq -i -c |grep -v ANNOT |sort -nr

grep -i "manual" *r25_panel2* |cut -f 1,2,3 -d "|"| sed "s/.*IMAGE//g"|sed "s/C:.*\///g"|sed "s/.fcs.*|/|/g"|grep -v ANNOT > ~/r25_panel2.txt
cat *singlecellbranch* |cut -f 1,2,3 -d "|"| sed "s/.*IMAGE//g"|sed "s/C:.*\///g"|sed "s/.fcs.*|/|/g" |grep -v ANNOT> ~/singlecellbranch.txt



 sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT |grep -v Ctl





find . -type f -name *F1632119_012*Rename*.wsp
find . -type f -name *F1636707_034*Rename*.wsp
cp *F1632119_012*.fcs /home/thyagara/shared/HRS/annotation/testCD8Wsp
cp *F1636707_034*.fcs /home/thyagara/shared/HRS/annotation/testCD8Wsp






grep -i "manual" * |grep "cytotoxic_Tcells-CD8"|cut -f 2 -d "|"| sed "s/.fcs.*//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT |grep -v "Ctl"|grep -v "PBMC"|grep -v "2017-04-25-26-27_PANEL_1_FORTESSA_HB_2017-04-25_BC_CPT_0_020">/scratch.global/lanej/flow/full/results_r25_20full_SS_SubCD8/FULL/toTransCyto.txt

F1632119_012

grep -i 'manual\|abnormal\|bad' ./panel1/* |cut -f 2 -d "|"| sed "s/.fcs.*.png//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >./manualPanel1.txt
cat ./manualPanel1.txt >combo.txt
grep -i 'manual\|abnormal\|bad' ./panel2/* |cut -f 2 -d "|"| sed "s/.fcs.*.png//g"|sed "s/.*\///g"|sort |uniq |grep -v ANNOT >./manualPanel2.txt
cat ./manualPanel2.txt >>combo.txt

sed -i '' -e 's/scp/rsync \-av/g' rsyncscpFCSCD14FCS.txt


