outDir="/Volumes/Beta2/flow/testSummaryLymph/"

allSummariesFiles = list.files(outDir,
                               full.names = TRUE,
                               pattern = ".known.pops.txt$")

base = colnames(read.delim(allSummariesFiles[[1]],check.names = FALSE))

allSummaries = data.frame()
for (summaryFile in allSummariesFiles) {
  tmp = read.delim(summaryFile ,
                   stringsAsFactors = FALSE,
                   header = TRUE,check.names = FALSE)
  Missing <-
    setdiff(base, names(tmp))  # Find names of missing columns
  tmp[Missing] <- 0                    # Add them, filled with '0's
  tmp <- tmp[base]
  allSummaries = rbind(allSummaries, tmp)
}

write.table(
  allSummaries,
  file = paste0(outDir, "allSummaries.txt"),
  row.names = FALSE,
  quote = FALSE,
  sep = "\t",
  col.names = TRUE
)