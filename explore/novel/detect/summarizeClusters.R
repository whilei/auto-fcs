
summarize <-
  function(phenoGraphClusters, knownPopulations) {
    phenoColumn = colnames(phenoGraphClusters)
    knownColumns = colnames(knownPopulations)
    combo = cbind(phenoGraphClusters, knownPopulations)
    combo = combo[which(combo[, phenoColumn] >= 0), ]
    phenoClusts = sort(unique(combo[, phenoColumn]))
    
    combo$POP_NAMES_SUB=NA
    combo[which(combo$CYTO_T&combo$effector.memory),]$POP_NAMES_SUB="effector memory"
    combo[which(combo$CYTO_T&combo$naive),]$POP_NAMES_SUB="naive"
    combo[which(combo$CYTO_T&combo$central.memory),]$POP_NAMES_SUB="central memory"
    combo[which(combo$CYTO_T&combo$effector),]$POP_NAMES_SUB="effector"
    
    
    combo$POP_NAMES_SUB_SUB=NA
    combo[which(combo$CYTO_T&combo$effector&combo$CD28M_CD27M),]$POP_NAMES_SUB_SUB="E"
    combo[which(combo$CYTO_T&combo$effector&combo$CD28M_CD27P),]$POP_NAMES_SUB_SUB="pE2"
    combo[which(combo$CYTO_T&combo$effector&combo$CD28P_CD27P),]$POP_NAMES_SUB_SUB="pE1"
    combo[which(combo$CYTO_T&combo$effector&combo$CD28P_CD27M),]$POP_NAMES_SUB_SUB="CD28P_27M"
    
    
    combo[which(combo$CYTO_T&combo$effector.memory&combo$CD28M_CD27M),]$POP_NAMES_SUB_SUB="EM3"
    combo[which(combo$CYTO_T&combo$effector.memory&combo$CD28M_CD27P),]$POP_NAMES_SUB_SUB="EM2"
    combo[which(combo$CYTO_T&combo$effector.memory&combo$CD28P_CD27P),]$POP_NAMES_SUB_SUB="EM1"
    combo[which(combo$CYTO_T&combo$effector.memory&combo$CD28P_CD27M),]$POP_NAMES_SUB_SUB="EM4"
    combo=combo[which(!is.na(combo$POP_NAMES_SUB)),]
    
    
    subInterest=c("POP_NAMES_SUB","POP_NAMES_SUB_SUB")
    combo=combo[,c(phenoColumn,subInterest)]
    summary = as.data.frame(table(combo))
    
    for(known in subInterest){
      summary[,known]=as.character(summary[,known])
    }
    

    
    
    
    totalPhenograph=as.data.frame(table(combo[,phenoColumn]))
    totalPhenograph$PHENOGRAPH_CLUSTER=as.character(totalPhenograph$Var1)
    totalPhenograph$TOTAL_PHENOGRAPH_COUNTS=totalPhenograph$Freq
    totalPhenograph=totalPhenograph[,c("PHENOGRAPH_CLUSTER","TOTAL_PHENOGRAPH_COUNTS")]
    summary$cytotoxic.Tcells.CD8.=as.character(summary$cytotoxic.Tcells.CD8.)
    
    summary=merge(summary,totalPhenograph,by.y="PHENOGRAPH_CLUSTER",by.x="cytotoxic.Tcells.CD8.")
    summary$FREQ_TOTAL=summary$Freq/summary$TOTAL_PHENOGRAPH_COUNTS
    
    freqSub=sort(unique(summary$POP_NAMES_SUB))
    freqSubSub=sort(unique(summary$POP_NAMES_SUB_SUB))
    
    summaryFreq= data.frame(PHENOGRAPH_CLUSTER=totalPhenograph$PHENOGRAPH_CLUSTER,TOTAL_PHENOGRAPH_COUNTS=totalPhenograph$TOTAL_PHENOGRAPH_COUNTS)
    
    
    for(sub in freqSub){
      tmp=summary[which(summary$POP_NAMES_SUB==sub),]
      print(length(tmp$POP_NAMES_SUB))
    }
    
  }


intclusts = list.files("/Volumes/Beta2/flow/testSync/",
                       full.names = TRUE,
                       pattern = ".IntMatrix.txt.gz$")
for (file in intclusts) {
  knownPopulationFile = gsub("_subFirst_TRUE_normalize_FALSE.IntMatrix.txt.gz",
                             ".boolMatrix.txt.gz",
                             file)
  
  if (file.exists(knownPopulationFile)) {
    knownPopulations = read.delim(knownPopulationFile ,
                                  stringsAsFactors = FALSE,
                                  header = TRUE)
    phenoGraphClusters = read.delim(file ,
                                    stringsAsFactors = FALSE,
                                    header = TRUE)
    
    summarize(phenoGraphClusters = phenoGraphClusters,
              knownPopulations = knownPopulations)
  }
  
}