#!/usr/bin/env bash

msiDir=/scratch.global/lanej/flow/novel/detect_NewNorms_v2/
outDir=/Volumes/Beta2/flow/detect_NewNorms_v2/

mkdir -p $outDir

rsync -avz msi:$msiDir/*cents.scale $outDir

rsync -avz msi:$msiDir/*cents.inputData $outDir


msiDir=/scratch.global/lanej/flow/novel/detect_v1/
outDir=/Volumes/Beta2/flow/detect_v1/

mkdir -p $outDir

rsync -avz msi:$msiDir/*cents.scale $outDir

rsync -avz msi:$msiDir/*cents.inputData $outDir