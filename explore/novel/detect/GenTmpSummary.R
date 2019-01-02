# system("/Users/Kitty/git/auto-fcs/explore/novel/scripts/collectSummary.sh")
dir="/Volumes/Beta2/flow/detect_NoNorm_v6_lymph_Mem_summary/"
allSummariesFiles = list.files(dir,
                               full.names = TRUE,
                               pattern = ".known.pops.txt$")

base=colnames(read.delim(allSummariesFiles[[1]]))

allSummaries = data.frame()
for (summaryFile in allSummariesFiles) {
  tmp=read.delim(
    summaryFile ,
    stringsAsFactors = FALSE,
    header = TRUE
  )
  Missing <- setdiff(base, names(tmp))  # Find names of missing columns
  tmp[Missing] <- 0                    # Add them, filled with '0's
  tmp <- tmp[base] 
  allSummaries = rbind(allSummaries,tmp)
}

write.table(allSummaries,
            file = paste0(dir, "allSummaries.txt"),
            row.names = FALSE,
            quote = FALSE,
            sep = "\t",
            col.names = TRUE
)
