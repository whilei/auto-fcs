




convertP1ToFortessa <- function(templateFile, outputDir,spliceFile) {
  outFile = paste0(outputDir, basename(gsub("LSR", "FORTESSA", templateFile)))
  template = read.delim(templateFile, stringsAsFactors = FALSE)
  template[which(template$pop == "boundary"), c("gating_args")] = "min=c(5e4,0),max=c(2.5e5,1.25e5)"
  
  templateSplice = read.delim(spliceFile, stringsAsFactors = FALSE)
  
  top =grep("PE-A-",template$alias)
  templateTop =template[c(1:grep("PE-A-",template$alias)),]
  
  templateBot =template[c(grep("^CD27$",template$alias):length(rownames(template))),]

  template =rbind(templateTop,templateSplice)
  template =rbind(template,templateBot)
  
  write.table(
    x = template,
    file = outFile,
    row.names = FALSE,
    quote = FALSE,
    sep = "\t"
  )
  return(outFile)
}

convertP2ToFortessa <- function(templateFile, outputDir) {
  outFile = paste0(outputDir, basename(gsub("LSR", "FORTESSA", templateFile)))
  template = read.delim(templateFile, stringsAsFactors = FALSE)
  # p2 might not need CD3 cut  
  template[which(template$pop == "CD19+/-"), c("gating_args")] = "gate_range=c(100,155),adjust=1.5"
  template[which(template$alias == "Mono"), c("gating_args")] = "tol=5e-4, positive = TRUE,side='left',num_peaks=2,ref_peak=2,adjust=2,strict=FALSE,max=160"
  
  write.table(
    x = template,
    file = outFile,
    row.names = FALSE,
    quote = FALSE,
    sep = "\t"
  )
  return(outFile)
}


convertP1SpecialCD8Gate <- function(templateFile, outputDir) {
  outFile = paste0(outputDir, basename(templateFile),".specialCD8.txt")
  template = read.delim(templateFile, stringsAsFactors = FALSE)
  # p2 might not need CD3 cut  
  template[which(template$alias == "CD8"), c("gating_args")] = "CD4Expand:CD8POne"
 
  write.table(
    x = template,
    file = outFile,
    row.names = FALSE,
    quote = FALSE,
    sep = "\t"
  )
  return(outFile)
}

convertP2SpecialSingletGate <- function(templateFile, outputDir) {
  outFile = paste0(outputDir, basename(templateFile),".specialSinglet.txt")
  template = read.delim(templateFile, stringsAsFactors = FALSE)
  # p2 might not need CD3 cut  
  template[which(template$alias == "SingletsW"), c("gating_args")] = "tol=9e-6,num_peaks=2,ref_peak=2,strict=FALSE,adjust=1.7"
  template[which(template$alias == "SingletsH"), c("gating_args")] = "tol=5e-7,num_peaks=3,ref_peak=3,strict=FALSE"
  template[which(template$alias == "SingletsH"), c("parent")] = "SingletsW"
  
  write.table(
    x = template,
    file = outFile,
    row.names = FALSE,
    quote = FALSE,
    sep = "\t"
  )
  return(outFile)
}

convertP2SpecialCD14Gate <- function(templateFile, outputDir) {
  outFile = paste0(outputDir, basename(templateFile),".specialCD14.txt")
  template = read.delim(templateFile, stringsAsFactors = FALSE)
  template[which(template$alias == "CD14_MinusTmp"), c("gating_args")] = "tol=9e-6, positive = FALSE,side='right',num_peaks=2,ref_peak=1,min=65,adjust=1.5"
  template[which(template$alias == "CD14_MinusTmp"), c("gating_method")] = "errorCorrectTailgate"
  
  template[which(template$pop == "CD14+/-"), c("gating_args")] = "gate_range=c(70,160),max=175,adjust=1.2"
  
  
  write.table(
    x = template,
    file = outFile,
    row.names = FALSE,
    quote = FALSE,
    sep = "\t"
  )
  return(outFile)
}