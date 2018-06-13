#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=252gb,walltime=96:00:00,nodes=1:ppn=24

module load java
module load perl
module load R
module load riss_util
module load samtools
module load python
module load parallel

profile.pl -o detectNovelSubs.profile &

echo "start detectNovelSubs at: " `date`
/bin/hostname

script=/home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/runNovelSubsetDetection.R
fcsDir=/scratch.global/lanej/flow/full/fcs/
outputDir=/scratch.global/lanej/flow/novel/detect_v1/
mkdir -p $outputDir
mkdir -p $outputDir"inputs/"
repoDir=/home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/


runScript="$outputDir"runscript.txt
echo "" > $runScript

for file in /scratch.global/lanej/flow/full/results_r26_TcellSubs_Kmeans_wsp_v8/FULL/*/gatesRename/*_panel1Rename.wsp; do
	out=$(basename "$file" _panel1Rename.wsp)
	out="$(echo -e "${out}" | tr -d '[:space:]')"
	currentIn=$outputDir"inputs/$out.wsp.input.txt"
    echo "$file" > $currentIn
    # echo "$currentIn"
	echo "Rscript $script --workspaceFiles $currentIn --fcsDir $fcsDir --outputDir $outputDir --repoDir $repoDir" >> $runScript

done


parallel --jobs 24 < "$runScript"




echo "end detectNovelSubs at: " `date`




