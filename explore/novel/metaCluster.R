

inDir="fillin"

centFiles <-
  list.files(inDir,
             pattern = ".cents.scale$",
             full = TRUE,
             recursive = FALSE)

cents <- do.call(rbind,lapply(centFiles,read.delim))

map=read.delim("/Volumes/Beta/data/flow/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/all.totalCellCounts.metrics.format.txt",
               stringsAsFactors = FALSE,
               header = TRUE)
map =map[which(map$PANEL=="panel1"),]
summaries =merge(summaries,map,by.x ="SAMPLE",by.y = "FILE" )
