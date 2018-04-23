---
title: "checkP1counts"
author: "JL"
date: "3/28/2018"
output: 
  html_document: 
    keep_md: yes
---









![](p1ChecksV4_files/figure-html/unnamed-chunk-2-1.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-2.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-3.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-4.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-5.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-6.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-7.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-8.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-9.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-10.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-11.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-12.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-13.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-14.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-15.png)<!-- -->![](p1ChecksV4_files/figure-html/unnamed-chunk-2-16.png)<!-- -->


<!--     interest=c("central.memory.helper.Tcells..CCR7..CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "naive.helper.Tcells..CCR7..CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "effector.helper.Tcells..CCR7..CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "effector.memory.helper.Tcells..CCR7..CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "central.memory.cytotoxic.Tcells..CCR7....CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "naive.cytotoxic.Tcells..CCR7....CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "effector.cytotoxic.Tcells...CCR7...CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..", -->
<!-- "effector.memory.cytotoxic.Tcells..CCR7....CD45RA....Comp.BV421.A..CCR7..v.Comp.BV711.A..CD45RA..") -->

<!--     for(inter in interest){ -->
<!--       print(paste(inter," HELPER")) -->
<!--       print(table(counts[,inter]<counts$Helper.Tcells.CD4...Comp.APC.Cy7.A..CD4..v.Comp.BUV396.A..CD8..,counts$HAS_MANUAL_WSP)) -->
<!--     print(paste(inter," Cyto")) -->
<!--      print(table(counts[,inter]<counts$cytotoxic.Tcells.CD8...Comp.APC.Cy7.A..CD4..v.Comp.BUV396.A..CD8..,counts$HAS_MANUAL_WSP)) -->

<!--     } -->


```
## NULL
```

```
## [1] "Sample"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion
```

```
## Warning in max(na.omit(as.numeric(latest[, col]))): no non-missing
## arguments to max; returning -Inf
```

```
## [1] -Inf
## [1] "Invalid?"
## [1] 1
## [1] "Specimen?"
## [1] 0
## [1] "Control?"
## [1] 1
## [1] "TOTAL_COUNTS"
## [1] 9234774
## [1] "QC"
## [1] 0
## [1] "PANEL"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "MACHINE"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "LAB_ID"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "formatName"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "DATE"
## [1] 43024
## [1] "DATE_MONTH"
## [1] 43009
## [1] "DATE_WEEK"
## [1] 43024
## [1] "formatExp"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "EXPERIMENTER"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "HAS_MANUAL_WSP"
## [1] 0
## [1] "Source"
```

```
## Warning in na.omit(as.numeric(latest[, col])): NAs introduced by coercion

## Warning in na.omit(as.numeric(latest[, col])): no non-missing arguments to
## max; returning -Inf
```

```
## [1] -Inf
## [1] "B.cells.(CD3-.CD19+).(Comp-APC-A.(CD3).v.Comp-PE-Cy7-A.(CD19))"
## [1] 0.92907
## [1] "naive.Bcells.(CD27-.IgD+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))"
## [1] 0.9516251
## [1] "IgD+.memory.Bcells.(CD27+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))"
## [1] 0.6344188
## [1] "IgD-.memory.Bcells.(CD27+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))"
## [1] 0.6851866
## [1] "Tcells.(CD3+.CD19-).(Comp-APC-A.(CD3).v.Comp-PE-Cy7-A.(CD19))"
## [1] 0.9708432
## [1] "Helper.Tcells-CD4+.(Comp-APC-Cy7-A.(CD4).v.Comp-BUV396-A.(CD8))"
## [1] 0.9498374
## [1] "cytotoxic.Tcells-CD8+.(Comp-APC-Cy7-A.(CD4).v.Comp-BUV396-A.(CD8))"
## [1] 0.7657367
## [1] "activated.helper.Tcells.(CD4+.HLA-DR+).(Comp-PE-CF594-A.(HLA-DR))"
## [1] 0.1504242
## [1] "naive.helper.Tcells.(CD95-.CD28+).(Comp-BV605-A.(CD95).v.Comp-BV510-A.(CD28))"
## [1] 0.779616
## [1] "naive.helper.Tcells.(CCR7+.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.779616
## [1] "effector.helper.Tcells.(CCR7-.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.6507735
## [1] "central.memory.helper.Tcells.(CD95+.CD28+).(Comp-BV605-A.(CD95).v.Comp-BV510-A.(CD28))"
## [1] 0.8071591
## [1] "effector.memory.helper.Tcells.(CD95-.CD28-).(Comp-BV605-A.(CD95).v.Comp-BV510-A.(CD28))"
## [1] 0.5619122
## [1] "central.memory.helper.Tcells.(CCR7+.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.8071591
## [1] "effector.memory.helper.Tcells.(CCR7-.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.5619122
## [1] "activated.cytotoxic.Tcells.(CD8+.HLA-DR+).(Comp-PE-CF594-A.(HLA-DR))"
## [1] 0.05028463
## [1] "naive.cytotoxic.Tcells.(CD95-.,.CD28+).(Comp-BV605-A.(CD95).v.Comp-BV510-A.(CD28))"
## [1] 0.7769685
## [1] "naive.cytotoxic.Tcells.(CCR7+.,.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.7769685
## [1] "effector.cytotoxic.Tcells.(CCR7-.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.9229324
## [1] "central.memory.cytotoxic.Tcells.(CD95+.,.CD28+).(Comp-BV605-A.(CD95).v.Comp-BV510-A.(CD28))"
## [1] 0.4113265
## [1] "effector.memory.cytotoxic.Tcells.(CD95-.,.CD28-).(Comp-BV605-A.(CD95).v.Comp-BV510-A.(CD28))"
## [1] 0.6244616
## [1] "central.memory.cytotoxic.Tcells.(CCR7+.,.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.4113265
## [1] "effector.memory.cytotoxic.Tcells.(CCR7-.,.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [1] 0.6244616
```

```
## [1] "B.cells.(CD3-.CD19+).(Comp-APC-A.(CD3).v.Comp-PE-Cy7-A.(CD19))"
## [2] "Bcell"
```

![](p1ChecksV4_files/figure-html/sesstup-1.png)<!-- -->

```
## [1] "Tcells.(CD3+.CD19-).(Comp-APC-A.(CD3).v.Comp-PE-Cy7-A.(CD19))"
## [2] "Tcell"
```

![](p1ChecksV4_files/figure-html/sesstup-2.png)<!-- -->

```
## [1] "Helper.Tcells-CD4+.(Comp-APC-Cy7-A.(CD4).v.Comp-BUV396-A.(CD8))"
## [2] "HT"
```

![](p1ChecksV4_files/figure-html/sesstup-3.png)<!-- -->

```
## [1] "cytotoxic.Tcells-CD8+.(Comp-APC-Cy7-A.(CD4).v.Comp-BUV396-A.(CD8))"
## [2] "CT"
```

![](p1ChecksV4_files/figure-html/sesstup-4.png)<!-- -->

```
## [1] "IgD+.memory.Bcells.(CD27+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))"
## [2] "IgD+MemB"
```

![](p1ChecksV4_files/figure-html/sesstup-5.png)<!-- -->

```
## [1] "IgD-.memory.Bcells.(CD27+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))"
## [2] "IgD-MemB"
```

![](p1ChecksV4_files/figure-html/sesstup-6.png)<!-- -->

```
## [1] "naive.Bcells.(CD27-.IgD+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))"
## [2] "NaiveB"
```

![](p1ChecksV4_files/figure-html/sesstup-7.png)<!-- -->

```
## [1] "effector.helper.Tcells.(CCR7-.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "E.HT"
```

![](p1ChecksV4_files/figure-html/sesstup-8.png)<!-- -->

```
## [1] "effector.memory.helper.Tcells.(CCR7-.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "EM.HT"
```

![](p1ChecksV4_files/figure-html/sesstup-9.png)<!-- -->

```
## [1] "central.memory.helper.Tcells.(CCR7+.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "CM.HT"
```

![](p1ChecksV4_files/figure-html/sesstup-10.png)<!-- -->

```
## [1] "naive.helper.Tcells.(CCR7+.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "N.HT"
```

![](p1ChecksV4_files/figure-html/sesstup-11.png)<!-- -->

```
## [1] "effector.cytotoxic.Tcells.(CCR7-.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "E.CT"
```

![](p1ChecksV4_files/figure-html/sesstup-12.png)<!-- -->

```
## [1] "effector.memory.cytotoxic.Tcells.(CCR7-.,.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "EM.CT"
```

![](p1ChecksV4_files/figure-html/sesstup-13.png)<!-- -->

```
## [1] "central.memory.cytotoxic.Tcells.(CCR7+.,.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "CM.CT"
```

![](p1ChecksV4_files/figure-html/sesstup-14.png)<!-- -->

```
## [1] "naive.cytotoxic.Tcells.(CCR7+.,.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))"
## [2] "N.CT"
```

![](p1ChecksV4_files/figure-html/sesstup-15.png)<!-- -->

