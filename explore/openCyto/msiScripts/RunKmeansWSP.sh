#!/usr/bin/env bash 

repoDir="/home/tsaim/lane0212/git/auto-fcs/"
repoDir="/Users/Kitty/git/auto-fcs/explore/openCyto/"
workspaceDir="/Volumes/Beta/data/flow/testTcellSubFCS_BoolResults/"
fcsDir="/Volumes/Beta/data/flow/testTcellSubFCS/"
outputDir="/Volumes/Beta/data/flow/testTcellSubWSP_Start/"

Rscript $repoDir"KmeansWSP.R" --workspaceDir $workspaceDir --fcsDir $fcsDir --outputDir $outputDir --repoDir $repoDir

