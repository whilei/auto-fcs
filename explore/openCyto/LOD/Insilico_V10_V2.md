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




```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-2.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-3.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-4.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-5.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-6.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-7.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-8.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-9.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-10.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-11.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-12.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-13.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-14.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-15.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-16.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-17.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
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

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-22.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-23.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-24.png)<!-- -->

```
## Warning: Removed 58 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-25.png)<!-- -->

```
## Warning: Removed 58 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-26.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-27.png)<!-- -->

```
## Warning: Removed 58 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-28.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-29.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-30.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-31.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-32.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-33.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-34.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-35.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-36.png)<!-- -->

```
## Warning: Removed 65 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-37.png)<!-- -->

```
## Warning: Removed 65 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-38.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-39.png)<!-- -->

```
## Warning: Removed 65 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-40.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-41.png)<!-- -->

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-42.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-43.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-44.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-45.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-46.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-47.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-48.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-49.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-50.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-51.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-52.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-53.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-54.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-55.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-56.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-57.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-58.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-59.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-60.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-61.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-62.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-63.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-64.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-65.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-66.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-67.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-68.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-69.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-70.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-71.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-72.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-73.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-74.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-75.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-76.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-77.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-78.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-79.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-80.png)<!-- -->

```
## Warning: Removed 586 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-81.png)<!-- -->

```
## Warning: Removed 586 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-82.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-83.png)<!-- -->

```
## Warning: Removed 586 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-84.png)<!-- -->

```
## Warning: Removed 119 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-85.png)<!-- -->

```
## Warning: Removed 119 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-86.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-87.png)<!-- -->

```
## Warning: Removed 119 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-88.png)<!-- -->

```
## Warning: Removed 225 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-89.png)<!-- -->

```
## Warning: Removed 225 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-90.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-91.png)<!-- -->

```
## Warning: Removed 225 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-92.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-93.png)<!-- -->

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-94.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-95.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-96.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-97.png)<!-- -->

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-98.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-99.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-100.png)<!-- -->

```
## Warning: Removed 70 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-101.png)<!-- -->

```
## Warning: Removed 70 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-102.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-103.png)<!-- -->

```
## Warning: Removed 70 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-104.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-105.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-106.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-107.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-108.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-109.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-110.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-111.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-112.png)<!-- -->

```
## Warning: Removed 420 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-113.png)<!-- -->

```
## Warning: Removed 420 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-114.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-115.png)<!-- -->

```
## Warning: Removed 420 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-116.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-117.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-118.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-119.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-120.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-121.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-122.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-123.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-124.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-125.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-126.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-127.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-128.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-129.png)<!-- -->

```
## Warning: Removed 57 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-130.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-131.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-132.png)<!-- -->

```
## Warning: Removed 60 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-133.png)<!-- -->

```
## Warning: Removed 60 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-134.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-135.png)<!-- -->

```
## Warning: Removed 60 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-136.png)<!-- -->

```
## Warning: Removed 67 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-137.png)<!-- -->

```
## Warning: Removed 67 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-138.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-139.png)<!-- -->

```
## Warning: Removed 67 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-140.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-141.png)<!-- -->

```
## Warning: Removed 59 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-142.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-143.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-144.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-145.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-146.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-147.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-148.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-149.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-150.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-151.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-152.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-153.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-154.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-155.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-156.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-157.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-158.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-159.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-160.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-161.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-162.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-163.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-164.png)<!-- -->

```
## Warning: Removed 80 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-165.png)<!-- -->

```
## Warning: Removed 80 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-166.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-167.png)<!-- -->

```
## Warning: Removed 80 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-168.png)<!-- -->

```
## Warning: Removed 53 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-169.png)<!-- -->

```
## Warning: Removed 53 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-170.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-171.png)<!-- -->

```
## Warning: Removed 53 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-172.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-173.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-174.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-175.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-176.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-177.png)<!-- -->

```
## Warning: Removed 55 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-178.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-179.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-180.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-181.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-182.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-183.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-184.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-185.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-186.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-187.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-188.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-189.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-190.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-191.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-192.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-193.png)<!-- -->

```
## Warning: Removed 47 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-194.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-195.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-196.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-197.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-198.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-199.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-200.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-201.png)<!-- -->

```
## Warning: Removed 51 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-202.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-203.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-204.png)<!-- -->

```
## Warning: Removed 482 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-205.png)<!-- -->

```
## Warning: Removed 482 rows containing missing values (geom_point).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-206.png)<!-- -->![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-207.png)<!-- -->

```
## Warning: Removed 482 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V2_files/figure-html/unnamed-chunk-3-208.png)<!-- -->
