# K-means Evaluation - manual correlations and control comparisons 
JL  
2/16/2018  

#K-Means notes
- K-means is currently trying to identify 4 clusters using 3 dimensions (CCR7, CD45R4, and CD28)
- The input to k-means is currently the union of Helper and Cytotoxic T cells
  - For current results below, only OpenCyto was used to determine input for kmeans clustering (i.e did not start with Helper/Cyto T defined by manual .wsps)


# Control gating "consistency"

- OC controls were filtered for likely failures (lose ~%10 of the samples with this filter)








Control summary for results


|CONTROL | N_FCS|
|:-------|-----:|
|A       |    39|
|B       |    17|
|C       |    37|
|D       |    30|
|E       |    36|
|F       |    26|
|G       |    28|
|H       |    29|

![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-1.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-2.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-3.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-4.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-5.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-6.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-7.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-4-8.png)<!-- -->


# Comparison to manual 1st 1k


![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-1.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-2.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-3.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-4.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-5.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-6.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-7.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-8.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-9.png)<!-- -->![](KmeansLSEval_CVs_V6_files/figure-html/unnamed-chunk-5-10.png)<!-- -->

