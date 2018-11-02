
library(ClusterR)
library(cytofkit)

setwd("/Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/")
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

mapFull=read.delim("/Volumes/Beta/data/flow/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/all.totalCellCounts.metrics.format.txt",
                   stringsAsFactors = FALSE,
                   header = TRUE)

map=mapFull  
# lsr =map[which(map$MACHINE=="LSR"),]   
map =map[which(map$PANEL=="panel1"),]
map=map[,c("FILE","TOTAL_COUNTS","PANEL","MACHINE","EXPERIMENTER","LAB_ID")]
# map =map[which(!is.na(map$LAB_ID)),]

summary = read.delim(
  "/Volumes/Beta2/flow/testSummaryLymph/allSummaries.txt" ,
  stringsAsFactors = FALSE,
  header = TRUE,check.names = FALSE
)


summary$SAMPLE = summary$SAMPLE_RAW_CENTROID
summary$SANITIZE_NAME = gsub(" ", "_", summary$SAMPLE)

summary=merge(summary,map,by.x ="SAMPLE",by.y ="FILE",all.x = TRUE)

# summary$MANUAL_ANNOTATION = 

summary = summary[!(summary$SANITIZE_NAME %in% manuals$V1),]

summary$CTL = gsub(".*Ctl-|.*CTL-|.*Ctl_|.*Clt-|.*Ctl|.*Ctl- |.*Ctl ",
                   "",
                   summary$SAMPLE)
summary$CTL = gsub("_.*", "", summary$CTL)
summary$CTL = gsub(" .*", "", summary$CTL)
summary$CTL=gsub("-.*", "", summary$CTL)

summary$CTL=gsub("2016", "STUDY_SAMPLE", summary$CTL)
summary$CTL=gsub("2017", "STUDY_SAMPLE", summary$CTL)
summary$CTL=gsub("Specimen", "Specimen", summary$CTL)

ctls=c("A","B","C","D","E","F","G","H")
# summary = summary[order(summary$CTL), ]
use=(!is.na(summary$LAB_ID) |summary$CTL %in% ctls)
summary=summary[use,]
# summary=summary[1:10000,]


summary=summary[which(summary$MACHINE=="LSR"),]






## Meta Phenograph +Meta tsne

type="_SCALED_CENTROID"
sub = summary[, paste0(markersToCluster, type)]
colnames(sub) = markersToCluster
clustFile= paste0("clusterPhenograph",type,".RData")
tsneFile=paste0("tsne",type,".RData")

clusterPhenograph = cytof_cluster(xdata = sub, method = "Rphenograph")
tsne <- cytof_dimReduction(data=sub, method = "tsne",out_dim = 2)

summary$META_CLUSTER =clusterPhenograph
# summary$META_CLUSTER =as.numeric(summary$META_CLUSTER )
summary$metaTsne1=tsne[,1]
summary$metaTsne2 = tsne[, 2]

gz1 <- gzfile(paste0("summary.gz"), "w")
write.table(
  summary,
  file = gz1 ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)
close(gz1)

cols=data.frame(COLUMN=colnames(summary))
rownames(cols)=cols$COLUMN
cols$DESCRIPTION="NA"

for(pop in populations){
  popForm=pop
  # gsub("."," ",pop,fixed = TRUE)
  cols[popForm,"DESCRIPTION"] = paste0("Count of ",pop, " events in this phenograph cluster")
  
  popTFreq=paste0(popForm,"_TotalFreq")
  cols[popTFreq,"DESCRIPTION"] = paste0("Proportion of events in this phenograph cluster out of all events in  ",pop)
  
  popCFreq=paste0(popForm,"_ClusterFreq")
  cols[popCFreq,"DESCRIPTION"] = paste0("Frequency of population ",pop, " in this phenograph cluster")
  
}

for(marker in markersToCluster){
  mraw = paste0(marker, "_RAW_CENTROID")
  cols[mraw, "DESCRIPTION"] = paste0(
    "Median raw (but after compensating/logicle transform) expression of ",
    marker,
    "in this phenograph cluster"
  )
  
  mscale = paste0(marker, "_SCALED_CENTROID")
  cols[mscale, "DESCRIPTION"] = paste0(
    "Median scaled (after compensating/logicle transform and normalizing) expression of ",
    marker,
    "in this phenograph cluster"
  )
}

cols["PHENOGRAPH_CLUSTER","DESCRIPTION"]="Phenograph cluster for the sample"
cols["TOTAL_PHENOGRAPH_COUNTS","DESCRIPTION"]="Total events in sample's phenograph cluster"
cols["SAMPLE_SCALED_CENTROID","DESCRIPTION"]="Sample used for centroids (just a check)"
cols["SAMPLE_RAW_CENTROID","DESCRIPTION"]="Sample used for centroids (just a check)"
cols["SAMPLE_RAW_CENTROID","DESCRIPTION"]="Sample used for centroids (just a check)"
cols["SAMPLE","DESCRIPTION"]="Sample name"
cols["SANITIZE_NAME","DESCRIPTION"]="Sample with spaces replaced with _"
cols["CTL","DESCRIPTION"]="Which control this sample is"
cols["META_CLUSTER","DESCRIPTION"]="The phenograph meta-cluster this sample belongs to"
cols["metaTsne1","DESCRIPTION"]="Meta-tsne diminsion 1"
cols["metaTsne2","DESCRIPTION"]="Meta-tsne diminsion 2"
cols["TOTAL_COUNTS","DESCRIPTION"]="Total events in fcs file"
cols["PANEL","DESCRIPTION"]="flow panel"
cols["MACHINE","DESCRIPTION"]="LSR or FORTESSA"
cols["EXPERIMENTER","DESCRIPTION"]="EXPERIMENTER"
cols["LAB_ID","DESCRIPTION"]="LAB ID for this sample"


write.table(
  cols,
  file = "summary.columns" ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

metaMap =summary[,c("SAMPLE","PHENOGRAPH_CLUSTER","META_CLUSTER")]

write.table(
  metaMap,
  file = "summary.metaMap" ,
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)

metaMapSub=metaMap[metaMap$META_CLUSTER %in% subs,]

write.table(
  metaMapSub,
  file = paste0("subs_",paste0(subs,collapse="_"),"_summary.naive.interest.metaMap" ),
  sep = "\t",
  quote = FALSE,
  row.names = FALSE
)


require(openxlsx)
list_of_datasets <- list("DATA_DICTIONARY" = cols, "SUMMARY" = summary,"META_MAP"=metaMap)
write.xlsx(list_of_datasets, file = "summary.xlsx")

save(summary,file ="summary.meta.RData")




