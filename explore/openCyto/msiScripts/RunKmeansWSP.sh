#!/usr/bin/env bash 


module load R/3.3.3
module load gcc/6.1.0
module load hdf5/hdf5-1.8.9-intel
module load libtiff

# repoDir="/Users/Kitty/git/auto-fcs/explore/openCyto/"
repoDir="/home/tsaim/lane0212/git/auto-fcs/explore/openCyto/"

# workspaceDir="/Volumes/Beta/data/flow/testTcellSubFCS_BoolResults/"
workspaceDir="/scratch.global/lanej/flow/manual/allManuals/"

# fcsDir="/Volumes/Beta/data/flow/testTcellSubFCS/"
fcsDir="/Volumes/Beta/data/flow/full/fcs/"

# outputDir="/Volumes/Beta/data/flow/testTcellSubWSP_Start/"
outputDir="/scratch.global/lanej/flow/manual/kmeans/"

Rscript $repoDir"KmeansWSP.R" --workspaceDir $workspaceDir --fcsDir $fcsDir --outputDir $outputDir --repoDir $repoDir

