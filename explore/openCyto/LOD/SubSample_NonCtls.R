

outputDir = "/scratch.global/lanej/flow/full/insilicoLOD_GoodMatched/"
events = c(2:10 %o% 10 ^ (3:5))
inputFile="/home/tsaim/lane0212/git/auto-fcs/explore/openCyto/LOD/replaceWithBatch"

subSample <- function(fcsFile, outputDir, events, iter) {
  require(flowCore)
  
  baseOut = paste0(outputDir, basename(gsub(".fcs", "", fixed = TRUE, fcsFile)))
  frame = read.FCS(fcsFile)
  maxEvents = length(exprs(frame)[, "FSC-H"])
  
  if (iter == 1) {
    write.FCS(frame, paste0(baseOut, "_All_", maxEvents, ".fcs"))
  }
  
  for (eventCount in events) {
    if (maxEvents * .5 > eventCount) {
      subOut = paste0(baseOut, "_count_", eventCount, "_iter_", iter, ".fcs")
      if (!file.exists(subOut)) {
        sampler = sample(1:maxEvents, eventCount, replace = FALSE)
        frameSub = frame[sampler, ]
        write.FCS(frameSub, subOut)
      }
    }
  }
}

inputDir = "/scratch.global/lanej/flow/full/fcs/"


iters = c(1:10)

fcsFilesRun =  read.delim(inputFile, stringsAsFactors = FALSE)
fcsFilesRun = fcsFilesRun$x

# fcsFilesRun = fcsFilesAll
set.seed(42)
for (fcsFile in fcsFilesRun) {
  for (iter in iters) {
    print(paste0("sampling file ", fcsFile, " iteration ", iter))
    subSample(
      fcsFile = paste0(inputDir,fcsFile),
      outputDir = outputDir,
      events = events,
      iter = iter
    )
  }
}
