

panle1mapFile = "/Users/Kitty/git/auto-fcs/explore/openCyto/panel1Map.txt"
panle2mapFile = "/Users/Kitty/git/auto-fcs/explore/openCyto/panel2Map.txt"

setwd(dirname(panle1mapFile))
source(file = "CombineWSP.R")
source(file = "computeFreqs.R")
source(file = "machineType.R")
source(file = "generateFortessa.R")
source(file="kmeansGate.R")


frame = read.FCS(paste(inputDir, file, sep = ""))


if(getMachineType(frame)=="FORTESSA"){
templateLymphFortessa = convertP1ToFortessa(templateFile = templateLymph, outputDir = outputDir,spliceFile = spliceFile)

gt_lymph <-
  gatingTemplate(templateLymphFortessa, autostart = 1L)
  print(getMachineType(frame))
}else{
gt_lymph <-
    gatingTemplate(templateLymph, autostart = 1L)
}

    gateTemplate = gt_lymph
    
print(paste("compensating ....", file))
metrics = data.frame()
comp <- compensation(keyword(frame)$`SPILL`)

chnls <- parameters(comp)
tf <- transformerList(chnls, biexpTrans)

print(paste("gating ....", file))
frames = c(frame)
names(frames) = c(basename(file))
fs =  as(frames, "flowSet")
gs1 <- GatingSet(fs)
gs1 <- compensate(gs1, comp)
gs1 <- transform(gs1, tf)

gh <- gs1[[1]]
gating(gateTemplate, gs1)

   ggcyto(gs1,
              mapping = aes(x = "CD4", y = "CD8"),
              subset = "CD8") +
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate()
    
    ggcyto(gs1,
       mapping = aes(x = "CD4"),
       subset = "CD4-") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300) 
       
   ggcyto(gs1,
              mapping = aes(x = "CD4", y = "CD8"),
              subset = "Tcells") +
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate()+ geom_stats("CD8")
    
    
  




 empty <- ggplot()+geom_point(aes(1,1), colour="white")+
         theme(axis.ticks=element_blank(), 
               panel.background=element_blank(), 
               axis.text.x=element_blank(), axis.text.y=element_blank(),           
               axis.title.x=element_blank(), axis.title.y=element_blank())      
scatter =   ggcyto(gs1,
              mapping = aes(x = "CD4", y = "CD8"),
              subset = "CD8CTOne") +
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate()
   
    
hist_top =   ggcyto(gs1,
       mapping = aes(x = "CD4"),
       subset = "CD8CTOne") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300)   
       hist_right =   ggcyto(gs1,
       mapping = aes(x = "CD8"),
       subset = "CD8CTOne") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300)
    
grid.arrange(as.ggplot(hist_top), empty, as.ggplot(scatter) + theme(legend.position="none"), as.ggplot(hist_right)+coord_flip(), ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))
    
   #+ xlim(c(-50, 250))   

 empty <- ggplot()+geom_point(aes(1,1), colour="white")+
         theme(axis.ticks=element_blank(), 
               panel.background=element_blank(), 
               axis.text.x=element_blank(), axis.text.y=element_blank(),           
               axis.title.x=element_blank(), axis.title.y=element_blank())      
scatter =   ggcyto(gs1,
              mapping = aes(x = "CD4", y = "CD8"),
              subset = "Tcells") +
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate()+ geom_stats()
   
    
hist_top =   ggcyto(gs1,
       mapping = aes(x = "CD4"),
       subset = "Tcells") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300) 
       hist_right =   ggcyto(gs1,
       mapping = aes(x = "CD8"),
       subset = "Tcells") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300)
    
grid.arrange(as.ggplot(hist_top), empty, as.ggplot(scatter) + theme(legend.position="none"), as.ggplot(hist_right)+coord_flip(), ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))

  
  ggcyto(gs1,
              mapping = aes(x = "CD3", y = "CD19"),
              subset = "PE-A-") +
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate() +geom_stats()
    
     