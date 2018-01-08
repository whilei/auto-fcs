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
![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-2-1.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-2-2.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-2-3.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-2-4.png)<!-- -->

# Population specific variability


- Frequency Parent CV computed within a sample for each event threshold (10 replicates at 2k,10 replicates at 3k, etc)

Plots below - for each population

1. Boxplots of sample CVs at each event threshold (the total events in the .fcs file)
2. Number of events in lymph/pbmc populations vs sample CV
4. Boxplots of sample CVs binned by lymph/pbmc counts - I'm kinda finding this to be the most informative. 
5. Number of events in lymph/pbmc populations vs number of events in current population.
6. Boxplots of sample CVs binned by number of events in current population.



```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-3.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-4.png)<!-- -->

```
## Warning: Removed 71 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-5.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-6.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-7.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-8.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-9.png)<!-- -->

```
## Warning: Removed 83 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-10.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-11.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-12.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-13.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-14.png)<!-- -->

```
## Warning: Removed 91 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-15.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-16.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-17.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-18.png)<!-- -->![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-19.png)<!-- -->

```
## Warning: Removed 216 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_trim_files/figure-html/unnamed-chunk-3-20.png)<!-- -->
