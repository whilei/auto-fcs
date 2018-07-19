



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
