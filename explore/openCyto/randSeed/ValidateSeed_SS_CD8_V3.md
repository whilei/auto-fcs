# Validate Seed
JL  
12/18/2017  




# Correlation of all counts

```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$Count.x and combo$Count.y
## t = 140580000, df = 507510, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  1 1
## sample estimates:
## cor 
##   1
```

```
## Warning in cor.test.default(combo$Count.x, combo$Count.y, method =
## "spearman"): Cannot compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  combo$Count.x and combo$Count.y
## S = 210340000, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
## rho 
##   1
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-1-1.png)<!-- -->


# Correlation of frequency of parent counts


```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$freqParent.x and combo$freqParent.y
## t = 53382000, df = 488180, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  1 1
## sample estimates:
## cor 
##   1
```

```
## Warning in cor.test.default(combo$freqParent.x, combo$freqParent.y, method
## = "spearman"): Cannot compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  combo$freqParent.x and combo$freqParent.y
## S = 20438000, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
## rho 
##   1
```

```
## Warning: Removed 19739 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```
## Warning: Removed 19739 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-2-2.png)<!-- -->


# Correlation of frequency of parent counts (panel2)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = Inf, df = 128850, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  1 1
## sample estimates:
## cor 
##   1
```

```
## Warning in cor.test.default(comboP2$freqParent.x, comboP2$freqParent.y, :
## Cannot compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## S = 0, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
## rho 
##   1
```

```
## Warning: Removed 9328 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 9328 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Removed 8612 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-3-3.png)<!-- -->


# Correlation of frequency of parent counts (panel1)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 36725000, df = 359330, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  1 1
## sample estimates:
## cor 
##   1
```

```
## Warning in cor.test.default(comboP2$freqParent.x, comboP2$freqParent.y, :
## Cannot compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## S = 10236000, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
## rho 
##   1
```

```
## Warning: Removed 10411 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```
## Warning: Removed 10411 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```
## Warning: Removed 381 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-4-3.png)<!-- -->




# Correlation of frequency of parent counts (> 1% difference)

![](ValidateSeed_SS_CD8_V3_files/figure-html/unnamed-chunk-5-1.png)<!-- -->




