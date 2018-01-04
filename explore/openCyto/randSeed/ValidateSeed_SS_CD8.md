# Validate Seed
JL  
12/18/2017  




# Correlation of all counts

```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$Count.x and combo$Count.y
## t = 57121, df = 513950, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9999208 0.9999217
## sample estimates:
##       cor 
## 0.9999213
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
## S = 4.5205e+13, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9980021
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-1-1.png)<!-- -->


# Correlation of frequency of parent counts


```
## 
## 	Pearson's product-moment correlation
## 
## data:  combo$freqParent.x and combo$freqParent.y
## t = 10313, df = 493720, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9976742 0.9977000
## sample estimates:
##       cor 
## 0.9976872
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
## S = 4.7036e+13, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##      rho 
## 0.997655
```

```
## Warning: Removed 20656 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```
## Warning: Removed 20656 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-2-2.png)<!-- -->


# Correlation of frequency of parent counts (panel2)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 4138.5, df = 129320, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9962049 0.9962865
## sample estimates:
##       cor 
## 0.9962459
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
## S = 1.3632e+12, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9962185
```

```
## Warning: Removed 10073 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 10073 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Removed 9231 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-3-3.png)<!-- -->


# Correlation of frequency of parent counts (panel1)


```
## 
## 	Pearson's product-moment correlation
## 
## data:  comboP2$freqParent.x and comboP2$freqParent.y
## t = 9997, df = 364390, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9981701 0.9981937
## sample estimates:
##       cor 
## 0.9981819
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
## S = 1.2225e+13, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##      rho 
## 0.998484
```

```
## Warning: Removed 10583 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```
## Warning: Removed 10583 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```
## Warning: Removed 393 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-4-3.png)<!-- -->




# Correlation of frequency of parent counts (> 1% difference)


```
## Warning: Removed 35 rows containing missing values (geom_point).
```

![](ValidateSeed_SS_CD8_files/figure-html/unnamed-chunk-5-1.png)<!-- -->




