#!/usr/bin/env bash 


one_F1636108_016.fcs_panel1.wsp

dir1=/scratch.global/lanej/flow/full/results_r25_9full/FULL/openCytoBatch_0/gatesRename/
dir2=/scratch.global/lanej/flow/full/results_r25_15full/FULL/openCytoBatch_0/gatesRename/
diff $dir1"2016-12-09_PANEL 1_HB_group one_F1636108_016.fcs_panel1Rename.wsp" $dir2"2016-12-09_PANEL 1_HB_group one_F1636108_016.fcs_panel1Rename.wsp"


grep Error *.o