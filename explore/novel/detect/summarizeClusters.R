











library(optparse)
option_list = list(
  make_option(
    c("-dir", "--inputDirectory"),
    type = "character",
    help = "input directory",
    metavar = "character",
    default = "/Volumes/Beta2/flow/testSync/"
  ),
  make_option(
    c("-o", "--outputDir"),
    type = "character",
    help = "output directory",
    metavar = "character",
    default = "/Volumes/Beta2/flow/testSummary/"
  )
)


opt_parser = OptionParser(option_list = option_list)

opt = parse_args(opt_parser)
outDir = opt$outputDir
dir.create(outDir)
summarize <-
  function(phenoGraphClusters, knownPopulations) {
    phenoColumn = colnames(phenoGraphClusters)
    knownColumns = colnames(knownPopulations)
    combo = cbind(phenoGraphClusters, knownPopulations)
    combo = combo[which(combo[, phenoColumn] >= 0),]
    phenoClusts = sort(unique(combo[, phenoColumn]))
    
    combo$POP_NAMES_SUB = NA
    if (length(combo[which(combo$CYTO_T &
                           combo$effector.memory), ]$POP_NAMES_SUB) > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector.memory), ]$POP_NAMES_SUB = "effector memory"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$naive), ]$POP_NAMES_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$naive), ]$POP_NAMES_SUB = "naive"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$central.memory), ]$POP_NAMES_SUB) > 0) {
      combo[which(combo$CYTO_T &
                    combo$central.memory), ]$POP_NAMES_SUB = "central memory"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector), ]$POP_NAMES_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector), ]$POP_NAMES_SUB = "effector"
    }
    
    
    combo$POP_NAMES_SUB_SUB = NA
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector &
                           combo$CD28M_CD27M), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector &
                    combo$CD28M_CD27M), ]$POP_NAMES_SUB_SUB = "E"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector &
                           combo$CD28M_CD27P), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector &
                    combo$CD28M_CD27P), ]$POP_NAMES_SUB_SUB = "pE2"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector &
                           combo$CD28P_CD27P), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector &
                    combo$CD28P_CD27P), ]$POP_NAMES_SUB_SUB = "pE1"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector &
                           combo$CD28P_CD27M), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector &
                    combo$CD28P_CD27M), ]$POP_NAMES_SUB_SUB = "CD28P_27M"
      
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector.memory &
                           combo$CD28M_CD27M), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector.memory &
                    combo$CD28M_CD27M), ]$POP_NAMES_SUB_SUB = "EM3"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector.memory &
                           combo$CD28M_CD27P), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector.memory &
                    combo$CD28M_CD27P), ]$POP_NAMES_SUB_SUB = "EM2"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector.memory &
                           combo$CD28P_CD27P), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector.memory &
                    combo$CD28P_CD27P), ]$POP_NAMES_SUB_SUB = "EM1"
    }
    
    if (length(combo[which(combo$CYTO_T &
                           combo$effector.memory &
                           combo$CD28P_CD27M), ]$POP_NAMES_SUB_SUB)  > 0) {
      combo[which(combo$CYTO_T &
                    combo$effector.memory &
                    combo$CD28P_CD27M), ]$POP_NAMES_SUB_SUB = "EM4"
      
    }
    
    
    combo = combo[which(!is.na(combo$POP_NAMES_SUB)), ]
    
    
    subInterest = c("POP_NAMES_SUB", "POP_NAMES_SUB_SUB")
    combo = combo[, c(phenoColumn, subInterest)]
    summarySUB = as.data.frame.matrix(table(combo$cytotoxic.Tcells.CD8., combo$POP_NAMES_SUB))
    summarySUB_SUB = as.data.frame.matrix(table(combo$cytotoxic.Tcells.CD8., combo$POP_NAMES_SUB_SUB))
    summary = cbind(summarySUB, summarySUB_SUB)
    
    summary$PHENOGRAPH_CLUSTER = row.names(summary)
    
    
    
    totalPhenograph = as.data.frame(table(combo[, phenoColumn]))
    totalPhenograph$PHENOGRAPH_CLUSTER = as.character(totalPhenograph$Var1)
    totalPhenograph$TOTAL_PHENOGRAPH_COUNTS = totalPhenograph$Freq
    totalPhenograph = totalPhenograph[, c("PHENOGRAPH_CLUSTER", "TOTAL_PHENOGRAPH_COUNTS")]
    
    summary = merge(summary, totalPhenograph, by.y = "PHENOGRAPH_CLUSTER", by.x =
                      "PHENOGRAPH_CLUSTER")
    
    rownames(summary) = summary$PHENOGRAPH_CLUSTER
    uniqSub = unique(combo$POP_NAMES_SUB)
    for (sub in uniqSub) {
      totalFreq = data.frame(FREQ = summary[, c(sub)])
      rownames(totalFreq) = as.numeric(summary$PHENOGRAPH_CLUSTER)
      clusts = as.character(unique(summary$PHENOGRAPH_CLUSTER))
      for (clust in clusts) {
        totalFreq[clust, "FREQ"] = totalFreq[clust, "FREQ"] / sum(summarySUB[, c(sub)])
      }
      colnames(totalFreq) = c(paste0(sub, "_TotalFreq"))
      summary = cbind(summary, totalFreq)
    }
    
    uniqSubSub = unique(combo$POP_NAMES_SUB_SUB)
    uniqSubSub = uniqSubSub[(!is.na(uniqSubSub))]
    for (sub in uniqSubSub) {
      totalFreq = data.frame(FREQ = summary[, c(sub)])
      rownames(totalFreq) = as.numeric(summary$PHENOGRAPH_CLUSTER)
      clusts = as.character(unique(summary$PHENOGRAPH_CLUSTER))
      for (clust in clusts) {
        totalFreq[clust, "FREQ"] = totalFreq[clust, "FREQ"] / sum(summarySUB_SUB[, c(sub)])
      }
      colnames(totalFreq) = c(paste0(sub, "_TotalFreq"))
      summary = cbind(summary, totalFreq)
    }
    
    
    allPops = c(uniqSub, uniqSubSub)
    for (pop in allPops) {
      tmpPop = data.frame(FREQ = summary[, pop] / summary$TOTAL_PHENOGRAPH_COUNTS)
      colnames(tmpPop) = c(paste0(pop, "_ClusterFreq"))
      summary = cbind(summary, tmpPop)
    }
    
    return(summary)
    
  }

print(opt$inputDirectory)

intclusts = list.files(opt$inputDirectory,
                       full.names = TRUE,
                       pattern = ".IntMatrix.txt.gz$")

for (file in intclusts) {
  print(file)
  knownPopulationFile = gsub(".IntMatrix.txt.gz",
                             ".boolMatrix.txt.gz",
                             file)
  
  fullOCPopFile = gsub(".IntMatrix.txt.gz",
                       ".OC.POP.matrix.txt.gz",
                       file)

  if (file.exists(knownPopulationFile) & file.exists(fullOCPopFile)) {
    print(knownPopulationFile)
    print(fullOCPopFile)
    
    print(paste0("summarizing clusters from ", file, "to ", outDir))
    knownPopulations = read.delim(knownPopulationFile ,
                                  stringsAsFactors = FALSE,
                                  header = TRUE)
    print(paste0("Pop N ", length(knownPopulations[,1]), "in  ", knownPopulationFile))
    
    fullOCPopulations = read.delim(fullOCPopFile ,
                                   stringsAsFactors = FALSE,
                                   header = TRUE)
    print(paste0("Pop N ", length(fullOCPopulations[,1]), "in  ", fullOCPopFile))
    
    phenoGraphClusters = read.delim(file ,
                                    stringsAsFactors = FALSE,
                                    header = TRUE)
    
    summary = summarize(phenoGraphClusters = phenoGraphClusters,
                        knownPopulations = knownPopulations)
    
    inputCentsFile = gsub(
      "_subFirst_TRUE_normalize_FALSE.IntMatrix.txt.gz",
      "_subFirst_TRUE_normalize_FALSE.cents.inputData",
      file
    )
    inputCents = read.delim(inputCentsFile ,
                            stringsAsFactors = FALSE,
                            header = TRUE)
    colnames(inputCents) = paste0(colnames(inputCents), "_RAW_CENTROID")
    summary = merge(
      summary,
      inputCents,
      by.x = "PHENOGRAPH_CLUSTER",
      by.y = "Group.1_RAW_CENTROID",
      all.x = TRUE
    )
    
    scaleCentsFile = gsub(
      "_subFirst_TRUE_normalize_FALSE.IntMatrix.txt.gz",
      "_subFirst_TRUE_normalize_FALSE.cents.scale",
      file
    )
    scaleCents = read.delim(scaleCentsFile ,
                            stringsAsFactors = FALSE,
                            header = TRUE)
    colnames(scaleCents) = paste0(colnames(scaleCents), "_SCALED_CENTROID")
    summary = merge(
      summary,
      scaleCents,
      by.x = "PHENOGRAPH_CLUSTER",
      by.y = "Group.1_SCALED_CENTROID",
      all.x = TRUE
    )
    
    
    write.table(
      summary,
      file = paste0(
        outDir,
        gsub(".IntMatrix.txt.gz",
             ".known.pops.txt", basename(file))
      ),
      row.names = FALSE,
      quote = FALSE,
      sep = "\t",
      col.names = TRUE
    )
    print(paste0("finished summarizing clusters from ", file))
    
  }
  
}


allSummariesFiles = list.files(outDir,
                               full.names = TRUE,
                               pattern = ".known.pops.txt$")

base = colnames(read.delim(allSummariesFiles[[1]]))

allSummaries = data.frame()
for (summaryFile in allSummariesFiles) {
  tmp = read.delim(summaryFile ,
                   stringsAsFactors = FALSE,
                   header = TRUE)
  Missing <-
    setdiff(base, names(tmp))  # Find names of missing columns
  tmp[Missing] <- 0                    # Add them, filled with '0's
  tmp <- tmp[base]
  allSummaries = rbind(allSummaries, tmp)
}

write.table(
  allSummaries,
  file = paste0(outDir, "allSummaries.txt"),
  row.names = FALSE,
  quote = FALSE,
  sep = "\t",
  col.names = TRUE
)