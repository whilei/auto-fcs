#!/usr/bin/env bash
rsync -avz msi:/scratch.global/lanej/flow/novel/detect_NoNorm_v5_lymph_summary/* /Volumes/Beta2/flow/testSummaryLymph/


Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/collectLocal.R

Rscript /Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/prepare.R