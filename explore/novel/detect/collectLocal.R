print("collecting")
outDir="/Volumes/Beta2/flow/testSummaryLymph/"

allSummariesFiles = list.files(outDir,
                               full.names = TRUE,
                               pattern = ".known.pops.txt$")


minLymph = 20000
base = colnames(
  read.delim(
    "/Volumes/Beta2/flow/testSummaryLymph/2016-09-27_PANEL 1_DHS_Group one_F1637196_011.fcs_subFirst_TRUE_normalize_FALSE.known.pops.txt",
    check.names = FALSE
  )
)

allSummaries = data.frame()
for (summaryFile in allSummariesFiles) {
  tmp = read.delim(
    summaryFile ,
    stringsAsFactors = FALSE,
    header = TRUE,
    check.names = FALSE
  )
  if (sum(tmp$TOTAL_PHENOGRAPH_COUNTS) > minLymph) {
    Missing <-
      setdiff(base, names(tmp))  # Find names of missing columns
    tmp[Missing] <- 0                    # Add them, filled with '0's
    tmp <- tmp[base]
    allSummaries = rbind(allSummaries, tmp)
  }
}


write.table(
  allSummaries,
  file = paste0(outDir, "allSummaries.txt"),
  row.names = FALSE,
  quote = FALSE,
  sep = "\t",
  col.names = TRUE
)

print("collected")

library(rmarkdown)


rmarkdown::render("/Users/Kitty/git/auto-fcs/explore/novel/report/summaryClustersV8.Rmd", "html_document")
