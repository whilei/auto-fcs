#!/usr/bin/env bash 


cd /Volumes/Beta2/flow


dir=detect_NoNorm_v5_control_examples_meta_viz_3
mkdir -p $dir

cd $dir


rsync -avz msi:/scratch.global/lanej/flow/novel/$dir/* ./

java -jar /Users/Kitty/workspace.other/Genvisis/Assembly/target/genvisis.jar org.genvisis.one.ben.flowannot.FlowAnnotator