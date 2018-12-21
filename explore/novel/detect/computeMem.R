
























#
# inDir = "/Volumes/Beta2/flow/testNovelsOut/"
# outDir = "/Volumes/Beta2/flow/testNovelsOutMEM/"
#
# dir.create(outDir)
#
# refPops = list.files(inDir,
#                      full.names = TRUE,
#                      pattern = ".refPop.IQR.MEDIAN.txt$")



# for (refPop in refPops) {
#   print(markers)
# }
computeMEM <- function(refPopMEMFile, clustsMEMFile) {
  ref = read.delim(refPopMEMFile)
  clusts = read.delim(clustsMEMFile)
  # print(ref)
  print(length(clusts$MEDIAN_Group.1))
  markers = ref$MARKER
  print(length(markers))
  results = data.frame()
  for (phengraphCluster in clusts$MEDIAN_Group.1) {
    pgraphSub = clusts[which(clusts$MEDIAN_Group.1 == phengraphCluster),]
    clustData = data.frame()
    for (marker in markers) {
      subRef = ref[which(ref$MARKER == marker),]
      
      markerPgraph = gsub("-", ".", marker)
      medDiff = pgraphSub[, paste0("MEDIAN_", markerPgraph), ] - subRef$MEDIAN_BASE
      iqrRatio =   subRef$IQR_BASE / max(0.5, pgraphSub[, paste0("IQR_", markerPgraph), ])
      
      memScore = abs(medDiff) + iqrRatio - 1
      if (medDiff < 0) {
        memScore = memScore * -1
      }
      memlabel = paste0(marker, round(memScore))
      
      tmp = data.frame(
        MARKER = marker,
        PHENOGRAPH_CLUSTER = phengraphCluster,
        MEM = memScore,
        METHOD = "BASE"
      )
      clustData = rbind(clustData, tmp)
      
      
      medDiff = pgraphSub[, paste0("MEDIAN_", markerPgraph), ] - subRef[, paste0("MEDIAN_MINUS_PCLUST_", phengraphCluster)]
      iqrRatio =   subRef[, paste0("IQR_MINUS_PCLUST_", phengraphCluster)] /
        max(0.5, pgraphSub[, paste0("IQR_", markerPgraph), ])
      
      memScore = abs(medDiff) + iqrRatio - 1
      if (medDiff < 0) {
        memScore = memScore * -1
      }
      
      memlabel = paste0(marker, round(memScore))
      tmp = data.frame(
        MARKER = marker,
        PHENOGRAPH_CLUSTER = phengraphCluster,
        MEM = memScore,
        METHOD = "BASE_MINUS_CLUST"
      )
      clustData = rbind(clustData, tmp)
      
      
    }
    
    # clustData$FULL_MEM_LABEL = paste0(clustData$MEM_LABEL)
    
    results = rbind(results, clustData)
    
    
  }
  results$MEM_RAW = results$MEM
  for (method in unique(results$METHOD)) {
    sub = results$METHOD == method
    max = max(results[sub,]$MEM)
    results$MEM[sub] = 10 * (results$MEM[sub] / max)
  }
  results$MEM_ROUND = round(results$MEM)
  addPlus = results$MEM_ROUND >= 0
  results$MEM_ROUND[addPlus] = paste0("+", results$MEM_ROUND[addPlus])
  results$MEM_LABEL = paste0(results$MARKER, results$MEM_ROUND)
  return(results)
}
