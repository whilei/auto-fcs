#!/usr/bin/env bash

F1631217_003


mkdir rand
scp -r msi:/home/thyagara/shared/HRS/annotation/r25/panel1/*F1631217_003* ./rand
scp -r msi:/home/thyagara/shared/HRS/annotation/r25/panel1/*F1631927_005* ./rand

mkdir 42

scp -r msi:/scratch.global/lanej/flow/full/results_r25_17full/FULL/*/panel1vis/*F1631217_003* ./42

scp -r msi:/scratch.global/lanej/flow/full/results_r25_17full/FULL/*/panel1Vis/*F1631927_005* ./42



filePat=F1631376_005
scp -r msi:/home/thyagara/shared/HRS/annotation/r25/panel1/*$filePat* ./rand
scp -r msi:/scratch.global/lanej/flow/full/results_r25_17full/FULL/*/panel1Vis/*$filePat* ./42

mkdir -p $filePat/comp

cp 
