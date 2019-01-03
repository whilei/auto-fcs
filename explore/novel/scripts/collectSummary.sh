#!/usr/bin/env bash

msiDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v6_lymph_Mem_summary/
outDir=/Volumes/Beta2/flow/detect_NoNorm_v6_lymph_Mem_summary/
cd $outDir
mkdir -p $outDir

rsync -avz msi:$msiDir/* $outDir

# GenTmpSummary.R

Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/
Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/SummaryClusters.R
Rscript /Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/prepare.R
cd /Users/Kitty/git/auto-fcs/explore/novel/scripts
#git save
