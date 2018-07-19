









library(optparse)
option_list = list(
  make_option(
    c("-dir", "--inputDirectory"),
    type = "character",
    help = "input directory with .IntMatrix.txt.gz files",
    metavar = "character",
    default = "/Volumes/Beta2/flow/testSync/"
  ),
  make_option(
    c("-map", "--inputMap"),
    type = "character",
    help = "map file used to re-assign clusters",
    metavar = "character",
    default = "/Users/Kitty/git/auto-fcs/explore/novel/report/summary.metaMap"
  ),
  make_option(
    c("-o", "--outputDir"),
    type = "character",
    help = "output directory",
    metavar = "character",
    default = "/Volumes/Beta2/flow/testSummaryMetaMap/"
  )
)


opt_parser = OptionParser(option_list = option_list)

opt = parse_args(opt_parser)
outDir = opt$outputDir
dir.create(outDir)


intMatFiles = list.files(opt$inputDirectory,
                         full.names = TRUE,
                         pattern = ".IntMatrix.txt.gz$")

metaMap = read.delim(opt$inputMap ,
                     stringsAsFactors = FALSE,
                     header = TRUE)


for (matFile in intMatFiles) {
  print(matFile)
  sample = basename(matFile)
  sample = gsub("_subFirst_TRUE_normalize_FALSE.IntMatrix.txt.gz",
                "",
                sample)
  sampleMeta = metaMap[which(metaMap$SAMPLE == sample), ]
  
  mat = read.delim(matFile ,
                   stringsAsFactors = FALSE,
                   header = TRUE)
  newMat = data.frame(DEF = mat$cytotoxic.Tcells.CD8.)
  if (length(sampleMeta$SAMPLE) > 0) {
    newMat$META_CLUSTER = -1
    for (pOrig in unique(sampleMeta$PHENOGRAPH_CLUSTER)) {
      sub = newMat$DEF == pOrig
      new = sampleMeta[which(sampleMeta$PHENOGRAPH_CLUSTER == pOrig), ]$META_CLUSTER
      newMat$META_CLUSTER[sub] = new
    }
    
    newMat = as.data.frame(newMat[, c("META_CLUSTER")])
    print(length(newMat$`cytotoxic Tcells-CD8+`))
    print(length(mat$cytotoxic.Tcells.CD8.))
    
  } else{
    newMat$DEF = -1
  }
  colnames(newMat) = "cytotoxic Tcells-CD8+"
  t = table(mat$cytotoxic.Tcells.CD8.,
            newMat$`cytotoxic Tcells-CD8+`)
  print(paste0("-1 sums of ", sum(t[1, ]), " and ", sum(t[, 1])))
  
  gz1 <- gzfile(paste0(outDir, basename(matFile)), "w")
  write.table(
    newMat,
    file = gz1 ,
    sep = "\t",
    quote = FALSE,
    row.names = FALSE
  )
  close(gz1)
  
}
