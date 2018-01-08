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

1. Boxplots of sample CVs at each event threshold (the total events in the .fcs file)
2. Number of events in lymph/pbmc populations vs sample CV
4. Boxplots of sample CVs binned by lymph/pbmc counts - I'm kinda finding this to be the most informative. 
5. Number of events in lymph/pbmc populations vs number of events in current population.
6. Boxplots of sample CVs binned by number of events in current population.



```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-2.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-3.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-4.png)<!-- -->

```
## Warning: Removed 71 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-5.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-6.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-7.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-8.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-9.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-10.png)<!-- -->

```
## Warning: Removed 83 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-11.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-12.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-13.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-14.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-15.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-16.png)<!-- -->

```
## Warning: Removed 91 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-17.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-18.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-19.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-20.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-21.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-22.png)<!-- -->

```
## Warning: Removed 85 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-23.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-24.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-25.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-26.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-27.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-28.png)<!-- -->

```
## Warning: Removed 95 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-29.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-30.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-31.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-32.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-33.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-34.png)<!-- -->

```
## Warning: Removed 133 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-35.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-36.png)<!-- -->

```
## Warning: Removed 58 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-37.png)<!-- -->

```
## Warning: Removed 58 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-38.png)<!-- -->

```
## Warning: Removed 77 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-39.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-40.png)<!-- -->

```
## Warning: Removed 856 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-41.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-42.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-43.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-44.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-45.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-46.png)<!-- -->

```
## Warning: Removed 177 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-47.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-48.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-49.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-50.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-51.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-52.png)<!-- -->

```
## Warning: Removed 194 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-53.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-54.png)<!-- -->

```
## Warning: Removed 65 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-55.png)<!-- -->

```
## Warning: Removed 65 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-56.png)<!-- -->

```
## Warning: Removed 84 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-57.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-58.png)<!-- -->

```
## Warning: Removed 278 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-59.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-60.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-61.png)<!-- -->

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-62.png)<!-- -->

```
## Warning: Removed 78 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-63.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-64.png)<!-- -->

```
## Warning: Removed 387 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-65.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-66.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-67.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-68.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-69.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-70.png)<!-- -->

```
## Warning: Removed 205 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-71.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-72.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-73.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-74.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-75.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-76.png)<!-- -->

```
## Warning: Removed 138 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-77.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-78.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-79.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-80.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-81.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-82.png)<!-- -->

```
## Warning: Removed 177 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-83.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-84.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-85.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-86.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-87.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-88.png)<!-- -->

```
## Warning: Removed 127 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-89.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-90.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-91.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-92.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-93.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-94.png)<!-- -->

```
## Warning: Removed 236 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-95.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-96.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-97.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-98.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-99.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-100.png)<!-- -->

```
## Warning: Removed 150 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-101.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-102.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-103.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-104.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-105.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-106.png)<!-- -->

```
## Warning: Removed 230 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-107.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-108.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-109.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-110.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-111.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-112.png)<!-- -->

```
## Warning: Removed 171 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-113.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-114.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-115.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-116.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-117.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-118.png)<!-- -->

```
## Warning: Removed 125 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-119.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-120.png)<!-- -->

```
## Warning: Removed 586 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-121.png)<!-- -->

```
## Warning: Removed 586 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-122.png)<!-- -->

```
## Warning: Removed 607 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-123.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-124.png)<!-- -->

```
## Warning: Removed 626 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-125.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-126.png)<!-- -->

```
## Warning: Removed 119 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-127.png)<!-- -->

```
## Warning: Removed 119 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-128.png)<!-- -->

```
## Warning: Removed 138 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-129.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-130.png)<!-- -->

```
## Warning: Removed 262 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-131.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-132.png)<!-- -->

```
## Warning: Removed 225 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-133.png)<!-- -->

```
## Warning: Removed 225 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-134.png)<!-- -->

```
## Warning: Removed 244 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-135.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-136.png)<!-- -->

```
## Warning: Removed 427 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-137.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-138.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-139.png)<!-- -->

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-140.png)<!-- -->

```
## Warning: Removed 78 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-141.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-142.png)<!-- -->

```
## Warning: Removed 227 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-143.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-144.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-145.png)<!-- -->

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-146.png)<!-- -->

```
## Warning: Removed 76 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-147.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-148.png)<!-- -->

```
## Warning: Removed 128 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-149.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-150.png)<!-- -->

```
## Warning: Removed 70 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-151.png)<!-- -->

```
## Warning: Removed 70 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-152.png)<!-- -->

```
## Warning: Removed 89 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-153.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-154.png)<!-- -->

```
## Warning: Removed 327 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-155.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-156.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-157.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-158.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-159.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-160.png)<!-- -->

```
## Warning: Removed 277 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-161.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-162.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-163.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-164.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-165.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-166.png)<!-- -->

```
## Warning: Removed 104 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-167.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-168.png)<!-- -->

```
## Warning: Removed 420 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-169.png)<!-- -->

```
## Warning: Removed 420 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-170.png)<!-- -->

```
## Warning: Removed 439 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-171.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-172.png)<!-- -->

```
## Warning: Removed 501 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-173.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-174.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-175.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-176.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-177.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-178.png)<!-- -->

```
## Warning: Removed 148 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-179.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-180.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-181.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-182.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-183.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-184.png)<!-- -->

```
## Warning: Removed 111 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-185.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-186.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-187.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-188.png)<!-- -->

```
## Warning: Removed 74 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-189.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-190.png)<!-- -->

```
## Warning: Removed 141 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-191.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-192.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-193.png)<!-- -->

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-194.png)<!-- -->

```
## Warning: Removed 76 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-195.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-196.png)<!-- -->

```
## Warning: Removed 119 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-197.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-198.png)<!-- -->

```
## Warning: Removed 60 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-199.png)<!-- -->

```
## Warning: Removed 60 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-200.png)<!-- -->

```
## Warning: Removed 79 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-201.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-202.png)<!-- -->

```
## Warning: Removed 116 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-203.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-204.png)<!-- -->

```
## Warning: Removed 67 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-205.png)<!-- -->

```
## Warning: Removed 67 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-206.png)<!-- -->

```
## Warning: Removed 86 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-207.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-208.png)<!-- -->

```
## Warning: Removed 201 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-209.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-210.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-211.png)<!-- -->

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-212.png)<!-- -->

```
## Warning: Removed 78 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-213.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-214.png)<!-- -->

```
## Warning: Removed 236 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-215.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-216.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-217.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-218.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-219.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-220.png)<!-- -->

```
## Warning: Removed 91 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-221.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-222.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-223.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-224.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-225.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-226.png)<!-- -->

```
## Warning: Removed 216 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-227.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-228.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-229.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-230.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-231.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-232.png)<!-- -->

```
## Warning: Removed 213 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-233.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-234.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-235.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-236.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-237.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-238.png)<!-- -->

```
## Warning: Removed 390 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-239.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-240.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-241.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-242.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-243.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-244.png)<!-- -->

```
## Warning: Removed 493 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-245.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-246.png)<!-- -->

```
## Warning: Removed 80 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-247.png)<!-- -->

```
## Warning: Removed 80 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-248.png)<!-- -->

```
## Warning: Removed 214 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-249.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-250.png)<!-- -->

```
## Warning: Removed 536 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-251.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-252.png)<!-- -->

```
## Warning: Removed 53 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-253.png)<!-- -->

```
## Warning: Removed 53 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-254.png)<!-- -->

```
## Warning: Removed 184 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-255.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-256.png)<!-- -->

```
## Warning: Removed 440 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-257.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-258.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-259.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-260.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-261.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-262.png)<!-- -->

```
## Warning: Removed 212 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-263.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-264.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-265.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-266.png)<!-- -->

```
## Warning: Removed 186 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-267.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-268.png)<!-- -->

```
## Warning: Removed 336 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-269.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-270.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-271.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-272.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-273.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-274.png)<!-- -->

```
## Warning: Removed 471 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-275.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-276.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-277.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-278.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-279.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-280.png)<!-- -->

```
## Warning: Removed 152 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-281.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-282.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-283.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-284.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-285.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-286.png)<!-- -->

```
## Warning: Removed 471 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-287.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-288.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-289.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-290.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-291.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-292.png)<!-- -->

```
## Warning: Removed 152 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-293.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-294.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-295.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-296.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-297.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-298.png)<!-- -->

```
## Warning: Removed 136 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-299.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-300.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-301.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-302.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-303.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-304.png)<!-- -->

```
## Warning: Removed 143 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-305.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-306.png)<!-- -->

```
## Warning: Removed 482 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-307.png)<!-- -->

```
## Warning: Removed 482 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-308.png)<!-- -->

```
## Warning: Removed 632 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-309.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-310.png)<!-- -->

```
## Warning: Removed 619 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-311.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-312.png)<!-- -->
