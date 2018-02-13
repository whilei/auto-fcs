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
.kmeansGate <-
  function(fr,
           pp_res,
           channels = NA,
           filterId = "",
           min = -20,
           max = 225,
           k = 4,
           num_init = 500,
           max_iters = 5000,
           ...) {
    args = list(...)
    data <-
      as.data.frame(exprs(fr[, c(channels)])) # extract just the parameter values being inspected
    
    # squish outliers to range max/min
    for (channel in channels) {
      data[, channel] = squish(data[, channel], range = c(min, max))
    }
    
    clust = center_scale(data[, clustChannels])
    colnames(clust) = c(clustChannels)
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
    
    print(channels)
    # s1 map channels to desc
    # s2 func assignStatus
    # s3 dump bool mat, and counts for quick correls
    # s4 return dummy gate
  
  }


# Use median cluster values on dimensions of interest to determine population status

assignStatus = function(results, clusterCol) {
  summary = data.frame()
  for (cluster in unique(results[, c(clusterCol)])) {
    # print(cluster)
    sub = results[which(results[, c(clusterCol)] == cluster),]
    tmp = data.frame(
      CLUSTER = cluster,
      MEDIAN_CCR7 = median(sub$CCR7),
      MEDIAN_CD45 = median(sub$CD45)
    )
    summary = rbind(summary, tmp)
    # print(unique(sub[,c(clusterCol)]))
  }
  
  summary$STATUS = ""
  summary = summary[order(summary$MEDIAN_CCR7),]
  summary[c(1:2),]$STATUS = "CCR7-"
  summary[c(3:4),]$STATUS = "CCR7+"
  summary = summary[order(summary$MEDIAN_CD45),]
  summary[c(1:2),]$STATUS = paste0(summary[c(1:2),]$STATUS, "CD45-")
  summary[c(3:4),]$STATUS = paste0(summary[c(3:4),]$STATUS, "CD45+")
  
  summary$POPULATION = gsub("CCR7-CD45-", "effector memory", summary$STATUS, fixed = TRUE)
  summary$POPULATION = gsub("CCR7+CD45-", "central memory", summary$POPULATION, fixed = TRUE)
  summary$POPULATION = gsub("CCR7+CD45+", "naive", summary$POPULATION, fixed = TRUE)
  summary$POPULATION = gsub("CCR7-CD45+", "effector", summary$POPULATION, fixed = TRUE)
  
  # TODO error check for <4 pops
  results = merge(results, summary, by.x = clusterCol, by.y = "CLUSTER")
  return(results)
}