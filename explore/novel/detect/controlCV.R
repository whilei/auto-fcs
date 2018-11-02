




summary <-
  readRDS("/Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/data/summary.rds")

# summary$FREQ_TOTAL_CLUST=summary$TOTAL_COUNTSsummary$TOTAL_PHENOGRAPH_COUNTS
summary$SAMPLE_META_COUNT = paste0(summary$SAMPLE, "_", summary$META_CLUSTER)
totCount = aggregate(summary$TOTAL_PHENOGRAPH_COUNTS, list(summary$SAMPLE), sum)
colnames(totCount) = c("SAMPLE", "ALL_INPUT_COUNT")
summary = merge(summary, totCount, by.x = "SAMPLE", by.y = "SAMPLE")

summary$SAMPLE_META_COUNT = paste0(summary$SAMPLE, "_", summary$META_CLUSTER)
totCount = aggregate(summary$TOTAL_PHENOGRAPH_COUNTS,
                     list(summary$SAMPLE_META_COUNT),
                     sum)
colnames(totCount) = c("SAMPLE_META_COUNT", "TOTAL_META_COUNT")
summary = merge(summary, totCount, by.x = "SAMPLE_META_COUNT", by.y = "SAMPLE_META_COUNT")

summary$FREQ_PHENOGRAPH_PARENT = summary$TOTAL_META_COUNT / summary$ALL_INPUT_COUNT

ctls = summary[which(summary$CTL != "STUDY_SAMPLE"),]


nms <- names(summary)

CV <- function(mean, sd) {
  (sd / mean) * 100
}

cvCalc <- function(vec) {
  CV(mean = mean(vec, na.rm = TRUE),
     sd = sd(vec, na.rm = TRUE))
}


uniqueCtls = unique(ctls$CTL)
metClusts=unique(summary$META_CLUSTER)
print(table(ctls$CTL))
print(table(summary$META_CLUSTER))

resultsMetaCV = data.frame()
for (ctl in uniqueCtls) {
  # &ctls$META_CLUSTER==metClust
  subCtl = ctls[which(ctls$CTL == ctl),]
  
  for (metClust in metClusts) {
    subCtlClust = subCtl[which(subCtl$META_CLUSTER == metClust),]
    
    cv = cvCalc(subCtlClust$FREQ_PHENOGRAPH_PARENT)
    print(is.na(cv))
    tmp = data.frame(
      CTL = ctl,
      POP = NA,
      META_CLUSTER = metClust,
      CV = cv,
      METHOD = "FREQ_PARENT_PHENOGRAPH"
    )
    resultsMetaCV = rbind(resultsMetaCV, tmp)
  }
}

resultsMetaCVSummary = aggregate(resultsMetaCV$CV,
                                 list(resultsMetaCV$META_CLUSTER),
                                 median,
                                 na.rm = TRUE)

colnames(resultsMetaCVSummary) = c("META_CLUSTER", "CTL_CV")
summary = merge(
  summary,
  resultsMetaCVSummary,
  by.x = "META_CLUSTER",
  by.y = "META_CLUSTER",
  all.x = TRUE
)

saveRDS(summary, file = "/Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/data/summary.CV.rds")
