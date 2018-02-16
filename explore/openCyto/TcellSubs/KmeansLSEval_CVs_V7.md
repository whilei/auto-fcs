# K-means Evaluation - control comparisons and manual 1st 1K correlations  
JL  
2/16/2018  

# K-Means notes
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
|F       |    27|
|G       |    28|
|H       |    30|


|    |KEYFCS                                                             |SAMPLE                                         |POPULATION          | COUNT| PARENT_COUNT|OPTIMAL_K |DFK_ALL                                                                                    | NUM_POPS_ASSIGNED| TOTAL_COUNTS|QC    |PANEL  |MACHINE |LAB_ID |formatName                                     |DATE       |DATE_MONTH |DATE_WEEK  |formatExp                                      |EXPERIMENTER | PARENT_FREQ| PARENT_PERCENT|KEY                    |CTL |Study.ID                                       |variable            | value|
|:---|:------------------------------------------------------------------|:----------------------------------------------|:-------------------|-----:|------------:|:---------|:------------------------------------------------------------------------------------------|-----------------:|------------:|:-----|:------|:-------|:------|:----------------------------------------------|:----------|:----------|:----------|:----------------------------------------------|:------------|-----------:|--------------:|:----------------------|:---|:----------------------------------------------|:-------------------|-----:|
|121 |2016-05-17_PANEL 1_DHS_panel one_Ctl-D_016.fcs_CYTO_central memory |2016-05-17_PANEL 1_DHS_panel one_Ctl-D_016.fcs |CYTO_central memory | 14145|        77632|3         |1,0.832408640742792,0.738543623520837,0.93952748979841,1.03783470428523,0.963218817742073  |                 4|       592897|FALSE |panel1 |LSR     |NA     |2016-05-17_PANEL 1_DHS_panel one_Ctl-D_016.fcs |2016-05-17 |2016-05-01 |2016-05-16 |2016-05-17_PANEL 1_DHS_panel one_Ctl-D_016.fcs |DHS          |   0.1822058|       18.22058|NA_CYTO_central memory |D   |2016-05-17_PANEL 1_DHS_panel one_Ctl-D_016.fcs |CYTO_central memory |  3679|
|211 |2016-05-25_PANEL 1_ZF_panel one_Ctl-D_011.fcs_CYTO_central memory  |2016-05-25_PANEL 1_ZF_panel one_Ctl-D_011.fcs  |CYTO_central memory | 10249|        61254|3         |1,0.892101597249016,0.654241194410193,0.954480334434967,1.00710806266813,0.992861258109737 |                 4|       486931|FALSE |panel1 |LSR     |NA     |2016-05-25_PANEL 1_ZF_panel one_Ctl-D_011.fcs  |2016-05-25 |2016-05-01 |2016-05-23 |2016-05-25_PANEL 1_ZF_panel one_Ctl-D_011.fcs  |ZF           |   0.1673197|       16.73197|NA_CYTO_central memory |D   |2016-05-25_PANEL 1_ZF_panel one_Ctl-D_011.fcs  |CYTO_central memory |  1754|
|286 |2016-06-06_PANEL 1_DHS_Group two_Ctl-D_033.fcs_CYTO_central memory |2016-06-06_PANEL 1_DHS_Group two_Ctl-D_033.fcs |CYTO_central memory | 15047|        71831|3         |1,0.935366407885674,0.695950006331655,0.959086114450938,1.0199350965884,1.00919291748581   |                 4|       672423|FALSE |panel1 |LSR     |NA     |2016-06-06_PANEL 1_DHS_Group two_Ctl-D_033.fcs |2016-06-06 |2016-06-01 |2016-06-06 |2016-06-06_PANEL 1_DHS_Group two_Ctl-D_033.fcs |DHS          |   0.2094778|       20.94778|NA_CYTO_central memory |D   |2016-06-06_PANEL 1_DHS_Group two_Ctl-D_033.fcs |CYTO_central memory |  1258|
|511 |2016-07-18_PANEL 1_DHS_Group two_Ctl-D_033.fcs_CYTO_central memory |2016-07-18_PANEL 1_DHS_Group two_Ctl-D_033.fcs |CYTO_central memory |  9335|        49458|3         |1,0.853732498839986,0.745609378709498,0.957623877881171,1.03205307917842,1.02001671277786  |                 4|       432309|FALSE |panel1 |LSR     |NA     |2016-07-18_PANEL 1_DHS_Group two_Ctl-D_033.fcs |2016-07-18 |2016-07-01 |2016-07-18 |2016-07-18_PANEL 1_DHS_Group two_Ctl-D_033.fcs |DHS          |   0.1887460|       18.87460|NA_CYTO_central memory |D   |2016-07-18_PANEL 1_DHS_Group two_Ctl-D_033.fcs |CYTO_central memory |  3377|

![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-1.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-2.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-3.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-4.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-5.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-6.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-7.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-8.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-9.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-10.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-11.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-12.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-13.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-14.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-4-15.png)<!-- -->


# Correlations to manual 1st 1k


![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-1.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-2.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-3.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-4.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-5.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-6.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-7.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-8.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-9.png)<!-- -->![](KmeansLSEval_CVs_V7_files/figure-html/unnamed-chunk-5-10.png)<!-- -->

