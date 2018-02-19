library("optparse")
library(flowCore)
library(openCyto)

option_list = list(
  make_option(
    c("-w", "--workspaceDir"),
    type = "character",
    default = NULL,
    help = "location of .wsp files",
    metavar = "character"
  ),
  make_option(
    c("-f", "--fcsDir"),
    type = "character",
    help = "location of .fcs files",
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
    c("-k", "--kmeansSourceFile"),
    default = "kmeansGateTCellSubs.R",
    type = "character",
    help = "full path to kmeansGateTCellSubs.R",
    metavar = "character"
  )
)


opt_parser = OptionParser(option_list = option_list)

opt = parse_args(opt_parser)
opt$workspaceDir = "/Volumes/Beta/data/flow/testTcellSubFCS_BoolResults/"
opt$fcsDir = "/Volumes/Beta/data/flow/testTcellSubFCS/"
opt$outputDir = "/Volumes/Beta/data/flow/testTcellSubWSP_Start/"
opt$kmeansSourceFile = "/Users/Kitty/git/auto-fcs/explore/openCyto/kmeansGateTCellSubs.R"
source(opt$kmeansSourceFile)

dir.create(opt$outputDir)

wsps <-
  list.files(
    opt$workspaceDir,
    pattern = "wsp$",
    full = TRUE,
    recursive = TRUE
  )

print(paste0("Found ", length(wsps), " wsps", "in dir ", opt$workspaceDir))
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
  ws <- openWorkspace(wspFile)
  s = getSamples(ws)
  print(s)
  
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
  
  closeWorkspace(ws)
  
  
}
