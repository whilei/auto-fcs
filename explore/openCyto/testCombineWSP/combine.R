
library(openCyto)
library(flowCore)
library(data.table)
library(ggcyto)
library(gridExtra)
library(CytoML)
library(flowAI)
library(optparse)

dir="/Volumes/Beta/data/flow/testWSPcombine/wsp/"

wsps = list.files( dir,pattern = "wsp$", recursive = TRUE,full = TRUE)

for(wsp in wsps){
  gs <-
    parseWorkspace(
      ws,
      #WSP file
      path = inputFCSDir,
      #FCS file
      name = 1,
      # execute = FALSE,
      #sample group
      # subset = eval(fileToLoad),
      #load single fcs file
      isNcdf = TRUE
      # #not memory mapped
      # compensation = comp
    )
  
  GatingSet2flowJo(GatingSetList(gates1),outWsp1 )
  
}
