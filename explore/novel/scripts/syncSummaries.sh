#!/usr/bin/env bash
rsync -avz msi:/scratch.global/lanej/flow/novel/detect_NoNorm_v5_lymph_summary/* /Volumes/Beta2/flow/testSummaryLymph/


Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/collectLocal.R
Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/SummaryClusters.R

Rscript /Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/prepare.R

Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/controlCV.R

cd /Users/Kitty/git/auto-fcs/explore/novel/

zip -r /Users/Kitty/git/auto-fcs/explore/novel/build/metaClusters.build.zip metaClusters2/*

git save

# https://github.com/PankratzLab/auto-fcs/blob/ecac87c6f3886485840e3ea8085264e5e5cf6a29/explore/novel/build/metaClusters.build.zip