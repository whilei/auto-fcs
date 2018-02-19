library("optparse")
library(flowCore)
library(flowWorkspace)

option_list = list(
  make_option(c("-w", "--workspaceDir"), type="character", default=NULL, 
              help="location of .wsp files", metavar="character"),
  make_option(c("-f", "--fcsDir"), type="character", 
              help="location of .fcs files", metavar="character")
  ,
  make_option(c("-o", "--outputDir"), type="character", 
              help="output directory", metavar="character")
  ,
  make_option(c("-k", "--kmeansSourceFile"),default = "kmeansGateTCellSubs.R", type="character", 
              help="full path to kmeansGateTCellSubs.R", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

source(opt$kmeansSourceFile)

dir.create(opt$outputDir)

wsps <-
  list.files(opt$workspaceDir,
             pattern = "wsp$",
             full = TRUE,recursive = TRUE)

print(paste0("Found ",length(wsps)," wsps","in dir ",opt$workspaceDir))
df = data.frame(
  WSP = character(0),
  FCS = character(0)
)

for(file in wsps){
  ws <- openWorkspace(file)
  s= getSamples(ws)
  # print(paste(file,"\t",s[2]$name))
  tmp = data.frame(
    WSP = file,
    FCS = s[2]$name
  )
  
  df = rbind(df,tmp)
}



print(df)



