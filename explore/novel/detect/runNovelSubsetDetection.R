library(optparse)
library(flowCore)
library(flowWorkspace)

option_list = list(
  make_option(
    c("-wf", "--workspaceFiles"),
    type = "character",
    default = NULL,
    help = "text file listing workspace files to use",
    metavar = "character"
  ),
  make_option(
    c("-f", "--fcsDir"),
    type = "character",
    help = "location of .fcs files, all files in workspaces must be here",
    metavar = "character"
  )
  ,
  make_option(
    c("-o", "--outputDir"),
    type = "character",
    help = "output directory",
    metavar = "character"
  )
  ,
  make_option(
    c("-r", "--repoDir"),
    default = "~/git/auto-fcs/explore/novel/",
    type = "character",
    help = "full path to repo directory with (includes kmeansGateTCellSubs.R)",
    metavar = "character"
  )
)


opt_parser = OptionParser(option_list = option_list)

opt = parse_args(opt_parser)
print(opt)



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

wsps = read.delim(
  "/Users/Kitty/git/auto-fcs/explore/novel/testInput.txt",
  stringsAsFactors = FALSE,
  header = FALSE
)
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
  wspFile = df[which(df$FCS == file),]$WSP
  print(wspFile)
  frame = read.FCS(paste(opt$fcsDir, file, sep = ""))
  
  try(if (getPanel(frame) == "panel1") {
    ws <- openWorkspace(wspFile)
    s = getSamples(ws)
    print(paste("processing ", file, "starting from", wspFile))
    
    
    id = s[which(s$name == file),]$name
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
    cluster(
      fcsFile = file,
      gs = gs,
      outputDir = opt$outputDir,
      frame = frame
    )
    print(paste("completed processing ", file, "starting from", wspFile))
    
    
    closeWorkspace(ws)
  })
}
