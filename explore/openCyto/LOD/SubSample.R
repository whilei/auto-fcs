


outputDir = "/scratch.global/lanej/flow/full/insilicoLODFCS_Reg/"
events = c(2:10 %o% 10 ^ (3:5))


subSample <- function(fcsFile, outputDir, events) {
  require(flowCore)
  
  baseOut = paste0(outputDir, basename(gsub(".fcs", "", fixed = TRUE, fcsFile)))
  frame = read.FCS(fcsFile)
  maxEvents = length(exprs(frame)[, "FSC-H"])
  write.FCS(frame, paste0(baseOut, "_All_", maxEvents, ".fcs"))
  
  for (eventCount in events) {
    if (maxEvents > eventCount) {
      sampler = sample(1:maxEvents, eventCount, replace = FALSE)
      frameSub = frame[sampler,]
      subOut = paste0(baseOut, "_", eventCount, ".fcs")
      write.FCS(frameSub, subOut)
    }
  }
}

  inputDir = "/scratch.global/lanej/flow/full/fcs/"
  
  fcsFilesAll <-
    list.files(inputDir,
               pattern = ".fcs",
               full = TRUE)
  
  
numFiles = 250
not=!grepl("Compensation",fcsFilesAll,ignore.case = TRUE)
fcsFilesAll=fcsFilesAll[not]
not=!grepl("ASMIC",fcsFilesAll,ignore.case = TRUE)
fcsFilesAll=fcsFilesAll[not]
not=!grepl("PILOT",fcsFilesAll,ignore.case = TRUE)
fcsFilesAll=fcsFilesAll[not]
not=!grepl("Specimen",fcsFilesAll,ignore.case = TRUE)
fcsFilesAll=fcsFilesAll[not]
not=!grepl("settings",fcsFilesAll,ignore.case = TRUE)
fcsFilesAll=fcsFilesAll[not]

p1Files  = fcsFilesAll[grepl("PANEL 1", fcsFilesAll)]
p1Files = sample(p1Files, numFiles, replace = FALSE)
p2Files  = fcsFilesAll[grepl("PANEL 2", fcsFilesAll)]
p2Files = sample(p2Files, numFiles, replace = FALSE)

fcsFilesRun = c(p1Files, p2Files)

# fcsFilesRun = fcsFilesAll
for (fcsFile in fcsFilesRun) {
  print(paste0("sampling file ",fcsFile))
  subSample(fcsFile = fcsFile,
            outputDir = outputDir,
            events = events)
}
