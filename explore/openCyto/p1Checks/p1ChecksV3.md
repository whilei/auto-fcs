---
title: "checkP1counts"
author: "JL"
date: "3/28/2018"
output: 
  html_document: 
    keep_md: yes
---









![](p1ChecksV3_files/figure-html/unnamed-chunk-2-1.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-2.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-3.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-4.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-5.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-6.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-7.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-8.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-9.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-10.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-11.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-12.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-13.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-14.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-15.png)<!-- -->![](p1ChecksV3_files/figure-html/unnamed-chunk-2-16.png)<!-- -->


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



<!-- latest=    read.xlsx(xlsxFile = "/Volumes/Beta/data/flow/p1CheckCounts/allCounts.xlsx",sheet = 1) -->

<!-- hrs=    read.xlsx(xlsxFile = "/Volumes/Beta/data/flow/HRS1000 REPORT.xlsx",sheet = 1) -->

<!-- latest=latest[,c(1:17,57:79)] -->
<!-- colnames(sub) -->

<!-- for(col in colnames(sub)){ -->
<!--   print(max(na.omit(as.numeric(sub[,col])))) -->
<!-- } -->

<!-- latest$KEY=latest$LAB_ID -->
<!-- hrs$KEY=hrs$Study.ID -->
<!-- merge=merge(latest,hrs,by.x = "KEY",by.y ="KEY" ) -->

<!-- merge=merge[which(merge$`IgD+MemB`<=100&merge$`IgD-MemB`<=100),] -->

<!-- # colnames(hrs) %in% colnames(latest) -->
<!-- mergeNoMan=merge[which(merge$HAS_MANUAL_WSP==FALSE),] -->

<!-- map = list(c( -->
<!--   "B.cells.(CD3-.CD19+).(Comp-APC-A.(CD3).v.Comp-PE-Cy7-A.(CD19))", -->
<!--   "Bcell" -->
<!--   ),c( -->
<!--   "Tcells.(CD3+.CD19-).(Comp-APC-A.(CD3).v.Comp-PE-Cy7-A.(CD19))", -->
<!--   "Tcell" -->
<!--   ),c( -->
<!--   "Helper.Tcells-CD4+.(Comp-APC-Cy7-A.(CD4).v.Comp-BUV396-A.(CD8))", -->
<!--   "HT" -->
<!--   ),c( -->
<!--   "cytotoxic.Tcells-CD8+.(Comp-APC-Cy7-A.(CD4).v.Comp-BUV396-A.(CD8))", -->
<!--   "CT" -->
<!--   ),c( -->
<!--   "IgD+.memory.Bcells.(CD27+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))", -->
<!--   "IgD+MemB" -->
<!--   ),c( -->
<!--   "IgD-.memory.Bcells.(CD27+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))", -->
<!--   "IgD-MemB" -->
<!--   ),c( -->
<!--   "naive.Bcells.(CD27-.IgD+).(Comp-BUV737-A.(IgD).v.Comp-FITC-A.(CD27))", -->
<!--   "NaiveB" -->
<!--   ),c( -->
<!--   "effector.helper.Tcells.(CCR7-.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "E.HT" -->
<!--   ) -->
<!--   ,c( -->
<!--   "effector.memory.helper.Tcells.(CCR7-.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "EM.HT" -->
<!--   ),c( -->
<!--   "central.memory.helper.Tcells.(CCR7+.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "CM.HT" -->
<!--   ),c( -->
<!--   "naive.helper.Tcells.(CCR7+.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "N.HT" -->
<!--   ),c( -->
<!--   "effector.cytotoxic.Tcells.(CCR7-.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "E.CT" -->
<!--   ) -->
<!--   ,c( -->
<!--   "effector.memory.cytotoxic.Tcells.(CCR7-.,.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "EM.CT" -->
<!--   ),c( -->
<!--   "central.memory.cytotoxic.Tcells.(CCR7+.,.CD45RA-).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "CM.CT" -->
<!--   ),c( -->
<!--   "naive.cytotoxic.Tcells.(CCR7+.,.CD45RA+).(Comp-BV421-A.(CCR7).v.Comp-BV711-A.(CD45RA))", -->
<!--   "N.CT" -->
<!--   ) -->


<!--   ) -->

<!-- for(pop in map){ -->
<!--   print(pop) -->
<!--   co =cor.test(merge[,pop[2]] ,merge[,pop[1]] ) -->
<!--   mergeMan=merge[which(merge$HAS_MANUAL_WSP==TRUE),] -->
<!--   coMan =cor.test(mergeMan[,pop[2]] ,mergeMan[,pop[1]] ) -->

<!--   mergeOC=merge[which(merge$HAS_MANUAL_WSP==FALSE),] -->
<!--   coOC =cor.test(mergeOC[,pop[2]] ,mergeOC[,pop[1]] ) -->

<!--   t = ggplot(merge, -->
<!--              aes(x = merge[, pop[2]] , -->
<!--              y = merge[, pop[1]], color = Source)) + -->
<!--              geom_point() + xlab(paste0("1st 1K ", pop[2])) + facet_wrap(~ HAS_MANUAL_WSP) + -->
<!--              ggtitle( -->
<!--              paste0( -->
<!--              "cor All=", -->
<!--              co$estimate, -->
<!--              "\ncor manaul v 1k manual=", -->
<!--              coMan$estimate, -->
<!--              "\ncor OC v 1k manual=", -->
<!--              coOC$estimate -->
<!--              ) -->
<!--              ) -->
<!--              print(t) -->
<!-- } -->





<!-- ``` -->

