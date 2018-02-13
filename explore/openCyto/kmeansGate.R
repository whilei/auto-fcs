require(flowCore)
require(ClusterR)
require(scales)


#
# fr=frame
# min = -20
# max = 225
# k = 4
# num_init = 500
# max_iters = 5000
# channels=c("CD45RA","CCR7","CD28")

# channels = c(#CCR7
#   "Comp-BV 421-A",
#   #CD28
#   "Comp-BV 510-A",
#   #CD45RA
#   "Comp-BV 711-A",
#   #CD95
#   "Comp-BV 605-A")
# channels = channels[1:3]
wspFile = "/Volumes/Beta/data/flow/testTcellSubFCS_BoolResults/2016-08-01_PANEL 1_DHS_Group one_F1636851_001.fcs_panel1Rename.wsp"
fcsFile = "2016-08-01_PANEL 1_DHS_Group one_F1636851_001.fcs"
inputDir = "/Volumes/Beta/data/flow/testTcellSubFCS/"
outputDir = "/Volumes/Beta/data/flow/testPipeKmeans/"
nodesOfInterest = c("Helper Tcells-CD4+", "cytotoxic Tcells-CD8+")
markersToCluster = c("CCR7", "CD45RA", "CD28")

gateKmeansWsp = function(wspFile,
                         fcsFile,
                         inputDir,
                         outputDir,
                         min = -20,
                         max = 225,
                         k = 4,
                         num_init = 500,
                         max_iters = 5000,
                         nodesOfInterest = c("Helper Tcells-CD4+", "cytotoxic Tcells-CD8+"),
                         markersToCluster = c("CCR7", "CD45RA", "CD28")) {
  outputRoot = paste0(outputDir, fcsFile)
  
  ws <- openWorkspace(wspFile)
  frame = read.FCS(paste(inputDir, fcsFile, sep = ""))
  gs <-
    parseWorkspace(
      ws,
      #WSP file
      path = inputDir,
      #FCS file
      name = 1,
      #sample group
      subset = fcsFile,
      #load single fcs file
      isNcdf = FALSE,
      #not memory mapped
      compensation = compensation(keyword(frame)$`SPILL`)
    )
  
  
  combo = data.frame(ht = getIndiceMat(gs, nodesOfInterest[1])[, 1],
                     ct = getIndiceMat(gs, nodesOfInterest[2])[, 1])
  combo$MDEF = combo$ct | combo$ht
  
  gh <- gs[[1]]
  subdata = getData(gh)[combo$MDEF, ]
  
  channels = character()
  for (marker in markersToCluster) {
    channels = c(channels, c(paste0(
      "Comp-", getChannelMarker(frame, marker)$name
    )))
  }
  t = as.data.frame(subdata@exprs)[, channels]
  min = -20
  max = 225
  for (channel in channels) {
    t[, channel] = squish(t[, channel], range = c(min, max))
  }
  clust = center_scale(t[, channels])
  colnames(clust) = c(channels)
  save(clust, file = paste0(outputRoot, ".clusterData"))
  km_rc = KMeans_rcpp(
    clust,
    clusters = k,
    num_init = num_init,
    max_iters = max_iters,
    
    initializer = 'optimal_init',
    # threads = 4,
    verbose = F,
    seed = 42
  )
  
  
  
  
  
}




#
# .kmeansGate <-
#   function(fr,
#            pp_res,
#            channels = NA,
#            filterId = "",
#            min = -20,
#            max = 225,
#            k = 4,
#            num_init = 500,
#            max_iters = 5000,
#            ...) {
#     args = list(...)
#     data <-
#       as.data.frame(exprs(fr[, c(channels)])) # extract just the parameter values being inspected
#
#     # squish outliers to range max/min
#     for (channel in channels) {
#       data[, channel] = squish(data[, channel], range = c(min, max))
#     }
#
#     clust = center_scale(data[, clustChannels])
#     colnames(clust) = c(clustChannels)
#     km_rc = KMeans_rcpp(
#       clust,
#       clusters = k,
#       num_init = num_init,
#       max_iters = max_iters,
#
#       initializer = 'optimal_init',
#       # threads = 4,
#       verbose = F,
#       seed = 42
#     )
#
#     print(channels)
#     # s1 map channels to desc
#     # s2 func assignStatus
#     # s3 dump bool mat, and counts for quick correls
#     # s4 return dummy gate
#
#   }
#
#
# # Use median cluster values on dimensions of interest to determine population status
#
# assignStatus = function(results, clusterCol) {
#   summary = data.frame()
#   for (cluster in unique(results[, c(clusterCol)])) {
#     # print(cluster)
#     sub = results[which(results[, c(clusterCol)] == cluster), ]
#     tmp = data.frame(
#       CLUSTER = cluster,
#       MEDIAN_CCR7 = median(sub$CCR7),
#       MEDIAN_CD45 = median(sub$CD45)
#     )
#     summary = rbind(summary, tmp)
#     # print(unique(sub[,c(clusterCol)]))
#   }
#
#   summary$STATUS = ""
#   summary = summary[order(summary$MEDIAN_CCR7), ]
#   summary[c(1:2), ]$STATUS = "CCR7-"
#   summary[c(3:4), ]$STATUS = "CCR7+"
#   summary = summary[order(summary$MEDIAN_CD45), ]
#   summary[c(1:2), ]$STATUS = paste0(summary[c(1:2), ]$STATUS, "CD45-")
#   summary[c(3:4), ]$STATUS = paste0(summary[c(3:4), ]$STATUS, "CD45+")
#
#   summary$POPULATION = gsub("CCR7-CD45-", "effector memory", summary$STATUS, fixed = TRUE)
#   summary$POPULATION = gsub("CCR7+CD45-", "central memory", summary$POPULATION, fixed = TRUE)
#   summary$POPULATION = gsub("CCR7+CD45+", "naive", summary$POPULATION, fixed = TRUE)
#   summary$POPULATION = gsub("CCR7-CD45+", "effector", summary$POPULATION, fixed = TRUE)
#
#   # TODO error check for <4 pops
#   results = merge(results, summary, by.x = clusterCol, by.y = "CLUSTER")
#   return(results)
# }