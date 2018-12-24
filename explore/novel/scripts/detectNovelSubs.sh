#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#PBS -e $PBS_JOBNAME.$PBS_JOBID.e
#PBS -o $PBS_JOBNAME.$PBS_JOBID.o
#PBS -m ae
#PBS -l mem=250gb,walltime=96:00:00,nodes=1:ppn=24


profile.pl -o detectNovelSubs.profile &

module load parallel
module load R/3.5.0
module load hdf5/hdf5-1.8.9-intel
module load libtiff
module load gcc/8.1.0

#note remove conda from bash rc, reintall igraph, cytofkit, CLusterR
echo "start detectNovelSubs at: " `date`
/bin/hostname

script=/home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/runNovelSubsetDetection.R
fcsDir=/scratch.global/lanej/flow/full/fcs/
subsetGate='"Live cells \(PE-\)"'
subsetGateQsub='"Live cells (PE-)"'
outputDir=/scratch.global/lanej/flow/novel/detect_NoNorm_v6_lymph_Mem/
mkdir -p $outputDir
mkdir -p $outputDir"inputs/"
repoDir=/home/tsaim/lane0212/git/auto-fcs/explore/novel/detect/


runScript="$outputDir"runscript.txt
echo "" > $runScript
cd $outputDir"inputs/"
for file in /scratch.global/lanej/flow/full/results_r26_TcellSubs_Kmeans_wsp_v8/FULL/*/gatesRename/*_panel1Rename.wsp; do
    out=$(basename "$file" _panel1Rename.wsp)
    out="$(echo -e "${out}" | tr -d '[:space:]')"
    currentIn=$outputDir"inputs/$out.wsp.input.txt"
    echo "$file" > $currentIn
    # echo "$currentIn"
    echo "Rscript $script --subsetGate $subsetGateQsub --workspaceFiles $currentIn --fcsDir $fcsDir --outputDir $outputDir --repoDir $repoDir" >> $runScript
    echo "module load parallel" > $currentIn.run
    echo "module load R/3.5.0" >> $currentIn.run
    echo "module load hdf5/hdf5-1.8.9-intel" >> $currentIn.run
    echo "module load libtiff" >> $currentIn.run
    echo "module load gcc/8.1.0" >> $currentIn.run
    echo "Rscript $script --subsetGate $subsetGateQsub --workspaceFiles $currentIn --fcsDir $fcsDir --outputDir $outputDir --repoDir $repoDir" >> $currentIn.run
    # qsub $currentIn.qsub
done

# find $outputDir"inputs/" -name "*.run" \
# | parallel -j 24 "quicksub {}"


# sed -i "s/mem=16384mb/mem=64000mb/g"  *.qsub
# sed -i "s/walltime=01:00:00/walltime=03:00:00/g" *.qsub
# find $outputDir"inputs/" -name "*.e" -type f |parallel -j 4 --plus  "echo {6.}"
# find $outputDir"inputs/" -name "*.qsub" -type f | parallel -j 24 "qsub {}"

# find . -type f -name "*subFirst_TRUE_normalize_FALSE*" | parallel -j 24 "rm {}"
parallel --jobs 24 < "$runScript"




echo "end detectNovelSubs at: " `date`




