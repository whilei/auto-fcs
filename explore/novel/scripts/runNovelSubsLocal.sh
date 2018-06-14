#!/usr/bin/env bash


script=/Users/Kitty/git/auto-fcs/explore/novel/detect/runNovelSubsetDetection.R
workspaceFiles=/Users/Kitty/git/auto-fcs/explore/novel/testInput.txt
fcsDir=/Volumes/Beta2/flow/testNovels/
outputDir=/Volumes/Beta2/flow/testNovelsOut/
repoDir=/Users/Kitty/git/auto-fcs/explore/novel/detect/

Rscript $script --workspaceFiles $workspaceFiles --fcsDir $fcsDir --outputDir $outputDir --repoDir $repoDir
