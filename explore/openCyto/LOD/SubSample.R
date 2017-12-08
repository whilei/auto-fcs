


fcsFile = "/Volumes/Beta/data/flow/fcs3/2017-04-10_PANEL 2_FORTESSA_DHS_group one_F1638751_008.fcs"
outputDir = "/Volumes/Beta/data/flow/isLOD/"
events = c(2:10 %o% 10 ^ (3:5))
subSample <- function(fcsFile, outputDir, events) {
  require(flowCore)
  
  baseOut = paste0(outputDir, basename(gsub(".fcs", "", fixed = TRUE, fcsFile)))
  frame = read.FCS(fcsFile)
  
  for (eventCount in events) {
    subOut=paste0(baseOut,"_",eventCount,".fcs")
    write.FCS(frame, subOut)
    
    # ## now write out into a file
    # bar <- read.FCS(outFile, transform = FALSE)
    # all(exprs(foo) == exprs(bar))
  }
  
  
}