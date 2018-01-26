require(flowCore)
require(tsne)
require(cytofkit)
library(ggcyto)
library(ClusterR)
library(gridExtra)

inputDir = "/Volumes/Beta/data/flow/testTcellSubFCS/"
outputDir = "/Volumes/Beta/data/flow/testTcellSubFCS/"

wsFile = "/Volumes/Beta/data/flow/wsp/801_Panel 1_DHS.wsp"
ws <- openWorkspace(wsFile)
pdfFile = paste(outputDir, "tsnePlots", ".pdf", sep = "")
pdf(file = pdfFile)

alpha=0.25

samps = getSamples(ws)$name
# for (samp in samps) {
#   command = paste0(
#     "rsync -av \'msi:/scratch.global/lanej/flow/full/fcs/",
#     gsub(" ", "\\\ ", samp, fixed = TRUE),
#     "' ",
#     inputDir
#   )
#   system(command)
# }

biexpTrans <-
  flowJo_biexp_trans(
    channelRange = 256,
    maxValue = 262144.0000291775 ,
    pos = 4.418539922,
    neg = 0,
    widthBasis = -100
  )





nodesOfInterest = c("Helper Tcells-CD4+")
tcellSubs = c(
  "naive helper Tcells (CCR7+ CD45RA+)",
  "effector memory helper Tcells (CCR7- CD45RA-)",
  "effector helper Tcells (CCR7- CD45RA+)",
  "central memory helper Tcells (CCR7+ CD45RA-)"
)
channels = c(
  "Comp-BV 421-A", #CCR7
  "Comp-BV 510-A", #CD28
  "Comp-BV 711-A", #CD45RA
  "Comp-BV 605-A", #CD95
  "Comp-APC-Cy7-A", #CD4
  "Comp-BUV 395-A" #CD8
)
clustChannels = channels[1:3]

#list samples in the workspace
s = getSamples(ws)
#for every sample
for (samp in s$name[7:7]) {
  print(samp)
  #read the fcs file
  frame = read.FCS(paste(inputDir, samp, sep = ""))
  
  id = s[which(s$name == samp),]$name
  #load the workspace for this file, apply transforms, compensation, and gates
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
      compensation = compensation(keyword(frame)$`SPILL`)
    )
  
  for (node in nodesOfInterest) {
    print(samp)
    print(table(getIndiceMat(gs, node)))
    if (length(grep("TRUE", getIndiceMat(gs, node))) < 50000) {
      gateDef = as.data.frame(getIndiceMat(gs, node))
      gh <- gs[[1]]
      subdata = getData(gh)[gateDef[, node],]
      t = as.data.frame(subdata@exprs)[, channels]
      clust = scale(t[, clustChannels])
      
      tsne <- cytof_dimReduction(
        data = clust,
        method = "tsne",
        out_dim = 2,
        markers =
      )
      
      results = as.data.frame(tsne)
      results$MANAUL_POP = NA
      for (pop in tcellSubs) {
        sub = getIndiceMat(gs, pop)[gateDef[, node]]
        results[sub, ]$MANAUL_POP = pop
      }
      results$CD45 = t$`Comp-BV 711-A`
      results$CCR7 = t$`Comp-BV 421-A`
      results$CD95 = t$`Comp-BV 605-A`
      results$CD28 = t$`Comp-BV 510-A`
      
      km_rc = KMeans_rcpp(
        clust,
        clusters = 4,
        num_init = 500,
        max_iters = 5000,
        
        initializer = 'optimal_init',
        threads = 3,
        verbose = T,
        seed = 42
      )
      
      results$CLUSTER_RAW = km_rc$clusters
      # results$CLUSTER = results$CLUSTER_RAW
      results$CLUSTER = gsub("4","effector memory", results$CLUSTER)
      results$CLUSTER = gsub("1","central memory", results$CLUSTER)
      results$CLUSTER = gsub("3","naive", results$CLUSTER)
      results$CLUSTER = gsub("2","effector", results$CLUSTER)
      
      # results$CLUSTER = gsub("1","effector memory", results$CLUSTER_RAW)
      # results$CLUSTER = gsub("2","central memory", results$CLUSTER)
      # results$CLUSTER = gsub("3","naive", results$CLUSTER)
      # results$CLUSTER = gsub("4","effector", results$CLUSTER)
      
      library(ggplot2)
      
      t2 <- theme(
        axis.line = element_line(colour = "black"),
        axis.text = element_text(colour = "black"),
        axis.ticks = element_line(colour = "black"),
        # panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        # panel.grid.major.y = element_blank(),
        # panel.grid.minor.y = element_blank(),
        panel.border = element_blank(),
        # panel.background = element_blank(),
        # legend.position="none",
        axis.text.x = element_text(angle = 90, hjust = 1)
      )
      theme_set(theme_grey(base_size = 10))
      results$MANUAL_GATE = gsub("\\(.*", "", results$MANAUL_POP)
      results$MANUAL_GATE = gsub(" helper Tcells", "", results$MANUAL_GATE)
      
      p1c = ggplot(results,
                   aes(
                     x = CCR7,
                     y = CD45,
                     colour = MANUAL_GATE
                   )) +
        geom_point(alpha =alpha) +
        xlab(paste0("CCR7")) +
        ylab(paste0("CD45")) + t2 + ggtitle(paste0("MANUAL", "\n", samp)) +
        theme(legend.position = "bottom")
      
      p2c = ggplot(results,
                   aes(
                     x = CCR7,
                     y = CD45,
                     colour = CLUSTER
                   )) +
        geom_point(alpha =alpha) +
        xlab(paste0("CCR7")) +
        ylab(paste0("CD45")) + t2 + ggtitle(paste0("AUTO_CLUST", "\n", samp)) +
        theme(legend.position = "bottom")
      
      p1d = ggplot(results,
                   aes(
                     x = CD95,
                     y = CD28,
                     colour = MANUAL_GATE
                   )) +
        geom_point(alpha =alpha) +
        xlab(paste0("CD95")) +
        ylab(paste0("CD28")) + t2 + ggtitle(paste0("MANUAL", "\n", samp)) +
        theme(legend.position = "bottom")
      
      p2d = ggplot(results,
                   aes(
                     x = CD95,
                     y = CD28,
                     colour = CLUSTER
                   )) +
        geom_point(alpha =alpha) +
        xlab(paste0("CD95")) +
        ylab(paste0("CD28")) + t2 + ggtitle(paste0("AUTO_CLUST", "\n", samp)) +
        theme(legend.position = "bottom")
      
      pb1 = ggplot(results,
                   aes(
                     x = tsne_1,
                     y = tsne_2,
                     colour = MANUAL_GATE
                   )) +
        geom_point(alpha =alpha) +
        xlab(paste0("tsne1")) +
        ylab(paste0("tsne2")) + t2 + ggtitle(paste0("MANUAL", "\n", samp)) +
        theme(legend.position = "bottom")
      
      # + theme(legend.position = "none")
      # print(pb)
      
      pb2 = ggplot(results,
                   aes(
                     x = tsne_1,
                     y = tsne_2,
                     colour = CLUSTER
                   )) +
        geom_point(alpha =alpha) +
        xlab(paste0("tsne1")) +
        ylab(paste0("tsne2")) + t2 + ggtitle(paste0("AUTO_CLUST", "\n", samp)) +
        theme(legend.position = "bottom")
      # print(pb2)
      
      grid.arrange(p1c, p2c,
                   ncol = 2)
      grid.arrange(p1d, p2d,
                   ncol = 2)
      grid.arrange(pb1,
                   pb2,
                   ncol = 2)
      
      
    }
  }
}
dev.off()
