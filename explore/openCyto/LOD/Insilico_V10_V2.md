# Insilco LOD
JL  
01/08/2018  


# Notes

Selected 30 LSR and 30 FORTESSA files matched for panel1 and panel2 that:

- had an event count > 700000
- had 0 "bad","abnormal", or "manual" annotatations

Within this set:

- randomly sub-sampled events 10 times per threshold, with requirement that number of events sampled be < %50 of total events









# Failure rate by number of events sampled
![](Insilico_V10_V2_files/figure-html/unnamed-chunk-2-1.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-2-2.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-2-3.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-2-4.png)<!-- -->

# Population specific variability


- Frequency Parent CV computed within a sample for each event threshold (10 replicates at 2k,10 replicates at 3k, etc)

Plots below - for each population

1. Boxplots of sample CVs at each event threshold
2. Number of events in lymph/pbmc vs sample CV
3. Histogram of number of events in lymph/pbmc
4. Boxplots of sample CVs for binned lymph/pbmc counts
5. Number of events in lymph/pbmc vs number of events in the population




```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-3.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-4.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-5.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-6.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-7.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-8.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-9.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-10.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-11.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-12.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-13.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-14.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-15.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-16.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-17.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-18.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-19.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-20.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-21.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-22.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-23.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-24.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-25.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-26.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-27.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-28.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-29.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-30.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-31.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-32.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-33.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-34.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-35.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-36.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-37.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-38.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-39.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-40.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-41.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-42.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-43.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-44.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-45.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-46.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-47.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-48.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-49.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-50.png)<!-- -->
