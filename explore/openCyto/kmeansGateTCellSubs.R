











popsOfInterest = c("effector memory", "central memory", "naive", "effector")


gateKmeansWsp = function(gs,
                         fcsFile,
                         outputDir,
                         min = -20,
                         max = 250,
                         k = 4,
                         num_init = 150,
                         max_iters = 5000,
                         nodesOfInterest = c("Helper Tcells-CD4+", "cytotoxic Tcells-CD8+"),
                         markersToCluster = c("CCR7", "CD45RA", "CD28")) {
  dir.create(outputDir)
  outputRoot = paste0(outputDir, fcsFile)
  
  
  combo = data.frame(ht = getIndiceMat(gs, nodesOfInterest[1])[, 1],
                     ct = getIndiceMat(gs, nodesOfInterest[2])[, 1])
  combo$MDEF = combo$ct | combo$ht
  
  gh <- gs[[1]]
  subdata = getData(gh)[combo$MDEF, ]
  
  channels = character()
  for (marker in markersToCluster) {
    channels = c(channels, c(paste0(
      getChannelMarker(frame, marker)$name
    )))
  }
  t = as.data.frame(subdata@exprs)[, channels]
  min = -20
  max = 225
  for (channel in channels) {
    t[, channel] = squish(t[, channel], range = c(min, max))
  }
  clust = center_scale(t[, channels])
  colnames(clust) = markersToCluster
  print(paste0("clustering sample ", fcsFile))
  km_rc = KMeans_rcpp(
    clust,
    clusters = k,
    num_init = num_init,
    max_iters = max_iters,
    tol = 1e-06,
    initializer = 'optimal_init',
    # threads = 4,
    verbose = T,
    seed = 42
  )
  
  clust = as.data.frame(clust)
  clust$KMEANS_CLUSTER = km_rc$clusters
  save(clust, file = paste0(outputRoot, ".clusterData"))
  
  print(paste0("assigning population status for ", fcsFile))
  
  clustAssigned = assignStatus(results = clust, clusterCol = "KMEANS_CLUSTER")
  
  
  boolMat = data.frame(CYTO_T = combo$ct, HELPER_T = combo$ht)
  
  map = as.data.frame(table(clustAssigned$KMEANS_CLUSTER, clustAssigned$POPULATION))
  
  optKN = 6
  o3_t = Optimal_Clusters_KMeans(
    clust[, markersToCluster],
    max_clusters = optKN,
    plot_clusters = FALSE,
    criterion = 'distortion_fK',
    tol = 1e-06,
    seed = 42
  )
  
  summaryCounts = data.frame()
  
  popsAssigned = length(unique(clustAssigned$POPULATION))
  for (popToDump in popsOfInterest) {
    tmp = data.frame(combo$MDEF)
    colnames(tmp) = popToDump
    cluster = map[which(map$Var2 == popToDump &
                          map$Freq > 0),]$Var1
    tmp[, popToDump] = FALSE
    def = clust$KMEANS_CLUSTER == cluster
    tmp[combo$MDEF, popToDump][def] = TRUE
    boolMat = cbind(boolMat, tmp)
    
    popSub = boolMat[which(boolMat[, popToDump] == TRUE), ]
    
    optK = which.min(o3_t[1:optKN])
    dfKAll = paste0(o3_t[1:optKN], collapse = ",")
    countTmpHT = data.frame(
      SAMPLE = fcsFile,
      POPULATION = paste0("HELPER_", popToDump),
      COUNT = length(popSub[which(popSub$HELPER_T ==
                                    TRUE), ][, popToDump]),
      PARENT_COUNT = length(boolMat[which(boolMat$HELPER_T ==
                                            TRUE), ][, popToDump]),
      OPTIMAL_K = optK ,
      DFK_ALL = dfKAll ,
      NUM_POPS_ASSIGNED = popsAssigned
    )
    summaryCounts = rbind(summaryCounts, countTmpHT)
    countTmpCT = data.frame(
      SAMPLE = fcsFile,
      POPULATION = paste0("CYTO_", popToDump),
      COUNT = length(popSub[which(popSub$CYTO_T ==
                                    TRUE), ][, popToDump]),
      PARENT_COUNT = length(boolMat[which(boolMat$CYTO_T ==
                                            TRUE), ][, popToDump]),
      OPTIMAL_K = optK,
      DFK_ALL = dfKAll,
      NUM_POPS_ASSIGNED = popsAssigned
    )
    summaryCounts = rbind(summaryCounts, countTmpCT)
    
  }
  
  write.table(
    summaryCounts,
    file = paste0(outputRoot, ".counts.txt") ,
    sep = "\t",
    quote = FALSE,
    row.names = FALSE
  )
  
  
  gz1 <- gzfile(paste0(outputRoot, ".boolMatrix.txt.gz"), "w")
  write.table(
    boolMat,
    file = gz1 ,
    sep = "\t",
    quote = FALSE,
    row.names = FALSE
  )
  close(gz1)
  print(paste0("finished TCell subset clustering for  ", fcsFile))
}



# Use median cluster values on dimensions of interest to determine population status

assignStatus = function(results, clusterCol) {
  summary = data.frame()
  for (cluster in unique(results[, c(clusterCol)])) {
    sub = results[which(results[, c(clusterCol)] == cluster), ]
    tmp = data.frame(
      CLUSTER = cluster,
      MEDIAN_CCR7 = median(sub$CCR7),
      MEDIAN_CD45 = median(sub$CD45),
      MEDIAN_CD28 = median(sub$CD28)
    )
    summary = rbind(summary, tmp)
  }
  
  summary$STATUS = ""
  summary = summary[order(summary$MEDIAN_CCR7), ]
  summary[c(1:2), ]$STATUS = "CCR7-"
  summary[c(3:4), ]$STATUS = "CCR7+"
  summary = summary[order(summary$MEDIAN_CD45), ]
  summary[c(1:2), ]$STATUS = paste0(summary[c(1:2), ]$STATUS, "CD45-")
  summary[c(3:4), ]$STATUS = paste0(summary[c(3:4), ]$STATUS, "CD45+")
  summary = summary[order(summary$MEDIAN_CD28), ]
  summary[c(1), ]$STATUS = paste0(summary[c(1), ]$STATUS, "CD28-")
  
  
  summary$POPULATION = gsub("CCR7-CD45-", "effector memory", summary$STATUS, fixed = TRUE)
  summary$POPULATION = gsub("CCR7+CD45-", "central memory", summary$POPULATION, fixed = TRUE)
  summary$POPULATION = gsub("CCR7+CD45+", "naive", summary$POPULATION, fixed = TRUE)
  summary$POPULATION = gsub("CCR7-CD45+CD28-", "effector", summary$POPULATION, fixed = TRUE)
  results = merge(results, summary, by.x = clusterCol, by.y = "CLUSTER")
  return(results)
}


# require(flowCore)


#
# wspFile = "/Volumes/Beta/data/flow/testTcellSubFCS_BoolResults/2016-08-01_PANEL 1_DHS_Group one_F1636851_001.fcs_panel1Rename.wsp"
# fcsFile = "2016-08-01_PANEL 1_DHS_Group one_F1636851_001.fcs"
# inputDir = "/Volumes/Beta/data/flow/testTcellSubFCS/"
# outputDir = "/Volumes/Beta/data/flow/testPipeKmeans/"
# nodesOfInterest = c("Helper Tcells-CD4+", "cytotoxic Tcells-CD8+")
# markersToCluster = c("CCR7", "CD45RA", "CD28")
# k = 4
# min = -20
# max = 225
# num_init = 50
# max_iters = 5000
#
# gateKmeansWsp(wspFile=wspFile,
#               fcsFile=fcsFile,
#               inputDir=inputDir,
#               outputDir=outputDir,
#               min = min,
#               max = max,
#               k = k,
#               num_init = num_init,
#               max_iters = max_iters,
#               nodesOfInterest =nodesOfInterest,
#               markersToCluster = markersToCluster)


# ws <- openWorkspace(wspFile)
# frame = read.FCS(paste(inputDir, fcsFile, sep = ""))
# s= getSamples(ws)
# print(s)
#
# id=s[which(s$name==fcsFile),]$name
# gs <-
#   parseWorkspace(
#     ws,
#     #WSP file
#     path = inputDir,
#     #FCS file
#     name = 1,
#     #sample group
#     subset =id[1],
#     #load single fcs file
#     isNcdf = FALSE,
#     #not memory mapped
#     compensation = compensation(keyword(frame)$`SPILL`)
#   )
# closeWorkspace(ws)
