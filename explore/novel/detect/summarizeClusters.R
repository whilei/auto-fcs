











summarize <-
  function(phenoGraphClusters, knownPopulations) {
    phenoColumn = colnames(phenoGraphClusters)
    knownColumns = colnames(knownPopulations)
    combo = cbind(phenoGraphClusters, knownPopulations)
    combo = combo[which(combo[, phenoColumn] >= 0), ]
    phenoClusts = sort(unique(combo[, phenoColumn]))
    summary = data.frame(KNOWN_POPULATION = knownColumns)

    
    for (phenoClust in phenoClusts) {
      tmp = data.frame()
      
      for (knownPop in knownColumns) {
        sub = combo[which(combo[, phenoColumn] == phenoClust), ]
        counts = as.data.frame(table(sub[, phenoColumn], sub[, knownPop]))
        counts$KNOWN_POPULATION=knownPop
        counts = counts[, c("KNOWN_POPULATION","Freq")]
        colnames(counts) = c("KNOWN_POPULATION", paste0("CLUSTER_",phenoClust,"_COUNT"))
        tmp = rbind(tmp, counts)
      }
      summary = cbind(tmp, summary)
    }
    
    summary$TOTAL_KNOWN = 0
    summary$TOTAL_PHENOGRAPH = 0
    
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