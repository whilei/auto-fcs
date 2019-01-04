

metaPopCMelt = melt(data = metaPopC, id.vars = "META_CLUSTER")
metaPopCMelt$POPULATION = gsub("OPEN_CYTO_", "", metaPopCMelt$variable)
metaPopCMelt$POPULATION = gsub("_ClusterFreq", "", metaPopCMelt$POPULATION)
metaPopCMelt$POPULATION = gsub("_ClusterFreq", "", metaPopCMelt$POPULATION)
metaPopCMelt$POPULATION = paste0(metaPopCMelt$POPULATION," (",metaPopCMelt$value,")")

metaPopCMelt$PopC_ROUND = metaPopCMelt$value
# addPlus = metaPopCMelt$PopC_ROUND >= 0
# metaPopCMelt$PopC_ROUND[addPlus] = paste0("+", metaPopCMelt$PopC_ROUND[addPlus])
# metaPopCMelt$PopC_LABEL = paste0(metaPopCMelt$POPULATION, metaPopCMelt$PopC_ROUND)
metaPopCMeltSub = metaPopCMelt[which(abs(round(metaPopCMelt$value)) >= reportThreshold),]
metaPopCMeltSub = metaPopCMeltSub[order(-metaPopCMeltSub$value),]
metaPopCMeltSubCast = dcast(
  data = metaPopCMeltSub,
  formula = META_CLUSTER ~ 1,
  fun.aggregate = toString,
  value.var = "POPULATION"
)
