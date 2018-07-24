#!/usr/bin/env bash

msiDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v5_summary/
outDir=/Volumes/Beta2/flow/detect_NoNorm_v5_summary/

mkdir -p $outDir

rsync -avz msi:$msiDir/* $outDir