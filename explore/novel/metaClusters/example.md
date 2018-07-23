---
title: "Example"
author: "JL"
date: "7/23/2018"
output: 
  html_document: 
    keep_md: yes
---

## Example workflow

1. Select "Tsne Plots"
1. Color middle tsne plot by "naive_ClusterFreq" using the "Middle Plot Color" dropdown to see which meta clusters are naive cells
2. Meta clusters 1, 2, 8, 9, and 16 seem to be made up of mostly naive cells (less so 8)
3. Select meta clusters 1, 2, 8, 9, and 16 in the "Meta clusters to characterize" dropdown
4. Select "Raw Marker Heatmap" to see which markers differentiate these meta-clusters
  - Seems to be IgD, CD95, CD19, maybe CD4
5. Similar process for "Normalized Heatmap"
6. Select "Marker Distributions"
  - Select IgD, CD95, CD19, and CD4 in the "Markers" dropdown
  - Resonably separated distributions
8. Select "Population Freq Heatmap", can confirm that cluster 8 is a little less naive-like
7. Go back to "Tsne Plots" and color a plot by IgD 

### Description of tabs




|TAB                           |DESCRIPTION                                                                                    |
|:-----------------------------|:----------------------------------------------------------------------------------------------|
|Example                       |This tab, a little overview and an example                                                     |
|Tsne Plots                    |Three t-sne plots, with options to color each differently                                      |
|Raw Marker Heatmap            |Heatmap using "Raw" marker values                                                              |
|Normalized Marker Heatmap     |Heatmap using normalized marker values                                                         |
|Marker Distributions          |Distributions of  marker values, top is "Raw", bottom is normalized                            |
|Population Freq Heatmap       |Heatmap using the frequency of known populations in each cluster                               |
|Total Population Freq Heatmap |Heatmap using the proportion of events in each phenograph cluster out of all events            |
|Population Distributions      |Distributions of  population values, top is frequency in cluster, bottom is frequency of known |


### TODO

1. legends!! Currently the legends are placed over the plots of interest
1. add p-values to distribution plots

### Current Methods


1. Run phenograph on each individual sample, starting with cytotoxic T cells
  - Results displayed here are from CTL samples run on LSR only
2. For each sample's phenograph cluster compute:
  1.  median compensated/transformed expression across all markers used (calling this "RAW")
  2.  median of the normalized (mean 0, SD 1) compensated/transformed expression across all markers use
  3. Frequency of known cytotoxic subsets in the cluster
  4.  Proportion of events in the phenograph cluster out of all events in each known cytotoxic subset
3. Combine individual sample's centroids into a single matrix
4. Run phenograph on the combined matrix (currently using "RAW")
5. Run tsne on the combined matrix (currently using "RAW")
6. Plot results, coloring by things

### Data column descriptions

- just for reference


|COLUMN                      |DESCRIPTION                                                                                                         |
|:---------------------------|:-------------------------------------------------------------------------------------------------------------------|
|SAMPLE                      |Sample name                                                                                                         |
|PHENOGRAPH_CLUSTER          |Phenograph cluster for the sample                                                                                   |
|central.memory              |Count of central.memory events in this phenograph cluster                                                           |
|effector                    |Count of effector events in this phenograph cluster                                                                 |
|effector.memory             |Count of effector.memory events in this phenograph cluster                                                          |
|naive                       |Count of naive events in this phenograph cluster                                                                    |
|CD28P_27M                   |Count of CD28P_27M events in this phenograph cluster                                                                |
|E                           |Count of E events in this phenograph cluster                                                                        |
|EM1                         |Count of EM1 events in this phenograph cluster                                                                      |
|EM2                         |Count of EM2 events in this phenograph cluster                                                                      |
|EM3                         |Count of EM3 events in this phenograph cluster                                                                      |
|EM4                         |Count of EM4 events in this phenograph cluster                                                                      |
|pE1                         |Count of pE1 events in this phenograph cluster                                                                      |
|pE2                         |Count of pE2 events in this phenograph cluster                                                                      |
|TOTAL_PHENOGRAPH_COUNTS     |Total events in sample's phenograph cluster                                                                         |
|naive_TotalFreq             |Proportion of events in this phenograph cluster out of all events in  naive                                         |
|effector_TotalFreq          |Proportion of events in this phenograph cluster out of all events in  effector                                      |
|central.memory_TotalFreq    |Proportion of events in this phenograph cluster out of all events in  central.memory                                |
|effector.memory_TotalFreq   |Proportion of events in this phenograph cluster out of all events in  effector.memory                               |
|E_TotalFreq                 |Proportion of events in this phenograph cluster out of all events in  E                                             |
|EM1_TotalFreq               |Proportion of events in this phenograph cluster out of all events in  EM1                                           |
|pE2_TotalFreq               |Proportion of events in this phenograph cluster out of all events in  pE2                                           |
|EM2_TotalFreq               |Proportion of events in this phenograph cluster out of all events in  EM2                                           |
|EM4_TotalFreq               |Proportion of events in this phenograph cluster out of all events in  EM4                                           |
|EM3_TotalFreq               |Proportion of events in this phenograph cluster out of all events in  EM3                                           |
|CD28P_27M_TotalFreq         |Proportion of events in this phenograph cluster out of all events in  CD28P_27M                                     |
|pE1_TotalFreq               |Proportion of events in this phenograph cluster out of all events in  pE1                                           |
|naive_ClusterFreq           |Frequency of population naive in this phenograph cluster                                                            |
|effector_ClusterFreq        |Frequency of population effector in this phenograph cluster                                                         |
|central.memory_ClusterFreq  |Frequency of population central.memory in this phenograph cluster                                                   |
|effector.memory_ClusterFreq |Frequency of population effector.memory in this phenograph cluster                                                  |
|E_ClusterFreq               |Frequency of population E in this phenograph cluster                                                                |
|EM1_ClusterFreq             |Frequency of population EM1 in this phenograph cluster                                                              |
|pE2_ClusterFreq             |Frequency of population pE2 in this phenograph cluster                                                              |
|EM2_ClusterFreq             |Frequency of population EM2 in this phenograph cluster                                                              |
|EM4_ClusterFreq             |Frequency of population EM4 in this phenograph cluster                                                              |
|EM3_ClusterFreq             |Frequency of population EM3 in this phenograph cluster                                                              |
|CD28P_27M_ClusterFreq       |Frequency of population CD28P_27M in this phenograph cluster                                                        |
|pE1_ClusterFreq             |Frequency of population pE1 in this phenograph cluster                                                              |
|CD27_RAW_CENTROID           |Median raw (but after compensating/logicle transform) expression of CD27in this phenograph cluster                  |
|HLA.DR_RAW_CENTROID         |Median raw (but after compensating/logicle transform) expression of HLA.DRin this phenograph cluster                |
|CD19_RAW_CENTROID           |Median raw (but after compensating/logicle transform) expression of CD19in this phenograph cluster                  |
|CD8_RAW_CENTROID            |Median raw (but after compensating/logicle transform) expression of CD8in this phenograph cluster                   |
|IgD_RAW_CENTROID            |Median raw (but after compensating/logicle transform) expression of IgDin this phenograph cluster                   |
|CD3_RAW_CENTROID            |Median raw (but after compensating/logicle transform) expression of CD3in this phenograph cluster                   |
|CCR7_RAW_CENTROID           |Median raw (but after compensating/logicle transform) expression of CCR7in this phenograph cluster                  |
|CD28_RAW_CENTROID           |Median raw (but after compensating/logicle transform) expression of CD28in this phenograph cluster                  |
|CD95_RAW_CENTROID           |Median raw (but after compensating/logicle transform) expression of CD95in this phenograph cluster                  |
|CD45RA_RAW_CENTROID         |Median raw (but after compensating/logicle transform) expression of CD45RAin this phenograph cluster                |
|CD4_RAW_CENTROID            |Median raw (but after compensating/logicle transform) expression of CD4in this phenograph cluster                   |
|SAMPLE_RAW_CENTROID         |Sample used for centroids (just a check)                                                                            |
|CD27_SCALED_CENTROID        |Median scaled (after compensating/logicle transform and normalizing) expression of CD27in this phenograph cluster   |
|HLA.DR_SCALED_CENTROID      |Median scaled (after compensating/logicle transform and normalizing) expression of HLA.DRin this phenograph cluster |
|CD19_SCALED_CENTROID        |Median scaled (after compensating/logicle transform and normalizing) expression of CD19in this phenograph cluster   |
|CD8_SCALED_CENTROID         |Median scaled (after compensating/logicle transform and normalizing) expression of CD8in this phenograph cluster    |
|IgD_SCALED_CENTROID         |Median scaled (after compensating/logicle transform and normalizing) expression of IgDin this phenograph cluster    |
|CD3_SCALED_CENTROID         |Median scaled (after compensating/logicle transform and normalizing) expression of CD3in this phenograph cluster    |
|CCR7_SCALED_CENTROID        |Median scaled (after compensating/logicle transform and normalizing) expression of CCR7in this phenograph cluster   |
|CD28_SCALED_CENTROID        |Median scaled (after compensating/logicle transform and normalizing) expression of CD28in this phenograph cluster   |
|CD95_SCALED_CENTROID        |Median scaled (after compensating/logicle transform and normalizing) expression of CD95in this phenograph cluster   |
|CD45RA_SCALED_CENTROID      |Median scaled (after compensating/logicle transform and normalizing) expression of CD45RAin this phenograph cluster |
|CD4_SCALED_CENTROID         |Median scaled (after compensating/logicle transform and normalizing) expression of CD4in this phenograph cluster    |
|SAMPLE_SCALED_CENTROID      |Sample used for centroids (just a check)                                                                            |
|SANITIZE_NAME               |Sample with spaces replaced with _                                                                                  |
|TOTAL_COUNTS                |Total events in fcs file                                                                                            |
|PANEL                       |flow panel                                                                                                          |
|MACHINE                     |LSR or FORTESSA                                                                                                     |
|EXPERIMENTER                |EXPERIMENTER                                                                                                        |
|CTL                         |Which control this sample is                                                                                        |
|META_CLUSTER                |The phenograph meta-cluster this sample belongs to                                                                  |
|metaTsne1                   |Meta-tsne diminsion 1                                                                                               |
|metaTsne2                   |Meta-tsne diminsion 2                                                                                               |

