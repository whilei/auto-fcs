


library(ClusterR)
library(cytofkit)
library(reshape2)

setwd("/Users/Kitty/git/auto-fcs/explore/novel/metaReport/")
theme_set(theme_bw(15))

markersToCluster = c("CD27",
                     "CD28",
                     "CD95",
                     "CCR7",
                     "CD45RA",
                     "CD8",
                     "CD4",
                     "CD3",
                     "CD19",
                     "IgD",
                     "HLA.DR")

populations =    c(
  "central.memory",
  "naive",
  "effector.memory",
  "EM1",
  "EM2",
  "EM3",
  "EM4",
  "effector",
  "E",
  "pE1",
  "pE2",
  "CD28P_27M"
)

markersToCluster = rev(markersToCluster)



manuals = read.delim(
  "/Volumes/Beta/data/flow/kmeansValidateResults/results_r26_TcellSubs_Kmeans_wsp_v8/r26_v3_Manual_Samples.txt",
  stringsAsFactors = FALSE,
  header = FALSE
)

mapFull = read.delim(
  "/Volumes/Beta/data/flow/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/all.totalCellCounts.metrics.format.txt",
  stringsAsFactors = FALSE,
  header = TRUE
)

map = mapFull
map = map[which(map$PANEL == "panel1"),]
map = map[, c("FILE",
              "TOTAL_COUNTS",
              "PANEL",
              "MACHINE",
              "EXPERIMENTER",
              "LAB_ID")]

summary = read.delim(
  "/Volumes/Beta2/flow/detect_NoNorm_v6_lymph_Mem_summary/allSummaries.txt" ,
  stringsAsFactors = FALSE,
  header = TRUE,
  check.names = FALSE
)

# summary=summary[1:5000,]



summary$SAMPLE = summary$SAMPLE_RAW_CENTROID
summary$SANITIZE_NAME = gsub(" ", "_", summary$SAMPLE)

summary = merge(summary,
                map,
                by.x = "SAMPLE",
                by.y = "FILE",
                all.x = TRUE)


summary = summary[!(summary$SANITIZE_NAME %in% manuals$V1),]

summary$CTL = gsub(".*Ctl-|.*CTL-|.*Ctl_|.*Clt-|.*Ctl|.*Ctl- |.*Ctl ",
                   "",
                   summary$SAMPLE)
summary$CTL = gsub("_.*", "", summary$CTL)
summary$CTL = gsub(" .*", "", summary$CTL)
summary$CTL = gsub("-.*", "", summary$CTL)

summary$CTL = gsub("2016", "STUDY_SAMPLE", summary$CTL)
summary$CTL = gsub("2017", "STUDY_SAMPLE", summary$CTL)
summary$CTL = gsub("Specimen", "Specimen", summary$CTL)

ctls = c("A", "B", "C", "D", "E", "F", "G", "H")
use = (!is.na(summary$LAB_ID) | summary$CTL %in% ctls)
summary = summary[use,]


summary = summary[which(summary$MACHINE == "LSR"),]






## Meta Phenograph +Meta tsne

type = "_SCALED_CENTROID"
print(paste0("using tsne type ", type))
sub = summary[, paste0(markersToCluster, type)]
colnames(sub) = markersToCluster
clustFile = paste0("clusterPhenograph", type, ".RData")
tsneFile = paste0("tsne", type, ".RData")

clusterPhenograph = cytof_cluster(xdata = sub, method = "Rphenograph")
tsne <- cytof_dimReduction(data = sub,
                           method = "tsne",
                           out_dim = 2)

summary$META_CLUSTER = clusterPhenograph
summary$metaTsne1 = tsne[, 1]
summary$metaTsne2 = tsne[, 2]



nms = names(summary)
metaName = nms[grepl(pattern = "_BASE_MINUS_CLUST", nms)]
metaName = metaName[!grepl(pattern = "RAW", metaName)]
metaName = metaName[!grepl(pattern = "MEM_LABEL", metaName)]

metaMEM = aggregate(summary[, metaName],
                    list(summary$META_CLUSTER),
                    median, na.rm = TRUE)




# markersMEM=gsub("MEM_","",nms)
# markersMEM=gsub("_BASE_MINUS_CLUST","",markersMEM)



metaMEMMelt = melt(data = metaMEM, id.vars = "Group.1")
metaMEMMelt$MARKER = gsub("MEM_", "", metaMEMMelt$variable)
metaMEMMelt$MARKER = gsub("_BASE_MINUS_CLUST", "", metaMEMMelt$MARKER)
metaMEMMelt$MEM_ROUND = round(metaMEMMelt$value)
addPlus = metaMEMMelt$MEM_ROUND >= 0
metaMEMMelt$MEM_ROUND[addPlus] = paste0("+", metaMEMMelt$MEM_ROUND[addPlus])
metaMEMMelt$MEM_LABEL = paste0(metaMEMMelt$MARKER, metaMEMMelt$MEM_ROUND)
metaMEMMeltSub = metaMEMMelt[which(abs(round(metaMEMMelt$value)) >= 2), ]
metaMEMMeltSub = metaMEMMeltSub[order(metaMEMMeltSub$value), ]
metaMEMMeltSubCast = dcast(
  data = metaMEMMeltSub,
  formula = Group.1 ~ 1,
  fun.aggregate = toString,
  value.var = "MEM_LABEL"
)

colnames(metaMEMMeltSubCast) = paste0("META_MEM_LABEL", colnames(metaMEMMeltSubCast))

colnames(metaMEM) = paste0("META_", colnames(metaMEM))


metaMEM = merge(
  metaMEM,
  metaMEMMeltSubCast,
  by.x = "META_Group.1",
  by.y = "META_MEM_LABELGroup.1",
  all.x = TRUE
)
colnames(metaMEM)[1]="META_CLUSTER"

gz1 <- gzfile(paste0("summary.meta.mem.gz"), "w")
write.table(
  metaMEM,
  file = gz1 ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)
close(gz1)

summary = merge(summary,
                metaMEM,
                by.x = "META_CLUSTER",
                by.y = "META_Group.1",
                all.x = TRUE)


gz1 <- gzfile(paste0("summary.gz"), "w")
write.table(
  summary,
  file = gz1 ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)
close(gz1)

cols = data.frame(COLUMN = colnames(summary))
rownames(cols) = cols$COLUMN
cols$DESCRIPTION = "NA"


tmp = data.frame(
  COLUMN = "-population name-",
  DESCRIPTION = paste0("Count of  events in this phenograph cluster")
)
cols = rbind(cols, tmp)
tmp = data.frame(
  COLUMN = "*_TotalFreq",
  DESCRIPTION = paste0(
    "Proportion of events in this phenograph cluster out of all events in the population"
  )
)
cols = rbind(cols, tmp)

tmp = data.frame(
  COLUMN = "*_ClusterFreq",
  DESCRIPTION = paste0("Frequency of population in this phenograph cluster")
)
cols = rbind(cols, tmp)

tmp = data.frame(
  COLUMN = "*_RAW_CENTROID",
  DESCRIPTION = paste0(
    "Median raw (but after compensating/logicle transform) expression of marker
    marker in this phenograph cluster"
  )
  )
cols = rbind(cols, tmp)


tmp = data.frame(
  COLUMN = "*_SCALED_CENTROID",
  DESCRIPTION = paste0(
    "Median scaled (after compensating/logicle transform and normalizing) expression of
    marker in this phenograph cluster"
  )
  )
cols = rbind(cols, tmp)


tmp = data.frame(
  COLUMN = "*_SCALED_CENTROID",
  DESCRIPTION = paste0(
    "Median scaled (after compensating/logicle transform and normalizing) expression of
    marker in this phenograph cluster"
  )
  )
cols = rbind(cols, tmp)


tmp = data.frame(
  COLUMN = "MEM_RAW*_BASE_MINUS_CLUST",
  DESCRIPTION = paste0(
    "MEM score computed using method a from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf"
  )
)
cols = rbind(cols, tmp)

tmp = data.frame(
  COLUMN = "MEM*_BASE_MINUS_CLUST",
  DESCRIPTION = paste0(
    "MEM score computed using method a from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf"
  )
)
cols = rbind(cols, tmp)
tmp = data.frame(
  COLUMN = "META_MEM*_BASE_MINUS_CLUST",
  DESCRIPTION = paste0(
    "Meta cluster median MEM score computed using method a from https://media.nature.com/original/nature-assets/nmeth/journal/v14/n3/extref/nmeth.4149-S1.pdf"
  )
)
cols = rbind(cols, tmp)



cols["PHENOGRAPH_CLUSTER", "DESCRIPTION"] = "Phenograph cluster for the sample"
cols["TOTAL_PHENOGRAPH_COUNTS", "DESCRIPTION"] = "Total events in sample's phenograph cluster"
cols["SAMPLE_SCALED_CENTROID", "DESCRIPTION"] = "Sample used for centroids (just a check)"
cols["SAMPLE_RAW_CENTROID", "DESCRIPTION"] = "Sample used for centroids (just a check)"
cols["SAMPLE_RAW_CENTROID", "DESCRIPTION"] = "Sample used for centroids (just a check)"
cols["SAMPLE", "DESCRIPTION"] = "Sample name"
cols["SANITIZE_NAME", "DESCRIPTION"] = "Sample with spaces replaced with _"
cols["CTL", "DESCRIPTION"] = "Which control this sample is"
cols["META_CLUSTER", "DESCRIPTION"] = "The phenograph meta-cluster this sample belongs to"
cols["metaTsne1", "DESCRIPTION"] = "Meta-tsne diminsion 1"
cols["metaTsne2", "DESCRIPTION"] = "Meta-tsne diminsion 2"
cols["TOTAL_COUNTS", "DESCRIPTION"] = "Total events in fcs file"
cols["PANEL", "DESCRIPTION"] = "flow panel"
cols["MACHINE", "DESCRIPTION"] = "LSR or FORTESSA"
cols["EXPERIMENTER", "DESCRIPTION"] = "EXPERIMENTER"
cols["LAB_ID", "DESCRIPTION"] = "LAB ID for this sample"

cols = cols[which(cols$DESCRIPTION != "NA"), ]
write.table(
  cols,
  file = "summary.columns" ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

metaMap = summary[, c("SAMPLE", "PHENOGRAPH_CLUSTER", "META_CLUSTER")]

write.table(
  metaMap,
  file = "summary.metaMap" ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

# load("/Users/Kitty/git/auto-fcs/explore/novel/metaReport/summary.meta.RData")

metaScaled = aggregate( summary[, paste0(markersToCluster, "_SCALED_CENTROID")],
                        list(summary$META_CLUSTER),
                        median, na.rm = TRUE)
colnames(metaScaled)[1]="META_CLUSTER"

write.table(
  metaScaled,
  file = "summary.metaScaled" ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

metaRaw = aggregate( summary[, paste0(markersToCluster, "_RAW_CENTROID")],
                        list(summary$META_CLUSTER),
                        median, na.rm = TRUE)

colnames(metaRaw)[1]="META_CLUSTER"

write.table(
  metaRaw,
  file = "summary.metaRaw" ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

require(openxlsx)
list_of_datasets <-
  list(
    "DATA_DICTIONARY" = cols,
    "META_MEM_SUMMARY" = metaMEM,
    "META_SCALE_SUMMARY" = metaScaled,
    "META_RAW_SUMMARY" = metaRaw,
    "FULL_SUMMARY" = summary,
    "META_MAP" = metaMap
  )
write.xlsx(list_of_datasets, file = "summary.xlsx")
save(list_of_datasets, file = "summary.data.list.meta.RData")

save(summary, file = "summary.meta.RData")
