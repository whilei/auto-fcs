set.seed(42)


outputDir = "/scratch.global/lanej/flow/full/insilicoLODFCS_Ctls/"
events = c(2:10 %o% 10 ^ (3:5))
use = events <= 600000
events = events[use]

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

fcsFilesAll <-
  list.files(inputDir,
             pattern = ".fcs",
             full = TRUE)


iters = c(1:10)
numFiles = 20
not = !grepl("Compensation", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[not]
not = !grepl("ASMIC", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[not]
not = !grepl("PILOT", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[not]
not = !grepl("Specimen", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[not]
not = !grepl("settings", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[not]
not = !grepl("biolegend", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[not]


use = grepl("Ctl", fcsFilesAll, ignore.case = TRUE)
fcsFilesAll = fcsFilesAll[use]

p1Files  = fcsFilesAll[grepl("PANEL 1", fcsFilesAll)]
p1Files = sample(p1Files, numFiles, replace = FALSE)
p2Files  = fcsFilesAll[grepl("PANEL 2", fcsFilesAll)]
p2Files = sample(p2Files, numFiles, replace = FALSE)

fcsFilesRun = c(p1Files, p2Files)

# fcsFilesRun = fcsFilesAll
for (fcsFile in fcsFilesRun) {
  for (iter in iters) {
    print(paste0("sampling file ", fcsFile, " iteration ", iter))
    subSample(
      fcsFile = fcsFile,
      outputDir = outputDir,
      events = events,
      iter = iter
    )
  }
}
