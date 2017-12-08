

outputDir = "/Volumes/Beta/data/flow/isLOD/"
events = c(2:10 %o% 10 ^ (3:5))


subSample <- function(fcsFile, outputDir, events) {
  require(flowCore)
  
  baseOut = paste0(outputDir, basename(gsub(".fcs", "", fixed = TRUE, fcsFile)))
  frame = read.FCS(fcsFile)
  maxEvents = length(exprs(frame)[, "FSC-H"])
  write.FCS(frameSub, paste0(baseOut, "_All_", maxEvents, ".fcs"))
  
  for (eventCount in events) {
    sampler = sample(1:maxEvents, eventCount, replace = maxEvents < eventCount)
    frameSub = frame[sampler, ]
    subOut = paste0(baseOut, "_", eventCount, ".fcs")
    write.FCS(frameSub, subOut)
  }
}

inputDir = "/Volumes/Beta/data/flow/fcs3/"

fcsFilesAll <-
  list.files(inputDir,
             pattern = ".fcs",
             full = TRUE)

numFiles = 10
p1Files  = fcsFilesAll[grepl("PANEL 1", fcsFilesAll)]
p1Files = sample(p1Files, numFiles, replace = FALSE)
p2Files  = fcsFilesAll[grepl("PANEL 2", fcsFilesAll)]
p2Files = sample(p2Files, numFiles, replace = FALSE)

fcsFilesRun = c(p1Files, p2Files)

for (fcsFile in fcsFilesRun) {
  subSample(fcsFile = fcsFile,
            outputDir = outputDir,
            events = events)
}
