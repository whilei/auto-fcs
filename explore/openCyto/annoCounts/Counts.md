# Count
JL  
12/22/2017  


```r
allOrig = read.delim("/Users/Kitty/git/auto-fcs/explore/openCyto/annoCounts/r25_panel2.txt", stringsAsFactors = FALSE,header = FALSE,sep = "|")
allOrig$V1=gsub("\t","",allOrig$V1)
allOrig$KEY=paste0(allOrig$V1,allOrig$V2)
allOrig$V3=gsub("Manual","manual",allOrig$V3)
nonCtl =!grepl("Ctl",allOrig$V2)
allOrig=allOrig[nonCtl,]
singleCells  = read.delim("/Users/Kitty/git/auto-fcs/explore/openCyto/annoCounts/singlecellbranch.txt", stringsAsFactors = FALSE,header = FALSE,sep = "|")
singleCells$V1=gsub("\t","",singleCells$V1)

singleCells$V3=gsub("Manual","manual",singleCells$V3)
singleCellsNOTMANUAL =singleCells[which(singleCells$V3!="Manual"&singleCells$V3 !="manual"),]
singleCellsNOTMANUAL$KEY=paste0(singleCellsNOTMANUAL$V1,singleCellsNOTMANUAL$V2)

notFixed=!allOrig$KEY %in% singleCellsNOTMANUAL$KEY

allOrigStillProbs=allOrig[notFixed,]
```


#Pre singlet correction


```r
library(knitr)
kable(as.data.frame(table(allOrig$V1,allOrig$V3)),format = "markdown")
```



|Var1                                  |Var2     | Freq|
|:-------------------------------------|:--------|----:|
|CD14-                                 |abnormal |    0|
|CD45-                                 |abnormal |    0|
|CD45+                                 |abnormal |    0|
|Classical monocytes (CD16- CD14+)     |abnormal |    4|
|DC (HLA-DR+)                          |abnormal |    0|
|DC NK (CD20- CD14-)                   |abnormal |    0|
|DC NK MONOCYTES (CD3- CD19-)          |abnormal |    0|
|HLA-DR+                               |abnormal |    0|
|Live immune cells (CD45+ PE-)         |abnormal |    0|
|Live Single immune cells(FSC-H_FSC-W) |abnormal |    0|
|Live Single PBMCs (SSC-A_FSC-A)       |abnormal |    0|
|NK CD56LO                             |abnormal |    0|
|CD14-                                 |good     |    0|
|CD45-                                 |good     |    0|
|CD45+                                 |good     |    0|
|Classical monocytes (CD16- CD14+)     |good     |    0|
|DC (HLA-DR+)                          |good     |    0|
|DC NK (CD20- CD14-)                   |good     |    0|
|DC NK MONOCYTES (CD3- CD19-)          |good     |    0|
|HLA-DR+                               |good     |    0|
|Live immune cells (CD45+ PE-)         |good     |    0|
|Live Single immune cells(FSC-H_FSC-W) |good     |    0|
|Live Single PBMCs (SSC-A_FSC-A)       |good     |    1|
|NK CD56LO                             |good     |    1|
|CD14-                                 |Good     |    1|
|CD45-                                 |Good     |    0|
|CD45+                                 |Good     |    0|
|Classical monocytes (CD16- CD14+)     |Good     |    0|
|DC (HLA-DR+)                          |Good     |    0|
|DC NK (CD20- CD14-)                   |Good     |    0|
|DC NK MONOCYTES (CD3- CD19-)          |Good     |    0|
|HLA-DR+                               |Good     |    0|
|Live immune cells (CD45+ PE-)         |Good     |    0|
|Live Single immune cells(FSC-H_FSC-W) |Good     |    0|
|Live Single PBMCs (SSC-A_FSC-A)       |Good     |    0|
|NK CD56LO                             |Good     |    0|
|CD14-                                 |manual   |  135|
|CD45-                                 |manual   |    1|
|CD45+                                 |manual   |   24|
|Classical monocytes (CD16- CD14+)     |manual   |  350|
|DC (HLA-DR+)                          |manual   |   75|
|DC NK (CD20- CD14-)                   |manual   |   43|
|DC NK MONOCYTES (CD3- CD19-)          |manual   |  156|
|HLA-DR+                               |manual   |    1|
|Live immune cells (CD45+ PE-)         |manual   |   37|
|Live Single immune cells(FSC-H_FSC-W) |manual   |  643|
|Live Single PBMCs (SSC-A_FSC-A)       |manual   |  140|
|NK CD56LO                             |manual   |  313|

#Post singlet correction


```r
kable(as.data.frame(table(allOrigStillProbs$V1,allOrigStillProbs$V3)),format = "markdown")
```



|Var1                                  |Var2     | Freq|
|:-------------------------------------|:--------|----:|
|CD14-                                 |abnormal |    0|
|CD45-                                 |abnormal |    0|
|CD45+                                 |abnormal |    0|
|Classical monocytes (CD16- CD14+)     |abnormal |    4|
|DC (HLA-DR+)                          |abnormal |    0|
|DC NK (CD20- CD14-)                   |abnormal |    0|
|DC NK MONOCYTES (CD3- CD19-)          |abnormal |    0|
|HLA-DR+                               |abnormal |    0|
|Live immune cells (CD45+ PE-)         |abnormal |    0|
|Live Single immune cells(FSC-H_FSC-W) |abnormal |    0|
|Live Single PBMCs (SSC-A_FSC-A)       |abnormal |    0|
|NK CD56LO                             |abnormal |    0|
|CD14-                                 |good     |    0|
|CD45-                                 |good     |    0|
|CD45+                                 |good     |    0|
|Classical monocytes (CD16- CD14+)     |good     |    0|
|DC (HLA-DR+)                          |good     |    0|
|DC NK (CD20- CD14-)                   |good     |    0|
|DC NK MONOCYTES (CD3- CD19-)          |good     |    0|
|HLA-DR+                               |good     |    0|
|Live immune cells (CD45+ PE-)         |good     |    0|
|Live Single immune cells(FSC-H_FSC-W) |good     |    0|
|Live Single PBMCs (SSC-A_FSC-A)       |good     |    1|
|NK CD56LO                             |good     |    0|
|CD14-                                 |Good     |    1|
|CD45-                                 |Good     |    0|
|CD45+                                 |Good     |    0|
|Classical monocytes (CD16- CD14+)     |Good     |    0|
|DC (HLA-DR+)                          |Good     |    0|
|DC NK (CD20- CD14-)                   |Good     |    0|
|DC NK MONOCYTES (CD3- CD19-)          |Good     |    0|
|HLA-DR+                               |Good     |    0|
|Live immune cells (CD45+ PE-)         |Good     |    0|
|Live Single immune cells(FSC-H_FSC-W) |Good     |    0|
|Live Single PBMCs (SSC-A_FSC-A)       |Good     |    0|
|NK CD56LO                             |Good     |    0|
|CD14-                                 |manual   |  133|
|CD45-                                 |manual   |    1|
|CD45+                                 |manual   |   24|
|Classical monocytes (CD16- CD14+)     |manual   |  318|
|DC (HLA-DR+)                          |manual   |   69|
|DC NK (CD20- CD14-)                   |manual   |   41|
|DC NK MONOCYTES (CD3- CD19-)          |manual   |  135|
|HLA-DR+                               |manual   |    1|
|Live immune cells (CD45+ PE-)         |manual   |   30|
|Live Single immune cells(FSC-H_FSC-W) |manual   |   66|
|Live Single PBMCs (SSC-A_FSC-A)       |manual   |  134|
|NK CD56LO                             |manual   |  300|

