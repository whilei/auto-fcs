# TrendQC
JL  
1/12/2018  






```
## Warning in format.POSIXlt(as.POSIXlt(x), ...): unknown timezone 'zone/tz/
## 2017c.1.0/zoneinfo/America/Chicago'
```

![](TrendQC_files/figure-html/unnamed-chunk-2-1.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-2.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-3.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-4.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-5.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-6.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-7.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-8.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-9.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-10.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-11.png)<!-- -->

```
## 
## Call:
## lm(formula = formula, data = sub)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1612344  -654891  -201692   443121  8301844 
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1434080      23219  61.764  < 2e-16 ***
## EXPERIMENTEREC   232941      51261   4.544 5.62e-06 ***
## EXPERIMENTERHB  -203512      45925  -4.431 9.52e-06 ***
## EXPERIMENTERRR   -67736      41348  -1.638   0.1014    
## EXPERIMENTERZF    53136      29597   1.795   0.0727 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 964100 on 6309 degrees of freedom
## Multiple R-squared:  0.009992,	Adjusted R-squared:  0.009365 
## F-statistic: 15.92 on 4 and 6309 DF,  p-value: 5.677e-13
## 
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = formula, data = sub)
## 
## $EXPERIMENTER
##              diff         lwr        upr     p adj
## EC-DHS  232941.00   93071.819  372810.18 0.0000551
## HB-DHS -203511.93 -328820.470  -78203.38 0.0000930
## RR-DHS  -67735.52 -180556.505   45085.46 0.4728900
## ZF-DHS   53135.89  -27621.219  133893.00 0.3763179
## HB-EC  -436452.92 -601492.997 -271412.85 0.0000000
## RR-EC  -300676.52 -456447.407 -144905.64 0.0000014
## ZF-EC  -179805.11 -314184.069  -45426.14 0.0024446
## RR-HB   135776.40   -7064.111  278616.91 0.0716173
## ZF-HB   256647.82  137498.545  375797.09 0.0000000
## ZF-RR   120871.42   14933.266  226809.57 0.0159590
```

![](TrendQC_files/figure-html/unnamed-chunk-2-12.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-13.png)<!-- -->

```
## 
## Call:
## lm(formula = formula, data = sub)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1221789  -455997  -138813   312002  6397370 
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1158544      16979  68.234  < 2e-16 ***
## EXPERIMENTEREC    74657      37345   1.999   0.0456 *  
## EXPERIMENTERHB  -177898      33522  -5.307 1.15e-07 ***
## EXPERIMENTERRR  -139922      29862  -4.686 2.85e-06 ***
## EXPERIMENTERZF   -43869      21534  -2.037   0.0417 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 700900 on 6345 degrees of freedom
## Multiple R-squared:  0.00873,	Adjusted R-squared:  0.008106 
## F-statistic: 13.97 on 4 and 6345 DF,  p-value: 2.378e-11
## 
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = formula, data = sub)
## 
## $EXPERIMENTER
##              diff        lwr        upr     p adj
## EC-DHS   74657.26  -27241.68  176556.19 0.2664478
## HB-DHS -177897.67 -269364.29  -86431.05 0.0000011
## RR-DHS -139921.96 -221403.58  -58440.34 0.0000281
## ZF-DHS  -43868.65 -102626.26   14888.97 0.2483031
## HB-EC  -252554.93 -372792.02 -132317.83 0.0000001
## RR-EC  -214579.22 -327406.83 -101751.60 0.0000022
## ZF-EC  -118525.90 -216215.58  -20836.22 0.0083182
## RR-HB    37975.71  -65527.04  141478.47 0.8549541
## ZF-HB   134029.02   47276.37  220781.68 0.0002446
## ZF-RR    96053.31   19901.26  172205.37 0.0052684
```

![](TrendQC_files/figure-html/unnamed-chunk-2-14.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-15.png)<!-- -->

```
## 
## Call:
## lm(formula = formula, data = sub)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1466348  -601201  -204626   402540 13573637 
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1366626      32828  41.630  < 2e-16 ***
## EXPERIMENTEREC   100913      56400   1.789  0.07365 .  
## EXPERIMENTERHB  -118607      42579  -2.786  0.00537 ** 
## EXPERIMENTERRR  -238530      48033  -4.966 7.11e-07 ***
## EXPERIMENTERZF   -83377      42297  -1.971  0.04876 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 910300 on 4124 degrees of freedom
## Multiple R-squared:  0.01052,	Adjusted R-squared:  0.009561 
## F-statistic: 10.96 on 4 and 4124 DF,  p-value: 7.671e-09
## 
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = formula, data = sub)
## 
## $EXPERIMENTER
##              diff        lwr         upr     p adj
## EC-DHS  100913.08  -53002.64  254828.798 0.3799483
## HB-DHS -118607.41 -234805.36   -2409.471 0.0427316
## RR-DHS -238530.00 -369612.42 -107447.585 0.0000071
## ZF-DHS  -83377.25 -198804.01   32049.510 0.2802948
## HB-EC  -219520.49 -364918.66  -74122.323 0.0003718
## RR-EC  -339443.08 -496990.75 -181895.419 0.0000001
## ZF-EC  -184290.33 -329072.93  -39507.723 0.0047143
## RR-HB  -119922.59 -240890.27    1045.089 0.0533219
## ZF-HB    35230.16  -68567.31  139027.639 0.8868225
## ZF-RR   155152.76   34925.66  275379.850 0.0039625
```

![](TrendQC_files/figure-html/unnamed-chunk-2-16.png)<!-- -->![](TrendQC_files/figure-html/unnamed-chunk-2-17.png)<!-- -->

```
## 
## Call:
## lm(formula = formula, data = sub)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1142944  -442781  -137164   291549  8547218 
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     1114210      25305  44.031  < 2e-16 ***
## EXPERIMENTEREC    29985      43061   0.696  0.48625    
## EXPERIMENTERHB  -102689      33106  -3.102  0.00194 ** 
## EXPERIMENTERRR  -231001      36877  -6.264 4.15e-10 ***
## EXPERIMENTERZF  -130259      32585  -3.997 6.52e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 690700 on 3975 degrees of freedom
## Multiple R-squared:  0.01379,	Adjusted R-squared:  0.0128 
## F-statistic: 13.89 on 4 and 3975 DF,  p-value: 2.949e-11
## 
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = formula, data = sub)
## 
## $EXPERIMENTER
##              diff         lwr        upr     p adj
## EC-DHS   29985.43  -87529.859  147500.73 0.9573338
## HB-DHS -102689.34 -193036.648  -12342.04 0.0165837
## RR-DHS -231000.74 -331639.231 -130362.26 0.0000000
## ZF-DHS -130258.92 -219184.861  -41332.98 0.0006229
## HB-EC  -132674.78 -244183.620  -21165.94 0.0103355
## RR-EC  -260986.18 -380984.893 -140987.47 0.0000001
## ZF-EC  -160244.36 -270604.716  -49884.00 0.0007193
## RR-HB  -128311.40 -221866.102  -34756.70 0.0017274
## ZF-HB   -27569.58 -108391.604   53252.45 0.8849632
## ZF-RR   100741.82    8559.016  192924.63 0.0240330
```

```
## 
## Call:
## lm(formula = formula, data = tc)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1537019  -535890  -165570   353342 13583760 
## 
## Coefficients:
##                  Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    3508401.69  909219.88   3.859 0.000114 ***
## DATE_MONTH        -125.01      52.81  -2.367 0.017936 *  
## MACHINELSR      103024.10   12737.64   8.088 6.39e-16 ***
## PANELpanel2    -309130.24   11530.60 -26.810  < 2e-16 ***
## EXPERIMENTEREC  148880.19   26241.55   5.673 1.42e-08 ***
## EXPERIMENTERHB -117147.62   19111.46  -6.130 8.96e-10 ***
## EXPERIMENTERRR -139031.50   20586.55  -6.754 1.48e-11 ***
## EXPERIMENTERZF  -23863.38   15224.13  -1.567 0.117020    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 830900 on 20765 degrees of freedom
## Multiple R-squared:  0.046,	Adjusted R-squared:  0.04568 
## F-statistic: 143.1 on 7 and 20765 DF,  p-value: < 2.2e-16
```

```
## Start:  AIC=566288.9
## TOTAL_COUNTS ~ DATE_MONTH + MACHINE + PANEL + EXPERIMENTER
## 
##                Df  Sum of Sq        RSS    AIC
## <none>                       1.4335e+16 566289
## - DATE_MONTH    1 3.8681e+12 1.4338e+16 566292
## - MACHINE       1 4.5160e+13 1.4380e+16 566352
## - EXPERIMENTER  4 1.1466e+14 1.4449e+16 566446
## - PANEL         1 4.9617e+14 1.4831e+16 566994
```

```
## Stepwise Model Path 
## Analysis of Deviance Table
## 
## Initial Model:
## TOTAL_COUNTS ~ DATE_MONTH + MACHINE + PANEL + EXPERIMENTER
## 
## Final Model:
## TOTAL_COUNTS ~ DATE_MONTH + MACHINE + PANEL + EXPERIMENTER
## 
## 
##   Step Df Deviance Resid. Df  Resid. Dev      AIC
## 1                      20765 1.43346e+16 566288.9
```

