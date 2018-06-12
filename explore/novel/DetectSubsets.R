

require(flowCore)
require(cytofkit)
require(scales)
require(ClusterR)


# fcs file located here
inputDir = "/Volumes/Beta2/flow/testNovels/"
sample = "2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs"
outPutDir= "/Volumes/Beta2/flow/testNovelsOut/"
wsFile = "/Volumes/Beta2/flow/wsp/2016-10-31_PANEL 1_DHS_Group two_F1637276_038.fcs_panel1Rename.wsp"



markersToCluster=c("CD27","HLA-DR","CD19","CD8","IgD","CD3","CCR7","CD28","CD95","CD45RA","CD4")
subsetGate="cytotoxic Tcells-CD8+"
addComp=TRUE
min = -20
max = 250

print(wsFile)
# open workspace file


dir.create(outPutDir)
ws <- openWorkspace(wsFile)

# read fcs file to flow frame
frame = read.FCS(paste(inputDir, sample, sep = ""))
comp <- compensation(keyword(frame)$`SPILL`)

s= getSamples(ws)
id=s[which(s$name==sample),]$name

gs <-
  parseWorkspace(
    ws,
    #WSP file
    path = inputDir,
    #FCS file
    name = 1,
    #sample group
    subset = id[1],
    #load single fcs file
    isNcdf = FALSE,
    #not memory mapped
    compensation = comp
  )



# boolean matrix of cytoT definition
gatedData = data.frame(DEFINITION = getIndiceMat(gs, subsetGate)[, 1])

gh <- gs[[1]]

# subset the flow frame to just cyto ts
subdata = getData(gh)[gatedData$DEFINITION, ]

channels = character()
for (marker in markersToCluster) {
  if (addComp) {
    channels = c(channels, c(paste0(
      "Comp-",
      getChannelMarker(frame, marker)$name
    )))
  } else{
    channels = c(channels, c(paste0(
      getChannelMarker(frame, marker)$name
    )))
  }
}
# channels = colnames(subdata)[grep("Comp", colnames(subdata))]

  
# markerNames=markerNames


t = as.data.frame(subdata@exprs)[, channels]
for (channel in channels) {
  t[, channel] = squish(t[, channel], range = c(min, max))
}
clust = center_scale(t[, channels])
clust =clust[1:min(subto,length(clust[,1])),]

# colnames(clust) = markersToCluster


clust = as.data.frame(clust)
colnames(clust)=channels

print(paste0("running phenograph for sample ", sample))

clusterPhenograph = cytof_cluster(xdata = clust, method = "Rphenograph")
clust$PHENOGRAPH = clusterPhenograph



