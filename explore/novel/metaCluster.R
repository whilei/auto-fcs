

inDir="/Volumes/Beta2/flow/detect_v1/"

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

library(superheat)

superheat(scale(as.matrix(betasClust),center = TRUE,scale = TRUE), 
          
          # place dendrograms on columns and rows 
          row.dendrogram = T, 
          col.dendrogram = T,
          
          # make gridlines white for enhanced prettiness
          grid.hline.col = "white",
          grid.vline.col = "white",
          
          # rotate bottom label text
          bottom.label.text.angle = 90)


