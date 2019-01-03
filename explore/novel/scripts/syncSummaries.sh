#!/usr/bin/env bash
rsync -avz msi:/scratch.global/lanej/flow/novel/detect_NoNorm_v6_lymph_Mem_summary/* /Volumes/Beta2/flow/detect_NoNorm_v6_lymph_Mem_summary/


Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/collectLocal.R
Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/SummaryClusters.R

Rscript /Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/prepare.R

Rscript /Users/Kitty/git/auto-fcs/explore/novel/detect/controlCV.R

cd /Users/Kitty/git/auto-fcs/explore/novel/

zip -r /Users/Kitty/git/auto-fcs/explore/novel/build/metaClusters.build.zip metaClusters2/*


rsync -avz /Users/Kitty/git/auto-fcs/explore/novel/metaReport/* msi:/scratch.global/lanej/flow/novel/summaryFiles/

# git save

# https://github.com/PankratzLab/auto-fcs/blob/ecac87c6f3886485840e3ea8085264e5e5cf6a29/explore/novel/build/metaClusters.build.zip



# msiDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v6_lymph_Mem_summary/
# outDir=/Volumes/Beta2/flow/detect_NoNorm_v6_lymph_Mem_summary/