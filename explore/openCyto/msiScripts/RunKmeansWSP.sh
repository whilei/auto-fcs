#!/usr/bin/env bash 

REPO_DIR="/home/tsaim/lane0212/git/auto-fcs/"
REPO_DIR="/Users/Kitty/git/auto-fcs/explore/openCyto/"
workspaceDir="/Volumes/Beta/data/flow/testTcellSubFCS_BoolResults/"
fcsDir="/Volumes/Beta/data/flow/testTcellSubFCS/"
outputDir="/Volumes/Beta/data/flow/testTcellSubWSP_Start"

kmeansSourceFile=$REPO_DIR"kmeansGateTCellSubs.R"

Rscript $REPO_DIR"KmeansWSP.R" --workspaceDir $workspaceDir --fcsDir $fcsDir --outputDir $outputDir --kmeansSourceFile $kmeansSourceFile

