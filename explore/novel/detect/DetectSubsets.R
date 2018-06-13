


require(flowCore)
require(cytofkit)
require(scales)
require(ClusterR)

cluster <-
  function(fcsFile,
           gs,
           outputDir,
           frame,
           markersToCluster = c("CD27",
                                "HLA-DR",
                                "CD19",
                                "CD8",
                                "IgD",
                                "CD3",
                                "CCR7",
                                "CD28",
                                "CD95",
                                "CD45RA",
                                "CD4"),
           subsetGate = "cytotoxic Tcells-CD8+",
           addComp = TRUE,
           min = -20,
           max = 250) {
    outRoot = paste0(outputDir, fcsFile)
    print(paste0("writing output to root ", outRoot))
    set.seed(42)
    
    # boolean matrix of gate definition
    gatedData = data.frame(DEFINITION = getIndiceMat(gs, subsetGate)[, 1])
    
    gh <- gs[[1]]
    
    # subset the flow frame to just cyto ts
    subdata = getData(gh)[gatedData$DEFINITION, ]
    
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
    
    inputData = as.data.frame(subdata@exprs)[, channels]
    t = inputData
    for (channel in channels) {
      t[, channel] = squish(t[, channel], range = c(min, max))
    }
    clust = center_scale(t[, channels])
    
    clust = as.data.frame(clust)
    colnames(clust) = markersToCluster
    colnames(inputData) = markersToCluster
    
    print(paste0("running phenograph for sample ", fcsFile))
    
    clusterPhenograph = cytof_cluster(xdata = clust, method = "Rphenograph")
    clust$PHENOGRAPH = clusterPhenograph
    
    centroidsScale = aggregate(clust[, markersToCluster], list(clust$PHENOGRAPH), median)
    
    write.table(
      centroidsScale,
      file = paste0(outRoot, ".cents.scale"),
      row.names = FALSE,
      quote = FALSE,
      sep = "\t",
      col.names = TRUE
    )
    
    centroidsInput = aggregate(inputData, list(clust$PHENOGRAPH), median)
    
    write.table(
      centroidsInput,
      file = paste0(outRoot, ".cents.inputData"),
      row.names = FALSE,
      quote = FALSE,
      sep = "\t",
      col.names = TRUE
    )
    
    save(clust, file = paste0(outRoot, ".clust.Rdata"))
    
  }
