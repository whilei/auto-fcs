#!/usr/bin/env bash

msiDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v5_summary/
outDir=/Volumes/Beta2/flow/detect_NoNorm_v5_summary/
cd $outDir
mkdir -p $outDir

rsync -avz msi:$msiDir/* $outDir


# Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/GenTmpSummary.R
Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/knit.R
Rscript /Users/Kitty/git/auto-fcs/explore/novel/metaClusters/prepare.R
cd /Users/Kitty/git/auto-fcs/explore/novel/scripts
#git save
