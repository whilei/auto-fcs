---
title: "Insilco LOD"
author: "JL"
date: "01/12/2018"
output: 
  html_document: 
    keep_md: yes
---


# Notes

Selected 30 LSR and 30 FORTESSA files matched for panel1 and panel2 that:

- had an event count > 700000
- had 0 "bad","abnormal", or "manual" annotatations

Within this set:

- randomly sub-sampled events 10 times per threshold, with requirement that number of events sampled be < %50 of total events












# Notes2

Sample selection

From the full study, sa

Randomly selected 60 samples (30 LSR,30 FORTESSA) matched for panel1 and panel2 that had a starting event count of at least 700000 and we

- had an event count > 700000
- had 0 "bad","abnormal", or "manual" annotatations

Within this set:

- randomly sub-sampled events 10 times per threshold, with requirement that number of events sampled be < %50 of total events




# Failure rate by number of events sampled
![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-3-1.png)<!-- -->![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-3-2.png)<!-- -->![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-3-3.png)<!-- -->![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-3-4.png)<!-- -->

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

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-3.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-4.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-5.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-6.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-7.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-8.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-9.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-10.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-11.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-12.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-13.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-14.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-15.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-16.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-17.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-18.png)<!-- -->

```
## Warning: Removed 58 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-19.png)<!-- -->

```
## Warning: Removed 101 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-20.png)<!-- -->

```
## Warning: Removed 101 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-21.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-22.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-23.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-24.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-25.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-26.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-27.png)<!-- -->

```
## Warning: Removed 65 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-28.png)<!-- -->

```
## Warning: Removed 108 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-29.png)<!-- -->

```
## Warning: Removed 108 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-30.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-31.png)<!-- -->

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-32.png)<!-- -->

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-33.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-34.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-35.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-36.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-37.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-38.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-39.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-40.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-41.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-42.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-43.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-44.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-45.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-46.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-47.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-48.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-49.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-50.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-51.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-52.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-53.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-54.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-55.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-56.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-57.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-58.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-59.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-60.png)<!-- -->

```
## Warning: Removed 586 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-61.png)<!-- -->

```
## Warning: Removed 629 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-62.png)<!-- -->

```
## Warning: Removed 629 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-63.png)<!-- -->

```
## Warning: Removed 119 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-64.png)<!-- -->

```
## Warning: Removed 162 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-65.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 166 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-66.png)<!-- -->

```
## Warning: Removed 225 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-67.png)<!-- -->

```
## Warning: Removed 268 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-68.png)<!-- -->

```
## Warning: Removed 268 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-69.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-70.png)<!-- -->

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-71.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 124 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-72.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-73.png)<!-- -->

```
## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-74.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-75.png)<!-- -->

```
## Warning: Removed 70 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-76.png)<!-- -->

```
## Warning: Removed 113 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-77.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 115 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-78.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-79.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-80.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-81.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-82.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-83.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-84.png)<!-- -->

```
## Warning: Removed 420 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-85.png)<!-- -->

```
## Warning: Removed 465 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-86.png)<!-- -->

```
## Warning: Removed 465 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-87.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-88.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-89.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-90.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-91.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-92.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-93.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-94.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-95.png)<!-- -->

```
## Warning: Removed 98 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-96.png)<!-- -->

```
## Warning: Removed 57 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-97.png)<!-- -->

```
## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-98.png)<!-- -->

```
## Warning: Removed 100 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-99.png)<!-- -->

```
## Warning: Removed 60 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-100.png)<!-- -->

```
## Warning: Removed 103 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-101.png)<!-- -->

```
## Warning: Removed 103 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-102.png)<!-- -->

```
## Warning: Removed 67 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-103.png)<!-- -->

```
## Warning: Removed 110 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-104.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 114 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-105.png)<!-- -->

```
## Warning: Removed 59 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-106.png)<!-- -->

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-107.png)<!-- -->

```
## Warning: Removed 102 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-108.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-109.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-110.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 188 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-111.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-112.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-113.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-114.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-115.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-116.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-117.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-118.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-119.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-120.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-121.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-122.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 184 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-123.png)<!-- -->

```
## Warning: Removed 80 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-124.png)<!-- -->

```
## Warning: Removed 214 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-125.png)<!-- -->

```
## Warning: Removed 214 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-126.png)<!-- -->

```
## Warning: Removed 53 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-127.png)<!-- -->

```
## Warning: Removed 184 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-128.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 214 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-129.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-130.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-131.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-132.png)<!-- -->

```
## Warning: Removed 55 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-133.png)<!-- -->

```
## Warning: Removed 186 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-134.png)<!-- -->

```
## Warning: Removed 186 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-135.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-136.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-137.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 180 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-138.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-139.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-140.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 180 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-141.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-142.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-143.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 180 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-144.png)<!-- -->

```
## Warning: Removed 47 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-145.png)<!-- -->

```
## Warning: Removed 178 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-146.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis

## Warning: Removed 180 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-147.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-148.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-149.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-150.png)<!-- -->

```
## Warning: Removed 51 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-151.png)<!-- -->

```
## Warning: Removed 182 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-152.png)<!-- -->

```
## Warning: Transformation introduced infinite values in continuous y-axis
```

```
## Warning: Removed 207 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-153.png)<!-- -->

```
## Warning: Removed 482 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-154.png)<!-- -->

```
## Warning: Removed 632 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-155.png)<!-- -->

```
## Warning: Removed 632 rows containing non-finite values (stat_boxplot).
```

![](Insilico_V10_V4_text_files/figure-html/unnamed-chunk-4-156.png)<!-- -->
