# Validate Seed
JL  
12/18/2017  




# Correlation of all counts

```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$Count.x and combo$Count.y
## t = 62789, df = 514000, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9999345 0.9999352
## sample estimates:
##       cor 
## 0.9999348
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
## S = 3.1475e+13, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9986093
```

```
## Warning: Removed 9960 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-1-1.png)<!-- -->


# Correlation of frequency of parent counts


```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$freqParent.x and combo$freqParent.y
## t = 14370, df = 493760, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9987999 0.9988132
## sample estimates:
##       cor 
## 0.9988065
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
## S = 2.7205e+13, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9986441
```

```
## Warning: Removed 30609 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```
## Warning: Removed 30609 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-2-2.png)<!-- -->


# Correlation of frequency of parent counts (panel2)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 4852.6, df = 129330, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9972351 0.9972947
## sample estimates:
##       cor 
## 0.9972651
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
## S = 1.0209e+12, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9971689
```

```
## Warning: Removed 20034 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 20034 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-3-2.png)<!-- -->![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-3-3.png)<!-- -->


# Correlation of frequency of parent counts (panel1)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 17514, df = 364430, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9994026 0.9994103
## sample estimates:
##       cor 
## 0.9994065
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
## S = 4.008e+12, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9995031
```

```
## Warning: Removed 10575 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```
## Warning: Removed 10575 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-4-2.png)<!-- -->![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-4-3.png)<!-- -->




# Correlation of frequency of parent counts (> 1% difference)


```
## Warning: Removed 11 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-5-1.png)<!-- -->




