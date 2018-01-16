# Validate Seed
JL  
12/18/2017  




# Correlation of all counts

```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$Count.x and combo$Count.y
## t = 277240, df = 280630, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9999982 0.9999982
## sample estimates:
##       cor 
## 0.9999982
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
## S = 2.1073e+12, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9994279
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-1-1.png)<!-- -->


# Correlation of frequency of parent counts


```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$freqParent.x and combo$freqParent.y
## t = 13780, df = 267490, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9992910 0.9993017
## sample estimates:
##       cor 
## 0.9992964
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
## S = 3.4143e+12, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9989296
```

```
## Warning: Removed 13304 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```
## Warning: Removed 13304 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-2-2.png)<!-- -->


# Correlation of frequency of parent counts (panel2)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 93150000, df = 127540, p-value < 2.2e-16
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
## S = 3858.1, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
## rho 
##   1
```

```
## Warning: Removed 9234 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 9234 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Removed 8612 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-3-3.png)<!-- -->


# Correlation of frequency of parent counts (panel1)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 6403, df = 139950, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9982796 0.9983153
## sample estimates:
##       cor 
## 0.9982976
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
## S = 1.3043e+12, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9971452
```

```
## Warning: Removed 4070 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```
## Warning: Removed 4070 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```
## Warning: Removed 159 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-4-3.png)<!-- -->




# Correlation of frequency of parent counts (> 1% difference)


```
## Warning: Removed 113 rows containing missing values (geom_point).
```

![](ValidateSeed_TCellSubs_files/figure-html/unnamed-chunk-5-1.png)<!-- -->




