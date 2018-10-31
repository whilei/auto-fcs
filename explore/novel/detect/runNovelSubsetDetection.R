library(optparse)
library(flowCore)
library(flowWorkspace)
library(cytofkit)
library(scales)
library(ClusterR)

option_list = list(
  make_option(
    c("-wf", "--workspaceFiles"),
    type = "character",
    default = "/Users/Kitty/git/auto-fcs/explore/novel/testInput.txt",
    help = "text file listing workspace files to use",
    metavar = "character"
  ),
  make_option(
    c("-f", "--fcsDir"),
    type = "character",
    help = "location of .fcs files, all files in workspaces must be here",
    metavar = "character",
    default = "/Volumes/Beta2/flow/testNovels/"
  )
  ,
  make_option(
    c("-o", "--outputDir"),
    type = "character",
    help = "output directory",
    metavar = "character",
    default = "/Volumes/Beta2/flow/testNovelsOut/"
    
  )
  ,
  make_option(
    c("-r", "--repoDir"),
    default = "~/git/auto-fcs/explore/novel/detect/",
    type = "character",
    help = "full path to repo directory with (includes kmeansGateTCellSubs.R)",
    metavar = "character"
  ) ,
  make_option(
    c("-s", "--subsetGate"),
    default = "Live cells (PE-)",
    type = "character",
    help = "Initial gate to subset to",
    metavar = "character"
  )
)



opt_parser = OptionParser(option_list = option_list)

opt = parse_args(opt_parser)
print(opt)

subsetGate = opt$subsetGate


source(paste0(opt$repoDir, "DetectSubsets.R"))

getPanel <-
  function(frame) {
    t = pData(parameters(frame))
    p1Key = "CCR7"
    p2Key = "CD45"
    if (p1Key %in% t$desc) {
      return("panel1")
    } else if (p2Key %in% t$desc) {
      return("panel2")
    } else{
      return("panel_undetermined")
    }
  }

dir.create(opt$outputDir)
print(paste("sending results to", opt$outputDir))

wsps = read.delim(opt$workspaceFiles,
                  stringsAsFactors = FALSE,
                  header = FALSE)

print(paste0("Found ", length(wsps), " wsps", "in file ", opt$workspaceFiles))
df = data.frame(WSP = character(0),
                FCS = character(0))

for (file in wsps) {
  ws <- openWorkspace(file)
  s = getSamples(ws)
  # print(paste(file,"\t",s[2]$name))
  tmp = data.frame(WSP = file,
                   FCS = s[2]$name)
  
  df = rbind(df, tmp)
}

df$WSP = as.character(df$WSP)
for (file in df$FCS) {
  wspFile = df[which(df$FCS == file), ]$WSP
  print(wspFile)
  frame = read.FCS(paste(opt$fcsDir, file, sep = ""))
  
  try(if (getPanel(frame) == "panel1") {
    print(paste("processing ", file, "starting from", wspFile))
    ws <- openWorkspace(wspFile)
    s = getSamples(ws)
    
    
    id = s[which(s$name == file), ]$name
    gs <-
      parseWorkspace(
        ws,
        #WSP file
        path = opt$fcsDir,
        #FCS file
        name = 1,
        #sample group
        subset = id[1],
        #load single fcs file
        isNcdf = FALSE,
        #not memory mapped
        compensation = compensation(keyword(frame)$`SPILL`)
      )
    # gs@compensation=
    # gs <- compensate(gs, compensation(keyword(frame)$`SPILL`))
    names(gs@compensation) = file
    sampleNames(gs) = file
    
    
    outRoot = cluster(
      fcsFile = file,
      gs = gs,
      outputDir = opt$outputDir,
      frame = frame,
      subsetFirst = TRUE,
      normalize = FALSE,
      subsetGate = subsetGate
    )
    # cluster(
    #   fcsFile = file,
    #   gs = gs,
    #   outputDir = opt$outputDir,
    #   frame = frame,
    #   subsetFirst = FALSE,
    #   normalize = TRUE
    # )
    #
    # cluster(
    #   fcsFile = file,
    #   gs = gs,
    #   outputDir = opt$outputDir,
    #   frame = frame,
    #   subsetFirst = TRUE,
    #   normalize = TRUE
    # )
    
    
    boolMatFile = paste0(outRoot, ".OC.POP.matrix.txt.gz")
    if (!file.exists(boolMatFile)) {
      print(paste(
        "extracting all gate definitions for ",
        file,
        "starting from",
        wspFile
      ))
      
      nodes = getNodes(gs, path = "auto")
      
      boolMat = data.frame(ALL = getIndiceMat(gs, "root")[, 1])
      
      for (node in nodes) {
        gatedData = data.frame(DEFINITION = getIndiceMat(gs, subsetGate)[, 1])
        colnames(gatedData) = paste0("OPEN_CYTO_", node)
        boolMat = cbind(boolMat, gatedData)
      }
      gzMat <- gzfile(boolMatFile, "w")
      write.table(
        boolMat,
        file = gzMat ,
        sep = "\t",
        quote = FALSE,
        row.names = FALSE
      )
      close(gzMat)
    } else{
      print(paste0(
        "skipping for",
        outRoot,
        " full boolmat ",
        boolMatFile,
        " exists"
      ))
    }
    
    print(paste("completed processing ", file, "starting from", wspFile))
    
    
    
    
    closeWorkspace(ws)
  })
}

sessionInfo()
