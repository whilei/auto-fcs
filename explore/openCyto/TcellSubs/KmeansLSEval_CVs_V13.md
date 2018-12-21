---
title: "K-means Evaluation - control comparisons and manual 1st 1K correlations  "
author: "JL"
date: "2/16/2018"
output: 
  html_document: 
    keep_md: yes
---

# K-Means notes
- K-means is currently trying to identify 4 clusters using 3 dimensions (CCR7, CD45R4, and CD28)
- The input to k-means is currently the union of Helper and Cytotoxic T cells
  - For current results below, only OpenCyto was used to determine input for kmeans clustering (i.e did not start with Helper/Cyto T defined by manual .wsps)


# Control gating "consistency"

- OC controls were filtered for likely failures (lose ~%10 of the samples with this filter)







![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

Control summary for results


|CONTROL | N_FCS|
|:-------|-----:|
|A       |    10|
|B       |     6|
|C       |     9|
|D       |     7|
|E       |    31|
|F       |    18|
|G       |    20|
|H       |    24|


|KEYFCS |SAMPLE |POPULATION | COUNT| PARENT_COUNT|OPTIMAL_K |DFK_ALL | NUM_POPS_ASSIGNED| TOTAL_COUNTS|QC |PANEL |MACHINE |LAB_ID |formatName |DATE |DATE_MONTH |DATE_WEEK |formatExp |EXPERIMENTER |SANITIZE_NAME |MANUAL_ANNOTATION | PARENT_FREQ| PARENT_PERCENT|KEY |CTL |Study.ID |variable | value|
|:------|:------|:----------|-----:|------------:|:---------|:-------|-----------------:|------------:|:--|:-----|:-------|:------|:----------|:----|:----------|:---------|:---------|:------------|:-------------|:-----------------|-----------:|--------------:|:---|:---|:--------|:--------|-----:|

![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-1.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-2.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-3.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-4.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-5.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-6.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-7.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-8.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-9.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-10.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-11.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-12.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-13.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-14.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-4-15.png)<!-- -->


# Correlations to manual 1st 1k


![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-1.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-2.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-3.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-4.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-5.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-6.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-7.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-8.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-9.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-10.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-11.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-12.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-13.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-14.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-15.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-16.png)<!-- -->![](KmeansLSEval_CVs_V13_files/figure-html/unnamed-chunk-5-17.png)<!-- -->

```
## [1] "/Volumes/Beta/data/flow/kmeansValidateResults/results_r26_TcellSubs_Kmeans_wsp_v8/summmary.cor.results_r26_TcellSubs_Kmeans_wsp_v8.txt"
```

