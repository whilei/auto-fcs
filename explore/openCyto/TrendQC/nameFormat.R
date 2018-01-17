




# testFrame="/Volumes/Beta/data/flow/results_r25_23full_SS_SubCD8_SCD14_Manuals/all.totalCellCounts.metrics.txt"
# frame =read.delim(testFrame, stringsAsFactors = FALSE, sep = "\t")
# nameColumn="FILE"
parseDate <- function(frame, nameColumn, removeNA = TRUE) {
  frame$formatName = frame[, c(nameColumn)]
  frame$formatName = gsub(".*/", "", frame$formatName)
  frame$DATE = gsub(" .*", "", frame$formatName)
  frame$DATE = gsub("_PANEL.*", "", frame$DATE)
  frame$DATE = gsub("-PANEL.*", "", frame$DATE)
  frame$DATE = gsub("PANEL.*", "", frame$DATE)
  frame$DATE = gsub("_", "-", frame$DATE)
  frame$DATE = as.Date(frame$DATE)
  frame$DATE_MONTH <- as.Date(cut(frame$DATE,
                                  breaks = "month"))
  frame$DATE_WEEK <- as.Date(cut(frame$DATE,
                                 breaks = "week"))
  if (removeNA==TRUE) {
    frame = frame[which(!is.na(frame$DATE)),]
  }
  return(frame)
}

parseExperimenter <- function(frame, nameColumn, removeNA = TRUE) {
  require(stringr)
  frame$formatExp = frame[, c(nameColumn)]
  frame$formatName = gsub(".*/", "", frame$formatName)
  frame$FILE = frame$formatName
  exps = c("HB", "ZF", "DHS", "RR", "EC")
  frame$EXPERIMENTER = NA
  num = 1
  for (name in frame$formatExp) {
    # print(num)
    num = num + 1
    max = -1
    experimenter = NA
    for (exp in exps) {
      t = as.data.frame(str_locate(name, exp))
      if (!is.na(t$start) & t$start > max) {
        experimenter = exp
        max = t$start
        # print(paste0(exp,t$start,max))
        
      }
    }
    frame[which(frame$formatExp == name), ]$EXPERIMENTER = experimenter
  }
  if (removeNA==TRUE) {
    frame = frame[which(!is.na(frame$EXPERIMENTER)),]
  }
  
  return(frame)
  
  
  
  
}




# frame=parseQCVars(frame=frame,nameColumn=nameColumn)
#
