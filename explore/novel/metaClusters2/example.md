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


|COLUMN                            |DESCRIPTION                                                                                                                                              |
|:---------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|
|META_CLUSTER                      |The phenograph meta-cluster this sample belongs to                                                                                                       |
|SAMPLE                            |Sample name                                                                                                                                              |
|PHENOGRAPH_CLUSTER                |Phenograph cluster for the sample                                                                                                                        |
|TOTAL_PHENOGRAPH_COUNTS           |Total events in sample's phenograph cluster                                                                                                              |
|SAMPLE_RAW_CENTROID               |Sample used for centroids (just a check)                                                                                                                 |
|SAMPLE_SCALED_CENTROID            |Sample used for centroids (just a check)                                                                                                                 |
|SANITIZE_NAME                     |Sample with spaces replaced with _                                                                                                                       |
|TOTAL_COUNTS                      |Total events in fcs file                                                                                                                                 |
|PANEL                             |flow panel                                                                                                                                               |
|MACHINE                           |LSR or FORTESSA                                                                                                                                          |
|EXPERIMENTER                      |EXPERIMENTER                                                                                                                                             |
|LAB_ID                            |LAB ID for this sample                                                                                                                                   |
|CTL                               |Which control this sample is                                                                                                                             |
|metaTsne1                         |Meta-tsne diminsion 1                                                                                                                                    |
|metaTsne2                         |Meta-tsne diminsion 2                                                                                                                                    |
|-population name-                 |Count of  events in this phenograph cluster                                                                                                              |
|*_TotalFreq                       |Proportion of events in this phenograph cluster out of all events in the population                                                                      |
|*_ClusterFreq                     |Frequency of population in this phenograph cluster                                                                                                       |
|*_RAW_CENTROID                    |Median raw (but after compensating/logicle transform) expression of marker                                                                               |
|marker in this phenograph cluster |                                                                                                                                                         |
|*_SCALED_CENTROID                 |Median scaled (after compensating/logicle transform and normalizing) expression of                                                                       |
|marker in this phenograph cluster |                                                                                                                                                         |
|*_SCALED_CENTROID                 |Median scaled (after compensating/logicle transform and normalizing) expression of                                                                       |
|marker in this phenograph cluster |                                                                                                                                                         |
|MEM_RAW*_BASE_MINUS_CLUST         |MEM score computed using method a from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf                     |
|MEM*_BASE_MINUS_CLUST             |MEM score computed using method a from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf                     |
|META_MEM*_BASE_MINUS_CLUST        |Meta cluster median MEM score computed using method a from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf |



