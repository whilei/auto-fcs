





summarize <-
  function(phenoGraphClusters, knownPopulations) {
    phenoColumn = colnames(phenoGraphClusters)
    knownColumns = colnames(knownPopulations)
    combo = cbind(phenoGraphClusters, knownPopulations)
    
    
    for (knownPop in knownColumns) {
      counts = as.data.frame(table(combo[, phenoColumn], combo[, knownPop]))
      print(counts)
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