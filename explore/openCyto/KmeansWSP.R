library("optparse")

option_list = list(
  make_option(c("-w", "--workspaceDir"), type="character", default=NULL, 
              help="location of .wsp files", metavar="character"),
  make_option(c("-f", "--fcsDir"), type="character", default="out.txt", 
              help="location of .fcs files", metavar="character")
  ,
  make_option(c("-o", "--outpuDir"), type="character", 
              help="output directory", metavar="character")
  ,
  make_option(c("-k", "--kmeansSourceFile"), type="character", 
              help="full path to kmeansGateTCellSubs.R", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

print(opt$workspaceDir)
