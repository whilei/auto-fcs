#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=124gb,walltime=44:00:00,nodes=1:ppn=24


profile.pl -o detectNovelSubs.profile &

module load parallel
module load R/3.5.0
module load hdf5/hdf5-1.8.9-intel
module load libtiff
module load gcc/8.1.0


threads=2
inputDirectory=/scratch.global/lanej/flow/novel/detect_NoNorm_v6_lymph_Mem/
repoDir=/home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/

echo "rsync"
rsync -avz /scratch.global/lanej/flow/full/results_r26_TcellSubs_Kmeans_wsp_v8/FULL/*/kmeans/*.boolMatrix.txt.gz $inputDirectory
echo "finish rsync"

outputDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v6_lymph_Mem_summary/

ocPopFile=/home/tsaim/lane0212/git/auto-fcs/explore/openCyto/panel1Map.txt

mkdir -p $outputDir
mkdir -p $outputDir"inputs/"

runScript="$outputDir"runscript.txt
echo "" > $runScript



for file in $inputDirectory*.IntMatrix.txt.gz; do
	out=$(basename "$file" _panel1Rename.wsp)
	out="$(echo -e "${out}" | tr -d '[:space:]')"
	currentIn=$outputDir"inputs/$out.in.input.txt"
    echo "$file" > $currentIn
    # echo "$currentIn"
	echo "Rscript /home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/summarizeClusters.R --inputFile $currentIn --inputDirectory $inputDirectory --outputDir $outputDir --threads $threads --ocPopFile $ocPopFile --repoDir $repoDir" >> $runScript

done


parallel --jobs 16 < "$runScript"

# module load parallel
# parallel --jobs 1 < runscript.txt


