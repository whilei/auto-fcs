

inputDir = "/Volumes/Beta/data/flow/testTcellSubFCS/"
outputDir = "/Volumes/Beta/data/flow/testPipeKmeans/"
nodesOfInterest = c("Helper Tcells-CD4+", "cytotoxic Tcells-CD8+")
markersToCluster = c("CCR7", "CD45RA", "CD28")
k = 4
min = -20
max = 225
num_init = 50
max_iters = 5000


fcsFile="2016-05-10_PANEL 1_HB_panel one_F1631916_003.fcs "

frame = read.FCS(paste(inputDir, file, sep = ""))


if(getMachineType(frame)=="FORTESSA"){
templateLymphFortessa = convertP1ToFortessa(templateFile = templateLymph, outputDir = outputDir,spliceFile = spliceFile)

gt_lymph <-
  gatingTemplate(templateLymphFortessa, autostart = 1L)
  print(getMachineType(frame))
}else{
gt_lymph <-
    gatingTemplate(templateLymph, autostart = 1L)
}

    gateTemplate = gt_lymph
    
print(paste("compensating ....", file))
metrics = data.frame()
comp <- compensation(keyword(frame)$`SPILL`)

chnls <- parameters(comp)
tf <- transformerList(chnls, biexpTrans)

print(paste("gating ....", file))
frames = c(frame)
names(frames) = c(basename(file))
fs =  as(frames, "flowSet")
gs1 <- GatingSet(fs)
gs1 <- compensate(gs1, comp)
gs1 <- transform(gs1, tf)

gh <- gs1[[1]]
gating(gateTemplate, gs1)

renameNodes(gs1,
                read.delim(panle1mapFile, stringsAsFactors = FALSE, sep = "\t"))

 gs=gs1    