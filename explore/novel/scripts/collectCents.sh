#!/usr/bin/env bash

msiDir=/scratch.global/lanej/flow/novel/detect_v1/
outDir=/Volumes/Beta2/flow/detect_v1/

mkdir -p $outDir

rsync -avz msi:$msiDir/*cents.scale $outDir

rsync -avz msi:$msiDir/*cents.inputData $outDir