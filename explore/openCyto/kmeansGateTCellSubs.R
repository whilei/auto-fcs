




require(ClusterR)
require(scales)
require(CytoML)


# https://github.com/RGLab/flowWorkspace/issues/231




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
                         markersToCluster = c("CCR7", "CD45RA", "CD28"),
                         addComp = FALSE) {
  dir.create(outputDir)
  outputRoot = paste0(outputDir, fcsFile)
  
  
  combo = data.frame(ht = getIndiceMat(gs, nodesOfInterest[1])[, 1],
                     ct = getIndiceMat(gs, nodesOfInterest[2])[, 1])
  combo$MDEF = combo$ct | combo$ht
  
  gh <- gs[[1]]
  subdata = getData(gh)[combo$MDEF, ]
  
  channels = character()
  for (marker in markersToCluster) {
    if (addComp) {
      channels = c(channels, c(paste0(
        "Comp-",
        getChannelMarker(frame, marker)$name
      )))
    } else{
      channels = c(channels, c(paste0(
        getChannelMarker(frame, marker)$name
      )))
    }
  }
  # print(getData(gh))
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
    verbose = F,
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
  
  
  addedWSP = paste0(outputRoot, "kmeans_panel1Rename.wsp")
  
  print(paste0("adding and renaming nodes and writing to ", addedWSP))
  # gs = renameKmeansNodes(gs = gs, gsKmeans = gsKmeans)
  
  
  print("writing new .wsp")
  
  GatingSet2flowJo(gs, addedWSP)
  sed1(addedWSP)
  
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
  
  
  cytoE_EM = (boolMat$`effector memory` |
                boolMat$effector) & boolMat$CYTO_T
  subFrame = getData(gh)[cytoE_EM, ]
  subframes = c(subFrame)
  names(subframes) = c(basename(fcsFile))
  
  # https://rdrr.io/bioc/flowWorkspace/man/add.html
  gsKmeans <- GatingSet(as(subframes, "flowSet"))
  
  template = add_pop(
    gsKmeans,
    alias = "CD28Gate",
    pop = "CD28",
    parent = "root",
    dims = "CD28",
    gating_method = "mindensity",
    gating_args = "gate_range = c(80,150)"
  )
  
  template = add_pop(
    gsKmeans,
    alias = "CD27Gate",
    pop = "CD27",
    parent = "root",
    dims = "CD27",
    gating_method = "mindensity",
    gating_args = "gate_range = c(80,150)"
  )
  
  template = add_pop(
    gsKmeans,
    alias = "*",
    pop = "CD28+/-CD27+/-",
    parent = "root",
    dims = "CD28,CD27",
    gating_method = "refGate",
    gating_args = "CD28Gate:CD27Gate"
  )
  
  
  # Extract CD28/27 gating to func
  # getIndiceMat(effector, "CD28-CD27-")|getIndiceMat(effector memory, "CD28-CD27-") etc for boolmat
  
  boolMat$CD28M_CD27M = FALSE
  boolMat[cytoE_EM, "CD28M_CD27M"][getIndiceMat(gsKmeans, "CD28-CD27-")] =
    TRUE
  
  boolMat$CD28P_CD27M = FALSE
  boolMat[cytoE_EM, "CD28P_CD27M"][getIndiceMat(gsKmeans, "CD28+CD27-")] =
    TRUE
  
  boolMat$CD28M_CD27P = FALSE
  boolMat[cytoE_EM, "CD28M_CD27P"][getIndiceMat(gsKmeans, "CD28-CD27+")] =
    TRUE
  
  boolMat$CD28P_CD27P = FALSE
  boolMat[cytoE_EM, "CD28P_CD27P"][getIndiceMat(gsKmeans, "CD28+CD27+")] =
    TRUE
  
  subSetPops = c("CD28M_CD27M", "CD28P_CD27M", "CD28M_CD27P", "CD28P_CD27P")
  limitPops = c("effector memory", "effector")
  cytoLim = boolMat[which(boolMat$CYTO_T ==
                            TRUE),]
  for (limit in limitPops) {
    limitSub = cytoLim[which(cytoLim[, limit] == TRUE), ]
    for (subSet in subSetPops) {
      limitSubSup = limitSub[which(limitSub[, subSet] == TRUE), ]
      countTmpSS = data.frame(
        SAMPLE = fcsFile,
        POPULATION = paste0("CYTO_", limit, "_", subSet),
        COUNT = length(limitSubSup[, subSet]),
        PARENT_COUNT = length(limitSub[, limit]),
        OPTIMAL_K = optK,
        DFK_ALL = dfKAll,
        NUM_POPS_ASSIGNED = popsAssigned
      )
      summaryCounts = rbind(summaryCounts, countTmpSS)
    }
  }
  
  
  addedWSP = paste0(outputRoot, "kmeans_panel1Rename.wsp")
  
  print(paste0("adding and renaming nodes and writing to ", addedWSP))
  gs = renameKmeansNodes(gs = gs, gsKmeans = gsKmeans)
  
  
  print("writing new .wsp")
  
  GatingSet2flowJo(gs, addedWSP)
  sed1(addedWSP)
  
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

renameKmeansNodes <- function(gs, gsKmeans) {
  nodesToUpdate = list(
    c(
      "EM3 cytotoxic Tcells (CD27-  CD28-)",
      "CD28-CD27-",
      "effector memory cytotoxic Tcells (CCR7- , CD45RA-)"
    ),
    c(
      "EM4 cytotoxic Tcells (CD27-  CD28+)",
      "CD28+CD27-",
      "effector memory cytotoxic Tcells (CCR7- , CD45RA-)"
    ),
    c(
      "EM2 cytotoxic Tcells (CD27+  CD28-)",
      "CD28-CD27+",
      "effector memory cytotoxic Tcells (CCR7- , CD45RA-)"
    ),
    c(
      "EM1 cytotoxic Tcells (CD27+  CD28+)",
      "CD28+CD27+",
      "effector memory cytotoxic Tcells (CCR7- , CD45RA-)"
    ),
    c(
      "pE cytotoxic Tcells (CD27-  CD28-)",
      "CD28-CD27-",
      "effector cytotoxic Tcells  (CCR7-  CD45RA+)"
    ),
    c(
      "pE2 cytotoxic Tcells (CD27+ , CD28-)",
      "CD28-CD27+",
      "effector cytotoxic Tcells  (CCR7-  CD45RA+)"
    ),
    c(
      "pE1 cytotoxic Tcells (CD27+  CD28+)",
      "CD28+CD27+",
      "effector cytotoxic Tcells  (CCR7-  CD45RA+)"
    )
  )
  for (node in nodesToUpdate) {
    print(paste0("updating ", node[1], " to kmeans version"))
    setNode(gs, node[1], paste0(node[1], "_OriginalOC_Version"))
    setNode(gs, paste0(node[1], "_OriginalOC_Version"), FALSE)
    print(getGate(gsKmeans, node[2]))
    add(gs,
        getGate(gsKmeans, node[2]),
        parent = node[3],
        name = node[1])
  }
  return(gs)
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
  
  summary$POPULATION = summary$STATUS
  summary = populate(summary = summary ,
                     markerDef = "CCR7-CD45-",
                     population = "effector memory")
  summary = populate(summary = summary ,
                     markerDef = "CCR7+CD45-",
                     population = "central memory")
  summary = populate(summary = summary ,
                     markerDef = "CCR7+CD45+",
                     population = "naive")
  summary = populate(summary = summary ,
                     markerDef = "CCR7-CD45+CD28-",
                     population = "effector")
  
  if (length(unique(summary$POPULATION)) != length(unique(summary$STATUS))) {
    summary$POPULATION = "MIS_ASSIGNED_CLUSTERS"
  }
  results = merge(results, summary, by.x = clusterCol, by.y = "CLUSTER")
  return(results)
}

populate = function(summary, markerDef, population) {
  if (length(summary[which(summary$STATUS == markerDef), ]$POPULATION) > 0) {
    summary[which(summary$STATUS == markerDef), ]$POPULATION = population
  }
  return(summary)
}
