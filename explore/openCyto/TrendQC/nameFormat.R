
testFrame="/Volumes/Beta/data/flow/results_r25_23full_SS_SubCD8_SCD14_Manuals/all.totalCellCounts.metrics.txt"
frame =read.delim(testFrame, stringsAsFactors = FALSE, sep = "\t")
nameColumn="FILE"
parseQCVars <- function(frame,nameColumn){

  frame$formatName=frame[,c(nameColumn)]
  frame$formatName = gsub("*./","", frame$formatName )
  frame$DATE=gsub(" .*","", frame$formatName ) 
  frame$DATE=gsub("_PANEL.*","", frame$DATE ) 
  frame$DATE=gsub("-PANEL.*","", frame$DATE ) 
  frame$DATE=gsub("PANEL.*","", frame$DATE ) 
  frame$DATE=gsub("_","-", frame$DATE ) 
  
  return(frame)
}

frame=parseQCVars(frame=frame,nameColumn=nameColumn)

write.table(
  frame,
  file =
    paste0(testFrame,".testFormat.txt"),
  row.names = FALSE,
  quote = FALSE,
  sep = "\t"
)

  