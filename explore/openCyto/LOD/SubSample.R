



subSample <- function(fcsFile,outputDir){
  require(flowCore)
  
   baseOut = paste0(outputDir, basename(gsub(".fcs","",fixed = TRUE,fcsFile)))
  frame = read.FCS(fcsFile)
  
  
  inFile <- system.file("extdata", "0877408774.B08", package="flowCore")
  foo <- read.FCS(inFile, transform=FALSE)
  outFile <- file.path(tempdir(), "foo.fcs")
  
  ## now write out into a file
  write.FCS(foo, outFile)
  bar <- read.FCS(outFile, transform=FALSE)
  all(exprs(foo) == exprs(bar))
  
  
}