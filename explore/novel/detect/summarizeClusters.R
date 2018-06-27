
summarize <-
  function(phenoGraphClusters, knownPopulations) {
    phenoColumn = colnames(phenoGraphClusters)
    knownColumns = colnames(knownPopulations)
    combo = cbind(phenoGraphClusters, knownPopulations)
    combo = combo[which(combo[, phenoColumn] >= 0), ]
    phenoClusts = sort(unique(combo[, phenoColumn]))
    summary = as.data.frame(table(combo))
    
    for(known in knownColumns){
      summary[,known]=as.logical(summary[,known])
    }
    

    summary$POP_NAMES_SUB=NA
    summary[which(summary$CYTO_T&summary$effector.memory),]$POP_NAMES_SUB="effector memory"
    summary[which(summary$CYTO_T&summary$naive),]$POP_NAMES_SUB="naive"
    summary[which(summary$CYTO_T&summary$central.memory),]$POP_NAMES_SUB="central memory"
    summary[which(summary$CYTO_T&summary$effector),]$POP_NAMES_SUB="effector"
    
    
    summary$POP_NAMES_SUB_SUB=NA
    summary[which(summary$CYTO_T&summary$effector&summary$CD28M_CD27M),]$POP_NAMES_SUB_SUB="E"
    summary[which(summary$CYTO_T&summary$effector&summary$CD28M_CD27P),]$POP_NAMES_SUB_SUB="pE2"
    summary[which(summary$CYTO_T&summary$effector&summary$CD28P_CD27P),]$POP_NAMES_SUB_SUB="pE1"
    summary[which(summary$CYTO_T&summary$effector&summary$CD28P_CD27M),]$POP_NAMES_SUB_SUB="CD28P_27M"
    
    
    summary[which(summary$CYTO_T&summary$effector.memory&summary$CD28M_CD27M),]$POP_NAMES_SUB_SUB="EM3"
    summary[which(summary$CYTO_T&summary$effector.memory&summary$CD28M_CD27P),]$POP_NAMES_SUB_SUB="EM2"
    summary[which(summary$CYTO_T&summary$effector.memory&summary$CD28P_CD27P),]$POP_NAMES_SUB_SUB="EM1"
    summary[which(summary$CYTO_T&summary$effector.memory&summary$CD28P_CD27M),]$POP_NAMES_SUB_SUB="EM4"
    summary=summary[which(!is.na(summary$POP_NAMES_SUB)),]
    
    
    totalPhenograph=as.data.frame(table(combo[,phenoColumn]))
    totalPhenograph$PHENOGRAPH_CLUSTER=as.character(totalPhenograph$Var1)
    totalPhenograph$TOTAL_PHENOGRAPH_COUNTS=totalPhenograph$Freq
    totalPhenograph=totalPhenograph[,c("PHENOGRAPH_CLUSTER","TOTAL_PHENOGRAPH_COUNTS")]
    summary$cytotoxic.Tcells.CD8.=as.character(summary$cytotoxic.Tcells.CD8.)
    
    summary=merge(summary,totalPhenograph,by.y="PHENOGRAPH_CLUSTER",by.x="cytotoxic.Tcells.CD8.")
    
    
    
    
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