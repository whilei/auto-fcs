---
title: "Test"
author: "JL"
date: "5/18/2018"
output: 
  html_document: 
    keep_md: yes
---


```r
require(flowCore)
require(ggcyto())

# fcs file located here
inputDir = "/Volumes/Beta2/flow/testNovels/"
sample = "2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs"

wsFile = "/Volumes/Beta2/flow/wsp/2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs_panel1Rename.wsp"
print(wsFile)
```

```
## [1] "/Volumes/Beta2/flow/wsp/2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs_panel1Rename.wsp"
```

```r
# open workspace file
ws <- openWorkspace(wsFile)

# read fcs file to flow frame
frame = read.FCS(paste(inputDir, sample, sep = ""))
frame
```

```
## flowFrame object '91c6c7ae-0db3-4699-b974-561626d14e4e'
## with 1783526 cells and 19 observables:
##            name   desc  range minRange maxRange
## $P1       FSC-A   <NA> 262144        0   262143
## $P2       FSC-H   <NA> 262144        0   262143
## $P3       FSC-W   <NA> 262144        0   262143
## $P4       SSC-A   <NA> 262144     -111   262143
## $P5       SSC-H   <NA> 262144        0   262143
## $P6       SSC-W   <NA> 262144        0   262143
## $P7     BB515-A   CD27 262144     -111   262143
## $P8        PE-A    L/D 262144     -111   262143
## $P9  PE-CF594-A HLA-DR 262144     -111   262143
## $P10   PE-Cy7-A   CD19 262144     -111   262143
## $P11  BUV 395-A    CD8 262144     -111   262143
## $P12  BUV 737-A    IgD 262144     -111   262143
## $P13      APC-A    CD3 262144     -111   262143
## $P14   BV 421-A   CCR7 262144     -111   262143
## $P15   BV 510-A   CD28 262144     -111   262143
## $P16   BV 605-A   CD95 262144     -111   262143
## $P17   BV 711-A CD45RA 262144     -111   262143
## $P18  APC-Cy7-A    CD4 262144     -111   262143
## $P19       Time   <NA> 262144        0   262143
## 278 keywords are stored in the 'description' slot
```

```r
comp <- compensation(keyword(frame)$`SPILL`)

s= getSamples(ws)
id=s[which(s$name==sample),]$name

 gs <-
      parseWorkspace(
        ws,
        #WSP file
        path = inputDir,
        #FCS file
        name = 1,
        #sample group
        subset = id[1],
        #load single fcs file
        isNcdf = FALSE,
        #not memory mapped
        compensation = comp
      )
```

```
## windows version of flowJo workspace recognized.
## version X
```

```r
gs
```

```
## A GatingSet with 1 samples
```

```r
# boolean matrix of cytoT definition
cytoTs = data.frame(DEFINITION = getIndiceMat(gs, "cytotoxic Tcells-CD8+")[, 1])

gh <- gs[[1]]
gh
```

```
## Sample:  2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs_1783526 
## GatingHierarchy with  91  gates
```

```r
# subset the flow frame to just cyto ts
subdata = getData(gh)[cytoTs$DEFINITION, ]
subdata
```

```
## flowFrame object '2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs_1783526'
## with 31843 cells and 19 observables:
##                 name   desc       range   minRange    maxRange
## $P1            FSC-A   <NA> 262143.0000    0.00000 262143.0000
## $P2            FSC-H   <NA> 262143.0000    0.00000 262143.0000
## $P3            FSC-W   <NA> 262143.0000    0.00000 262143.0000
## $P4            SSC-A   <NA> 262254.0000 -111.00000 262143.0000
## $P5            SSC-H   <NA> 262143.0000    0.00000 262143.0000
## $P6            SSC-W   <NA> 262143.0000    0.00000 262143.0000
## $P7     Comp-BB515-A   CD27    206.2144   50.70029    256.9146
## $P8        Comp-PE-A    L/D    206.2144   50.70029    256.9146
## $P9  Comp-PE-CF594-A HLA-DR    206.2144   50.70029    256.9146
## $P10   Comp-PE-Cy7-A   CD19    206.2144   50.70029    256.9146
## $P11  Comp-BUV 395-A    CD8    206.2144   50.70029    256.9146
## $P12  Comp-BUV 737-A    IgD    206.2144   50.70029    256.9146
## $P13      Comp-APC-A    CD3    206.2144   50.70029    256.9146
## $P14   Comp-BV 421-A   CCR7    206.2144   50.70029    256.9146
## $P15   Comp-BV 510-A   CD28    206.2144   50.70029    256.9146
## $P16   Comp-BV 605-A   CD95    206.2144   50.70029    256.9146
## $P17   Comp-BV 711-A CD45RA    206.2144   50.70029    256.9146
## $P18  Comp-APC-Cy7-A    CD4    206.2144   50.70029    256.9146
## $P19            Time   <NA>    250.2210    0.53800    250.7590
## 279 keywords are stored in the 'description' slot
```

```r
channels = colnames(subdata)[grep("Comp", colnames(subdata))]
# markerNames=markerNames
```
