








inDir = "/Volumes/Beta2/flow/testNovelsOut/"
outDir = "/Volumes/Beta2/flow/testNovelsOutMEM/"

dir.create(outDir)

refPops = list.files(inDir,
                     full.names = TRUE,
                     pattern = ".refPop.IQR.MEDIAN.txt$")

for (refPop in refPops) {
  ref = read.delim(refPop)
  clusts = read.delim(gsub(
    ".refPop.IQR.MEDIAN.txt",
    ".IQR.MEDIAN.inputData.txt",
    refPop
  ))
  
  markers = ref$MARKER
  results = data.frame()
  for (marker in marker) {
    subRef = ref[which(ref$MARKER == marker), ]
    for (phengraphCluster in clusts$MEDIAN_Group.1) {
      pgraphSub = clusts[which(clusts$MEDIAN_Group.1 == phengraphCluster), ]
      
      medDiff = pgraphSub[, paste0("MEDIAN_", marker),] - subRef$MEDIAN_BASE
      iqrRatio = pgraphSub[, paste0("IQR_", marker),] - subRef$IQR_BASE
      
      memScore = abs(medDiff) - iqrRatio - 1
      if (medDiff < 0) {
        memScore = memScore * -1
      }
      
      tmp = data.frame(
        MARKER = marker,
        PHENOGRAPH_CLUSTER = phengraphCluster,
        MEM = memScore,
        METHOD = "BASE"
      )
      results = rbind(results, tmp)
      
      medDiff = pgraphSub[, paste0("MEDIAN_", marker),] - subRef[, paste0("MEDIAN_MINUS_PCLUST_", phengraphCluster)]
      iqrRatio = pgraphSub[, paste0("IQR_", marker),] - subRef[, paste0("IQR_MINUS_PCLUST_", phengraphCluster)]
      
      memScore = abs(medDiff) - iqrRatio - 1
      if (medDiff < 0) {
        memScore = memScore * -1
      }
      
      tmp = data.frame(
        MARKER = marker,
        PHENOGRAPH_CLUSTER = phengraphCluster,
        MEM = memScore,
        METHOD = "BASE_MINUS_CLUST"
      )
      results = rbind(results, tmp)
      
      
    }
    
  }
  print(markers)
}