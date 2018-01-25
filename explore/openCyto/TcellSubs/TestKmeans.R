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
channels = c("Comp-BV 421-A",
             "Comp-BV 510-A",
             "Comp-BV 605-A",
             "Comp-BV 711-A")
#list samples in the workspace
s = getSamples(ws)
#for every sample
for (samp in s$name) {
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
  print(samp)
  print(table(getIndiceMat(gs, node)))
  if (length(grep("TRUE", getIndiceMat(gs, node))) < 20000) {
    for (node in nodesOfInterest) {
      gateDef = as.data.frame(getIndiceMat(gs, node))
      gh <- gs[[1]]
      subdata = getData(gh)[gateDef[, node],]
      
      t = as.data.frame(subdata@exprs)[, channels]
      tsne <- cytof_dimReduction(
        data = t,
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
      
      
      clust = scale(t)
      km_rc = KMeans_rcpp(
        clust,
        clusters = 4,
        num_init = 3000,
        max_iters = 3000,
        
        initializer = 'optimal_init',
        threads = 3,
        verbose = T
      )
      
      results$CLUSTER = km_rc$clusters
      
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
      theme_set(theme_grey(base_size = 18))
      results$MANUAL_GATE = gsub("\\(.*", "", results$MANAUL_POP)
      results$MANUAL_GATE = gsub(" helper Tcells", "", results$MANUAL_GATE)
      
      pb1 = ggplot(results,
                   aes(
                     x = tsne_1,
                     y = tsne_2,
                     colour = MANUAL_GATE
                   )) +
        geom_point() +
        xlab(paste0("tsne1")) +
        ylab(paste0("tsne2")) + t2 + ggtitle(paste0("MANUAL", "\n", samp)) +
        theme(legend.position="bottom")
      
      # + theme(legend.position = "none")
      # print(pb)
      
      pb2 = ggplot(results,
                   aes(
                     x = tsne_1,
                     y = tsne_2,
                     colour = as.factor(CLUSTER)
                   )) +
        geom_point() +
        xlab(paste0("tsne1")) +
        ylab(paste0("tsne2")) + t2 + ggtitle(paste0("AUTO_CLUST", "\n", samp)) +
        theme(legend.position="bottom")
      # print(pb2)
      
      grid.arrange(pb1,
                   pb2,
                   ncol = 2,
                   nrow = 1)
      
      
    }
  }
}
dev.off()
