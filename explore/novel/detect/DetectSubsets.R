















normChannels <- function(inputData, channels, min, max) {
  t = inputData
  for (channel in channels) {
    t[, channel] = squish(t[, channel], range = c(min, max))
  }
  clust = center_scale(t[, channels])
  
  clust = as.data.frame(clust)
  return(clust)
}





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
           max = 250,
           subsetFirst = FALSE,
           normalize = TRUE) {
    outRoot = paste0(outputDir,
                     fcsFile,
                     "_subFirst_",
                     subsetFirst,
                     "_normalize_",
                     normalize)
    print(paste0("writing output to root ", outRoot))
    set.seed(42)
    print(paste0("using gate ", subsetGate, " as intitial filter"))
    
    
    # boolean matrix of gate definition
    gatedData = data.frame(DEFINITION = getIndiceMat(gs, subsetGate)[, 1])
    
    gh <- gs[[1]]
    
    # subset the flow frame to just cyto ts
    
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
    if (subsetFirst | !normalize) {
      subdata = getData(gh)[gatedData$DEFINITION, ]
    } else{
      subdata = getData(gh)
    }
    
    
    inputData = as.data.frame(subdata@exprs)[, channels]
    if (normalize) {
      clust = normChannels(inputData = inputData, channels = channels)
      
      if (!subsetFirst) {
        # now need to subset to proper event
        inputData = inputData[gatedData$DEFINITION, ]
        clust = clust[gatedData$DEFINITION, ]
      }
    } else{
      clust = inputData
    }
    
    colnames(clust) = markersToCluster
    colnames(inputData) = markersToCluster
    
    print(
      paste0(
        "running phenograph for sample ",
        fcsFile,
        " using ",
        length(rownames(clust)),
        " events, with subsetFirst=",
        subsetFirst,
        " and normalize=",
        normalize
      )
    )
    
    clusterPhenograph = cytof_cluster(xdata = clust, method = "Rphenograph")
    clust$PHENOGRAPH = clusterPhenograph
    
    clustToAggregate = clust
    if (!normalize) {
      print("normalization not flagged, apply scaleing for centroids")
      clustToAggregate = normChannels(
        inputData = as.data.frame(getData(gh)@exprs)[, channels],
        channels = channels,
        min = min,
        max = max
      )
      colnames(clustToAggregate) = markersToCluster
      clustToAggregate = clustToAggregate[gatedData$DEFINITION, ]
      clustToAggregate$PHENOGRAPH = clusterPhenograph
      
    }
    centroidsScale = aggregate(clustToAggregate[, markersToCluster],
                               list(clustToAggregate$PHENOGRAPH),
                               median)
    centroidsScale$SAMPLE = fcsFile
    write.table(
      centroidsScale,
      file = paste0(outRoot, ".cents.scale"),
      row.names = FALSE,
      quote = FALSE,
      sep = "\t",
      col.names = TRUE
    )
    
    centroidsInput = aggregate(inputData, list(clust$PHENOGRAPH), median)
    centroidsInput$SAMPLE = fcsFile
    
    write.table(
      centroidsInput,
      file = paste0(outRoot, ".cents.inputData"),
      row.names = FALSE,
      quote = FALSE,
      sep = "\t",
      col.names = TRUE
    )
    
    clust$SAMPLE = fcsFile
    save(clust, file = paste0(outRoot, ".clust.Rdata"))
    
    boolMat = data.frame(gatedData$DEFINITION)
    colnames(boolMat) = subsetGate
    
    intMat = data.frame(gatedData$DEFINITION)
    colnames(intMat) = subsetGate
    
    intMat[, subsetGate] = gsub("FALSE", "-1", intMat[, subsetGate])
    intMat[gatedData$DEFINITION, subsetGate] = clust$PHENOGRAPH
    
    uniqueClusts = sort(as.numeric(unique(clust$PHENOGRAPH)))
    for (cluster in uniqueClusts) {
      name = paste0("CLUST_", cluster)
      tmp = data.frame(gatedData$DEFINITION)
      colnames(tmp) = name
      tmp[, name] = FALSE
      def = clust$PHENOGRAPH == cluster
      tmp[gatedData$DEFINITION, name][def] = TRUE
      boolMat = cbind(boolMat, tmp)
    }
    
    gz1 <- gzfile(paste0(outRoot, ".boolMatrix.txt.gz"), "w")
    write.table(
      boolMat,
      file = gz1 ,
      sep = "\t",
      quote = FALSE,
      row.names = FALSE
    )
    close(gz1)
    
    gz1 <- gzfile(paste0(outRoot, ".IntMatrix.txt.gz"), "w")
    write.table(
      intMat,
      file = gz1 ,
      sep = "\t",
      quote = FALSE,
      row.names = FALSE
    )
    close(gz1)
    
  }
