library(devtools)

load("/Users/Kitty/git/auto-fcs/explore/novel/metaReport/summary.meta.RData")
saveRDS(summary, file = "/Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/data/summary.rds")

print("prepared data")