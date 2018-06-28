#!/bin/bash

mkdir -p /Volumes/Beta2/flow/detect_NoNorm_v4_control_examples/summary
cd /Volumes/Beta2/flow/detect_NoNorm_v4_control_examples/summary
rsync -avz msi:/scratch.global/lanej/flow/novel/detect_NoNorm_v4_control_examples_summary/* ./


mkdir -p /Volumes/Beta2/flow/detect_NoNorm_v4_control_examples/viz
cd /Volumes/Beta2/flow/detect_NoNorm_v4_control_examples/viz

rsync -avz msi:/scratch.global/lanej/flow/novel/detect_NoNorm_v4_control_examples_viz/* ./


java -jar /Users/Kitty/workspace.other/Genvisis/Assembly/target/genvisis.jar org.genvisis.one.ben.flowannot.FlowAnnotator
