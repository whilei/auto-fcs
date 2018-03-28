#!/usr/bin/env bash 

cd /scratch.global/lanej/flow/manual
find . -type f -name *.wsp > manuals.txt

cd /Volumes/Beta/data/flow/p1Manuals
scp msi:/scratch.global/lanej/flow/manual/manuals.txt ./