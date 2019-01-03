---
title: "Example"
author: "JL"
date: "1/3/2019"
output: 
  html_document: 
    keep_md: yes
---
<!-- # Summary -->

<!-- Agnostic overview of panel 1 populations starting from live, single, lymphocytes as defined by OpenCyto. -->



### USAGE

Select a few (less than 10) meta-clusters to characterize before moving beyond the "Tsne Plots" and "Meta-cluster Counts" tabs


### Current Methods


1. Run phenograph on each individual sample, starting with OpenCyto gate of interest (currently live,single lymph)
  - Results displayed here are from samples run on LSR only
2. For each sample's phenograph cluster compute:
   1.  median compensated/transformed expression across all markers used (calling this "RAW")
   2.  median of the normalized (mean 0, SD 1) compensated/transformed expression across all markers use
   3. Frequency of known subsets in the cluster (T cells,B cells, etc) defined by OpenCyto (or kmeans)
   4. Proportion of events in the phenograph cluster out of all events in each known subset
   5. MEM score of events in phenograph cluster, relative to live single lymph. Using method "a" from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf
3. Combine individual sample's centroids into a single matrix
4. Run phenograph on the combined matrix (currently using "RAW")
5. Run tsne on the combined matrix (currently using "RAW")
7. Compute CV of each meta cluster within control samples
8. Compute meta-MEM score of each meta cluster (median mem score of component phenograph clusters)
  9. Assign MEM labels to each meta-cluster
6. Plot results, coloring by things



<!-- ### Notes (actual cluster number may change) -->

<!-- Meta cluster 14 : CD4/CD8 double positive? -->
<!-- - [CD4+/CD8+ double-positive T cells: more than just a developmental stage?](https://www.ncbi.nlm.nih.gov/pubmed/25360000) -->


<!-- ## Example workflow -->

<!-- 1. Select "Tsne Plots" -->
<!-- 1. Color middle tsne plot by "naive_ClusterFreq" using the "Middle Plot Color" dropdown to see which meta clusters are naive cells -->
<!-- 2. Check out which meta-clusters seem to be made up of mostly naive cells -->
<!-- 3. Select a few naive meta clusters (such as 5, 6, 10, 12, 15, 18, 26, 31, 32, and 34) in the "Meta clusters to characterize" dropdown -->
<!-- 4. Select "Raw Marker Heatmap" to see which markers differentiate these meta-clusters -->
<!--   - Seems to be IgD, CD95, CD19, maybe CD4 -->
<!-- 5. Similar process for "Normalized Heatmap" -->
<!-- 6. Select "Marker Distributions" -->
<!--   - Select IgD, CD95, CD19, and CD4 in the "Markers" dropdown -->
<!--   - Resonably separated distributions -->
<!-- 7. Go back to "Tsne Plots" and color a plot by IgD  -->

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



### Data column descriptions

- just for reference


|COLUMN                                                                   |DESCRIPTION                                                                                                                                                |
|:------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------|
|META_CLUSTER                                                             |The phenograph meta-cluster this sample belongs to                                                                                                         |
|SAMPLE                                                                   |Sample name                                                                                                                                                |
|PHENOGRAPH_CLUSTER                                                       |Phenograph cluster for the sample                                                                                                                          |
|CD4.kmeans.central.memory                                                |NA                                                                                                                                                         |
|CD4.kmeans.effector                                                      |NA                                                                                                                                                         |
|CD4.kmeans.effector.memory                                               |NA                                                                                                                                                         |
|CD4.kmeans.naive                                                         |NA                                                                                                                                                         |
|CD8.kmeans.central.memory                                                |NA                                                                                                                                                         |
|CD8.kmeans.effector                                                      |NA                                                                                                                                                         |
|CD8.kmeans.effector.memory                                               |NA                                                                                                                                                         |
|CD8.kmeans.naive                                                         |NA                                                                                                                                                         |
|CD8.kmeans.CD28P_27M                                                     |NA                                                                                                                                                         |
|CD8.kmeans.E                                                             |NA                                                                                                                                                         |
|CD8.kmeans.EM1                                                           |NA                                                                                                                                                         |
|CD8.kmeans.EM2                                                           |NA                                                                                                                                                         |
|CD8.kmeans.EM3                                                           |NA                                                                                                                                                         |
|CD8.kmeans.EM4                                                           |NA                                                                                                                                                         |
|CD8.kmeans.pE1                                                           |NA                                                                                                                                                         |
|CD8.kmeans.pE2                                                           |NA                                                                                                                                                         |
|TOTAL_PHENOGRAPH_COUNTS                                                  |Total events in sample's phenograph cluster                                                                                                                |
|OPEN_CYTO_Lymphocytes..SSC.A.v.FSC.A.                                    |NA                                                                                                                                                         |
|OPEN_CYTO_Single.Cells..FSC.H.v.FSC.W.                                   |NA                                                                                                                                                         |
|OPEN_CYTO_Live.cells..PE..                                               |NA                                                                                                                                                         |
|OPEN_CYTO_Tcells..CD3..CD19..                                            |NA                                                                                                                                                         |
|OPEN_CYTO_Helper.Tcells.CD4.                                             |NA                                                                                                                                                         |
|OPEN_CYTO_cytotoxic.Tcells.CD8.                                          |NA                                                                                                                                                         |
|OPEN_CYTO_activated.helper.Tcells..CD4..HLA.DR..                         |NA                                                                                                                                                         |
|OPEN_CYTO_B.cells..CD3..CD19..                                           |NA                                                                                                                                                         |
|OPEN_CYTO_naive.Bcells..CD27..IgD..                                      |NA                                                                                                                                                         |
|OPEN_CYTO_IgD..memory.Bcells..CD27..                                     |NA                                                                                                                                                         |
|OPEN_CYTO_IgD..memory.Bcells..CD27...1                                   |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.helper.Tcells..CCR7..CD45RA..                   |NA                                                                                                                                                         |
|OPEN_CYTO_effector.helper.Tcells..CCR7..CD45RA..                         |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.helper.Tcells..CCR7..CD45RA..                  |NA                                                                                                                                                         |
|OPEN_CYTO_naive.helper.Tcells..CCR7..CD45RA..                            |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.cytotoxic.Tcells..CCR7....CD45RA..              |NA                                                                                                                                                         |
|OPEN_CYTO_effector.cytotoxic.Tcells...CCR7...CD45RA..                    |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.cytotoxic.Tcells..CCR7....CD45RA..             |NA                                                                                                                                                         |
|OPEN_CYTO_naive.cytotoxic.Tcells..CCR7....CD45RA..                       |NA                                                                                                                                                         |
|OPEN_CYTO_activated.cytotoxic.Tcells..CD8..HLA.DR..                      |NA                                                                                                                                                         |
|OPEN_CYTO_EM3.cytotoxic.Tcells..CD27...CD28..                            |NA                                                                                                                                                         |
|OPEN_CYTO_EM4.cytotoxic.Tcells..CD27...CD28..                            |NA                                                                                                                                                         |
|OPEN_CYTO_EM2.cytotoxic.Tcells..CD27...CD28..                            |NA                                                                                                                                                         |
|OPEN_CYTO_EM1.cytotoxic.Tcells..CD27...CD28..                            |NA                                                                                                                                                         |
|OPEN_CYTO_pE.cytotoxic.Tcells..CD27...CD28..                             |NA                                                                                                                                                         |
|OPEN_CYTO_pE2.cytotoxic.Tcells..CD27....CD28..                           |NA                                                                                                                                                         |
|OPEN_CYTO_pE1.cytotoxic.Tcells..CD27...CD28..                            |NA                                                                                                                                                         |
|OPEN_CYTO_naive.helper.Tcells..CD95..CD28..                              |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.helper.Tcells..CD95..CD28..                    |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.helper.Tcells..CD95..CD28..                     |NA                                                                                                                                                         |
|OPEN_CYTO_naive.cytotoxic.Tcells..CD95....CD28..                         |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.cytotoxic.Tcells..CD95....CD28..                |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.cytotoxic.Tcells..CD95....CD28..               |NA                                                                                                                                                         |
|OPEN_CYTO_pE.cytotoxic.Tcells..CD95.CD28..CD27...CD28..                  |NA                                                                                                                                                         |
|OPEN_CYTO_pE2.cytotoxic.Tcells..CD95.CD28..CD27....CD28..                |NA                                                                                                                                                         |
|OPEN_CYTO_pE1.cytotoxic.Tcells..CD95.CD28..CD27...CD28..                 |NA                                                                                                                                                         |
|CD4.kmeans.effector.memory_TotalFreq                                     |NA                                                                                                                                                         |
|CD4.kmeans.central.memory_TotalFreq                                      |NA                                                                                                                                                         |
|CD4.kmeans.naive_TotalFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.naive_TotalFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.effector_TotalFreq                                            |NA                                                                                                                                                         |
|CD8.kmeans.central.memory_TotalFreq                                      |NA                                                                                                                                                         |
|CD4.kmeans.effector_TotalFreq                                            |NA                                                                                                                                                         |
|CD8.kmeans.effector.memory_TotalFreq                                     |NA                                                                                                                                                         |
|CD8.kmeans.E_TotalFreq                                                   |NA                                                                                                                                                         |
|CD8.kmeans.EM1_TotalFreq                                                 |NA                                                                                                                                                         |
|CD8.kmeans.pE2_TotalFreq                                                 |NA                                                                                                                                                         |
|CD8.kmeans.EM2_TotalFreq                                                 |NA                                                                                                                                                         |
|CD8.kmeans.EM4_TotalFreq                                                 |NA                                                                                                                                                         |
|CD8.kmeans.EM3_TotalFreq                                                 |NA                                                                                                                                                         |
|CD8.kmeans.CD28P_27M_TotalFreq                                           |NA                                                                                                                                                         |
|CD8.kmeans.pE1_TotalFreq                                                 |NA                                                                                                                                                         |
|OPEN_CYTO_Lymphocytes..SSC.A.v.FSC.A._TotalFreq                          |NA                                                                                                                                                         |
|OPEN_CYTO_Single.Cells..FSC.H.v.FSC.W._TotalFreq                         |NA                                                                                                                                                         |
|OPEN_CYTO_Live.cells..PE.._TotalFreq                                     |NA                                                                                                                                                         |
|OPEN_CYTO_Tcells..CD3..CD19.._TotalFreq                                  |NA                                                                                                                                                         |
|OPEN_CYTO_Helper.Tcells.CD4._TotalFreq                                   |NA                                                                                                                                                         |
|OPEN_CYTO_cytotoxic.Tcells.CD8._TotalFreq                                |NA                                                                                                                                                         |
|OPEN_CYTO_activated.helper.Tcells..CD4..HLA.DR.._TotalFreq               |NA                                                                                                                                                         |
|OPEN_CYTO_B.cells..CD3..CD19.._TotalFreq                                 |NA                                                                                                                                                         |
|OPEN_CYTO_naive.Bcells..CD27..IgD.._TotalFreq                            |NA                                                                                                                                                         |
|OPEN_CYTO_IgD..memory.Bcells..CD27.._TotalFreq                           |NA                                                                                                                                                         |
|OPEN_CYTO_IgD..memory.Bcells..CD27.._TotalFreq.1                         |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.helper.Tcells..CCR7..CD45RA.._TotalFreq         |NA                                                                                                                                                         |
|OPEN_CYTO_effector.helper.Tcells..CCR7..CD45RA.._TotalFreq               |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.helper.Tcells..CCR7..CD45RA.._TotalFreq        |NA                                                                                                                                                         |
|OPEN_CYTO_naive.helper.Tcells..CCR7..CD45RA.._TotalFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.cytotoxic.Tcells..CCR7....CD45RA.._TotalFreq    |NA                                                                                                                                                         |
|OPEN_CYTO_effector.cytotoxic.Tcells...CCR7...CD45RA.._TotalFreq          |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.cytotoxic.Tcells..CCR7....CD45RA.._TotalFreq   |NA                                                                                                                                                         |
|OPEN_CYTO_naive.cytotoxic.Tcells..CCR7....CD45RA.._TotalFreq             |NA                                                                                                                                                         |
|OPEN_CYTO_activated.cytotoxic.Tcells..CD8..HLA.DR.._TotalFreq            |NA                                                                                                                                                         |
|OPEN_CYTO_EM3.cytotoxic.Tcells..CD27...CD28.._TotalFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_EM4.cytotoxic.Tcells..CD27...CD28.._TotalFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_EM2.cytotoxic.Tcells..CD27...CD28.._TotalFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_EM1.cytotoxic.Tcells..CD27...CD28.._TotalFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_pE.cytotoxic.Tcells..CD27...CD28.._TotalFreq                   |NA                                                                                                                                                         |
|OPEN_CYTO_pE2.cytotoxic.Tcells..CD27....CD28.._TotalFreq                 |NA                                                                                                                                                         |
|OPEN_CYTO_pE1.cytotoxic.Tcells..CD27...CD28.._TotalFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_naive.helper.Tcells..CD95..CD28.._TotalFreq                    |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.helper.Tcells..CD95..CD28.._TotalFreq          |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.helper.Tcells..CD95..CD28.._TotalFreq           |NA                                                                                                                                                         |
|OPEN_CYTO_naive.cytotoxic.Tcells..CD95....CD28.._TotalFreq               |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.cytotoxic.Tcells..CD95....CD28.._TotalFreq      |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.cytotoxic.Tcells..CD95....CD28.._TotalFreq     |NA                                                                                                                                                         |
|OPEN_CYTO_pE.cytotoxic.Tcells..CD95.CD28..CD27...CD28.._TotalFreq        |NA                                                                                                                                                         |
|OPEN_CYTO_pE2.cytotoxic.Tcells..CD95.CD28..CD27....CD28.._TotalFreq      |NA                                                                                                                                                         |
|OPEN_CYTO_pE1.cytotoxic.Tcells..CD95.CD28..CD27...CD28.._TotalFreq       |NA                                                                                                                                                         |
|CD4.kmeans.effector.memory_ClusterFreq                                   |NA                                                                                                                                                         |
|CD4.kmeans.central.memory_ClusterFreq                                    |NA                                                                                                                                                         |
|CD4.kmeans.naive_ClusterFreq                                             |NA                                                                                                                                                         |
|CD8.kmeans.naive_ClusterFreq                                             |NA                                                                                                                                                         |
|CD8.kmeans.effector_ClusterFreq                                          |NA                                                                                                                                                         |
|CD8.kmeans.central.memory_ClusterFreq                                    |NA                                                                                                                                                         |
|CD4.kmeans.effector_ClusterFreq                                          |NA                                                                                                                                                         |
|CD8.kmeans.effector.memory_ClusterFreq                                   |NA                                                                                                                                                         |
|CD8.kmeans.E_ClusterFreq                                                 |NA                                                                                                                                                         |
|CD8.kmeans.EM1_ClusterFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.pE2_ClusterFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.EM2_ClusterFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.EM4_ClusterFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.EM3_ClusterFreq                                               |NA                                                                                                                                                         |
|CD8.kmeans.CD28P_27M_ClusterFreq                                         |NA                                                                                                                                                         |
|CD8.kmeans.pE1_ClusterFreq                                               |NA                                                                                                                                                         |
|OPEN_CYTO_Lymphocytes..SSC.A.v.FSC.A._ClusterFreq                        |NA                                                                                                                                                         |
|OPEN_CYTO_Single.Cells..FSC.H.v.FSC.W._ClusterFreq                       |NA                                                                                                                                                         |
|OPEN_CYTO_Live.cells..PE.._ClusterFreq                                   |NA                                                                                                                                                         |
|OPEN_CYTO_Tcells..CD3..CD19.._ClusterFreq                                |NA                                                                                                                                                         |
|OPEN_CYTO_Helper.Tcells.CD4._ClusterFreq                                 |NA                                                                                                                                                         |
|OPEN_CYTO_cytotoxic.Tcells.CD8._ClusterFreq                              |NA                                                                                                                                                         |
|OPEN_CYTO_activated.helper.Tcells..CD4..HLA.DR.._ClusterFreq             |NA                                                                                                                                                         |
|OPEN_CYTO_B.cells..CD3..CD19.._ClusterFreq                               |NA                                                                                                                                                         |
|OPEN_CYTO_naive.Bcells..CD27..IgD.._ClusterFreq                          |NA                                                                                                                                                         |
|OPEN_CYTO_IgD..memory.Bcells..CD27.._ClusterFreq                         |NA                                                                                                                                                         |
|OPEN_CYTO_IgD..memory.Bcells..CD27.._ClusterFreq.1                       |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.helper.Tcells..CCR7..CD45RA.._ClusterFreq       |NA                                                                                                                                                         |
|OPEN_CYTO_effector.helper.Tcells..CCR7..CD45RA.._ClusterFreq             |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.helper.Tcells..CCR7..CD45RA.._ClusterFreq      |NA                                                                                                                                                         |
|OPEN_CYTO_naive.helper.Tcells..CCR7..CD45RA.._ClusterFreq                |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.cytotoxic.Tcells..CCR7....CD45RA.._ClusterFreq  |NA                                                                                                                                                         |
|OPEN_CYTO_effector.cytotoxic.Tcells...CCR7...CD45RA.._ClusterFreq        |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.cytotoxic.Tcells..CCR7....CD45RA.._ClusterFreq |NA                                                                                                                                                         |
|OPEN_CYTO_naive.cytotoxic.Tcells..CCR7....CD45RA.._ClusterFreq           |NA                                                                                                                                                         |
|OPEN_CYTO_activated.cytotoxic.Tcells..CD8..HLA.DR.._ClusterFreq          |NA                                                                                                                                                         |
|OPEN_CYTO_EM3.cytotoxic.Tcells..CD27...CD28.._ClusterFreq                |NA                                                                                                                                                         |
|OPEN_CYTO_EM4.cytotoxic.Tcells..CD27...CD28.._ClusterFreq                |NA                                                                                                                                                         |
|OPEN_CYTO_EM2.cytotoxic.Tcells..CD27...CD28.._ClusterFreq                |NA                                                                                                                                                         |
|OPEN_CYTO_EM1.cytotoxic.Tcells..CD27...CD28.._ClusterFreq                |NA                                                                                                                                                         |
|OPEN_CYTO_pE.cytotoxic.Tcells..CD27...CD28.._ClusterFreq                 |NA                                                                                                                                                         |
|OPEN_CYTO_pE2.cytotoxic.Tcells..CD27....CD28.._ClusterFreq               |NA                                                                                                                                                         |
|OPEN_CYTO_pE1.cytotoxic.Tcells..CD27...CD28.._ClusterFreq                |NA                                                                                                                                                         |
|OPEN_CYTO_naive.helper.Tcells..CD95..CD28.._ClusterFreq                  |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.helper.Tcells..CD95..CD28.._ClusterFreq        |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.helper.Tcells..CD95..CD28.._ClusterFreq         |NA                                                                                                                                                         |
|OPEN_CYTO_naive.cytotoxic.Tcells..CD95....CD28.._ClusterFreq             |NA                                                                                                                                                         |
|OPEN_CYTO_central.memory.cytotoxic.Tcells..CD95....CD28.._ClusterFreq    |NA                                                                                                                                                         |
|OPEN_CYTO_effector.memory.cytotoxic.Tcells..CD95....CD28.._ClusterFreq   |NA                                                                                                                                                         |
|OPEN_CYTO_pE.cytotoxic.Tcells..CD95.CD28..CD27...CD28.._ClusterFreq      |NA                                                                                                                                                         |
|OPEN_CYTO_pE2.cytotoxic.Tcells..CD95.CD28..CD27....CD28.._ClusterFreq    |NA                                                                                                                                                         |
|OPEN_CYTO_pE1.cytotoxic.Tcells..CD95.CD28..CD27...CD28.._ClusterFreq     |NA                                                                                                                                                         |
|CD27_RAW_CENTROID                                                        |Median raw (but after compensating/logicle transform) expression of CD27in this phenograph cluster                                                         |
|HLA.DR_RAW_CENTROID                                                      |Median raw (but after compensating/logicle transform) expression of HLA.DRin this phenograph cluster                                                       |
|CD19_RAW_CENTROID                                                        |Median raw (but after compensating/logicle transform) expression of CD19in this phenograph cluster                                                         |
|CD8_RAW_CENTROID                                                         |Median raw (but after compensating/logicle transform) expression of CD8in this phenograph cluster                                                          |
|IgD_RAW_CENTROID                                                         |Median raw (but after compensating/logicle transform) expression of IgDin this phenograph cluster                                                          |
|CD3_RAW_CENTROID                                                         |Median raw (but after compensating/logicle transform) expression of CD3in this phenograph cluster                                                          |
|CCR7_RAW_CENTROID                                                        |Median raw (but after compensating/logicle transform) expression of CCR7in this phenograph cluster                                                         |
|CD28_RAW_CENTROID                                                        |Median raw (but after compensating/logicle transform) expression of CD28in this phenograph cluster                                                         |
|CD95_RAW_CENTROID                                                        |Median raw (but after compensating/logicle transform) expression of CD95in this phenograph cluster                                                         |
|CD45RA_RAW_CENTROID                                                      |Median raw (but after compensating/logicle transform) expression of CD45RAin this phenograph cluster                                                       |
|CD4_RAW_CENTROID                                                         |Median raw (but after compensating/logicle transform) expression of CD4in this phenograph cluster                                                          |
|SAMPLE_RAW_CENTROID                                                      |Sample used for centroids (just a check)                                                                                                                   |
|CD27_SCALED_CENTROID                                                     |Median scaled (after compensating/logicle transform and normalizing) expression of CD27in this phenograph cluster                                          |
|HLA.DR_SCALED_CENTROID                                                   |Median scaled (after compensating/logicle transform and normalizing) expression of HLA.DRin this phenograph cluster                                        |
|CD19_SCALED_CENTROID                                                     |Median scaled (after compensating/logicle transform and normalizing) expression of CD19in this phenograph cluster                                          |
|CD8_SCALED_CENTROID                                                      |Median scaled (after compensating/logicle transform and normalizing) expression of CD8in this phenograph cluster                                           |
|IgD_SCALED_CENTROID                                                      |Median scaled (after compensating/logicle transform and normalizing) expression of IgDin this phenograph cluster                                           |
|CD3_SCALED_CENTROID                                                      |Median scaled (after compensating/logicle transform and normalizing) expression of CD3in this phenograph cluster                                           |
|CCR7_SCALED_CENTROID                                                     |Median scaled (after compensating/logicle transform and normalizing) expression of CCR7in this phenograph cluster                                          |
|CD28_SCALED_CENTROID                                                     |Median scaled (after compensating/logicle transform and normalizing) expression of CD28in this phenograph cluster                                          |
|CD95_SCALED_CENTROID                                                     |Median scaled (after compensating/logicle transform and normalizing) expression of CD95in this phenograph cluster                                          |
|CD45RA_SCALED_CENTROID                                                   |Median scaled (after compensating/logicle transform and normalizing) expression of CD45RAin this phenograph cluster                                        |
|CD4_SCALED_CENTROID                                                      |Median scaled (after compensating/logicle transform and normalizing) expression of CD4in this phenograph cluster                                           |
|SAMPLE_SCALED_CENTROID                                                   |Sample used for centroids (just a check)                                                                                                                   |
|MEM_CD27_BASE                                                            |NA                                                                                                                                                         |
|MEM_CD27_BASE_MINUS_CLUST                                                |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD27in this phenograph cluster   |
|MEM_HLA.DR_BASE                                                          |NA                                                                                                                                                         |
|MEM_HLA.DR_BASE_MINUS_CLUST                                              |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf HLA.DRin this phenograph cluster |
|MEM_CD19_BASE                                                            |NA                                                                                                                                                         |
|MEM_CD19_BASE_MINUS_CLUST                                                |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD19in this phenograph cluster   |
|MEM_CD8_BASE                                                             |NA                                                                                                                                                         |
|MEM_CD8_BASE_MINUS_CLUST                                                 |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD8in this phenograph cluster    |
|MEM_IgD_BASE                                                             |NA                                                                                                                                                         |
|MEM_IgD_BASE_MINUS_CLUST                                                 |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf IgDin this phenograph cluster    |
|MEM_CD3_BASE                                                             |NA                                                                                                                                                         |
|MEM_CD3_BASE_MINUS_CLUST                                                 |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD3in this phenograph cluster    |
|MEM_CCR7_BASE                                                            |NA                                                                                                                                                         |
|MEM_CCR7_BASE_MINUS_CLUST                                                |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CCR7in this phenograph cluster   |
|MEM_CD28_BASE                                                            |NA                                                                                                                                                         |
|MEM_CD28_BASE_MINUS_CLUST                                                |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD28in this phenograph cluster   |
|MEM_CD95_BASE                                                            |NA                                                                                                                                                         |
|MEM_CD95_BASE_MINUS_CLUST                                                |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD95in this phenograph cluster   |
|MEM_CD45RA_BASE                                                          |NA                                                                                                                                                         |
|MEM_CD45RA_BASE_MINUS_CLUST                                              |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD45RAin this phenograph cluster |
|MEM_CD4_BASE                                                             |NA                                                                                                                                                         |
|MEM_CD4_BASE_MINUS_CLUST                                                 |mem score using method a of https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf CD4in this phenograph cluster    |
|MEM_RAW_CD27_BASE                                                        |NA                                                                                                                                                         |
|MEM_RAW_CD27_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|MEM_RAW_HLA.DR_BASE                                                      |NA                                                                                                                                                         |
|MEM_RAW_HLA.DR_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_RAW_CD19_BASE                                                        |NA                                                                                                                                                         |
|MEM_RAW_CD19_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|MEM_RAW_CD8_BASE                                                         |NA                                                                                                                                                         |
|MEM_RAW_CD8_BASE_MINUS_CLUST                                             |NA                                                                                                                                                         |
|MEM_RAW_IgD_BASE                                                         |NA                                                                                                                                                         |
|MEM_RAW_IgD_BASE_MINUS_CLUST                                             |NA                                                                                                                                                         |
|MEM_RAW_CD3_BASE                                                         |NA                                                                                                                                                         |
|MEM_RAW_CD3_BASE_MINUS_CLUST                                             |NA                                                                                                                                                         |
|MEM_RAW_CCR7_BASE                                                        |NA                                                                                                                                                         |
|MEM_RAW_CCR7_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|MEM_RAW_CD28_BASE                                                        |NA                                                                                                                                                         |
|MEM_RAW_CD28_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|MEM_RAW_CD95_BASE                                                        |NA                                                                                                                                                         |
|MEM_RAW_CD95_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|MEM_RAW_CD45RA_BASE                                                      |NA                                                                                                                                                         |
|MEM_RAW_CD45RA_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_RAW_CD4_BASE                                                         |NA                                                                                                                                                         |
|MEM_RAW_CD4_BASE_MINUS_CLUST                                             |NA                                                                                                                                                         |
|MEM_LABEL_CD27_BASE                                                      |NA                                                                                                                                                         |
|MEM_LABEL_CD27_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_LABEL_HLA.DR_BASE                                                    |NA                                                                                                                                                         |
|MEM_LABEL_HLA.DR_BASE_MINUS_CLUST                                        |NA                                                                                                                                                         |
|MEM_LABEL_CD19_BASE                                                      |NA                                                                                                                                                         |
|MEM_LABEL_CD19_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_LABEL_CD8_BASE                                                       |NA                                                                                                                                                         |
|MEM_LABEL_CD8_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|MEM_LABEL_IgD_BASE                                                       |NA                                                                                                                                                         |
|MEM_LABEL_IgD_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|MEM_LABEL_CD3_BASE                                                       |NA                                                                                                                                                         |
|MEM_LABEL_CD3_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|MEM_LABEL_CCR7_BASE                                                      |NA                                                                                                                                                         |
|MEM_LABEL_CCR7_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_LABEL_CD28_BASE                                                      |NA                                                                                                                                                         |
|MEM_LABEL_CD28_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_LABEL_CD95_BASE                                                      |NA                                                                                                                                                         |
|MEM_LABEL_CD95_BASE_MINUS_CLUST                                          |NA                                                                                                                                                         |
|MEM_LABEL_CD45RA_BASE                                                    |NA                                                                                                                                                         |
|MEM_LABEL_CD45RA_BASE_MINUS_CLUST                                        |NA                                                                                                                                                         |
|MEM_LABEL_CD4_BASE                                                       |NA                                                                                                                                                         |
|MEM_LABEL_CD4_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|SANITIZE_NAME                                                            |Sample with spaces replaced with _                                                                                                                         |
|TOTAL_COUNTS                                                             |Total events in fcs file                                                                                                                                   |
|PANEL                                                                    |flow panel                                                                                                                                                 |
|MACHINE                                                                  |LSR or FORTESSA                                                                                                                                            |
|EXPERIMENTER                                                             |EXPERIMENTER                                                                                                                                               |
|LAB_ID                                                                   |LAB ID for this sample                                                                                                                                     |
|CTL                                                                      |Which control this sample is                                                                                                                               |
|metaTsne1                                                                |Meta-tsne diminsion 1                                                                                                                                      |
|metaTsne2                                                                |Meta-tsne diminsion 2                                                                                                                                      |
|META_MEM_CD27_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|META_MEM_HLA.DR_BASE_MINUS_CLUST                                         |NA                                                                                                                                                         |
|META_MEM_CD19_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|META_MEM_CD8_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|META_MEM_IgD_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|META_MEM_CD3_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|META_MEM_CCR7_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|META_MEM_CD28_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|META_MEM_CD95_BASE_MINUS_CLUST                                           |NA                                                                                                                                                         |
|META_MEM_CD45RA_BASE_MINUS_CLUST                                         |NA                                                                                                                                                         |
|META_MEM_CD4_BASE_MINUS_CLUST                                            |NA                                                                                                                                                         |
|META_MEM_LABEL1                                                          |NA                                                                                                                                                         |
|META_MAD_MEM_CD27_BASE_MINUS_CLUST                                       |NA                                                                                                                                                         |
|META_MAD_MEM_HLA.DR_BASE_MINUS_CLUST                                     |NA                                                                                                                                                         |
|META_MAD_MEM_CD19_BASE_MINUS_CLUST                                       |NA                                                                                                                                                         |
|META_MAD_MEM_CD8_BASE_MINUS_CLUST                                        |NA                                                                                                                                                         |
|META_MAD_MEM_IgD_BASE_MINUS_CLUST                                        |NA                                                                                                                                                         |
|META_MAD_MEM_CD3_BASE_MINUS_CLUST                                        |NA                                                                                                                                                         |
|META_MAD_MEM_CCR7_BASE_MINUS_CLUST                                       |NA                                                                                                                                                         |
|META_MAD_MEM_CD28_BASE_MINUS_CLUST                                       |NA                                                                                                                                                         |
|META_MAD_MEM_CD95_BASE_MINUS_CLUST                                       |NA                                                                                                                                                         |
|META_MAD_MEM_CD45RA_BASE_MINUS_CLUST                                     |NA                                                                                                                                                         |
|META_MAD_MEM_CD4_BASE_MINUS_CLUST                                        |NA                                                                                                                                                         |
|NA                                                                       |Count of central.memory events in this phenograph cluster                                                                                                  |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  central.memory                                                                       |
|NA                                                                       |Frequency of population central.memory in this phenograph cluster                                                                                          |
|NA                                                                       |Count of naive events in this phenograph cluster                                                                                                           |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  naive                                                                                |
|NA                                                                       |Frequency of population naive in this phenograph cluster                                                                                                   |
|NA                                                                       |Count of effector.memory events in this phenograph cluster                                                                                                 |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  effector.memory                                                                      |
|NA                                                                       |Frequency of population effector.memory in this phenograph cluster                                                                                         |
|NA                                                                       |Count of EM1 events in this phenograph cluster                                                                                                             |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  EM1                                                                                  |
|NA                                                                       |Frequency of population EM1 in this phenograph cluster                                                                                                     |
|NA                                                                       |Count of EM2 events in this phenograph cluster                                                                                                             |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  EM2                                                                                  |
|NA                                                                       |Frequency of population EM2 in this phenograph cluster                                                                                                     |
|NA                                                                       |Count of EM3 events in this phenograph cluster                                                                                                             |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  EM3                                                                                  |
|NA                                                                       |Frequency of population EM3 in this phenograph cluster                                                                                                     |
|NA                                                                       |Count of EM4 events in this phenograph cluster                                                                                                             |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  EM4                                                                                  |
|NA                                                                       |Frequency of population EM4 in this phenograph cluster                                                                                                     |
|NA                                                                       |Count of effector events in this phenograph cluster                                                                                                        |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  effector                                                                             |
|NA                                                                       |Frequency of population effector in this phenograph cluster                                                                                                |
|NA                                                                       |Count of E events in this phenograph cluster                                                                                                               |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  E                                                                                    |
|NA                                                                       |Frequency of population E in this phenograph cluster                                                                                                       |
|NA                                                                       |Count of pE1 events in this phenograph cluster                                                                                                             |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  pE1                                                                                  |
|NA                                                                       |Frequency of population pE1 in this phenograph cluster                                                                                                     |
|NA                                                                       |Count of pE2 events in this phenograph cluster                                                                                                             |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  pE2                                                                                  |
|NA                                                                       |Frequency of population pE2 in this phenograph cluster                                                                                                     |
|NA                                                                       |Count of CD28P_27M events in this phenograph cluster                                                                                                       |
|NA                                                                       |Proportion of events in this phenograph cluster out of all events in  CD28P_27M                                                                            |
|NA                                                                       |Frequency of population CD28P_27M in this phenograph cluster                                                                                               |



