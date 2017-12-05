file = "2017-01-23_PANEL 2_DHS_Group one_F1636334_010.fcs"

file = "2017-01-23_PANEL 2_DHS_Group one_F1638605_013.fcs"
file = "2016-09-13_PANEL 2_DHS_Group one_F1631262_014.fcs"
file = "2016-12-12_PANEL 2_DHS_Group two_F1636111_040.fcs"
file = "2016-05-11_PANEL 2_ZF_panel 2_F1631920_007.fcs"
file = "2016-12-01_PANEL 2_HB_group one_F1652726_008.fcs"
file = "2017-04-14_PANEL 2_FORTESSA_RR_group two_F1642602_025.fcs"
file="2017-01-19_PANEL 2_HB_group one_F1652578_006.fcs"

file="2017-02-09_PANEL 2_RR_group one_F1652523_005.fcs"
file="2017-01-12_PANEL 2_HB_group one_F1638549_006.fcs"
file="2017-01-19_PANEL 2_HB_group one_F1652578_006.fcs"
	file="2017-02-09_PANEL 2_HB_group two_F1652965_006.fcs"
file="2017-01-30_PANEL 2_ZF_group one_F1652753_010.fcs"
source(file = "generateFortessa.R")

frame = read.FCS(paste(inputDir, file, sep = ""))

templateMono = "~/git/auto-fcs/explore/openCyto/dc.dev.LSR.c.txt"
if (getMachineType(frame) == "FORTESSA") {
  templateMonoFortessa = convertP2ToFortessa(templateFile = templateMono, outputDir = outputDir)
  
  gt_mono <-
    gatingTemplate(templateMonoFortessa, autostart = 1L)
  print(getMachineType(frame))
  
}else {
  gt_mono <-
    gatingTemplate(templateMono, autostart = 1L)
}

    gateTemplate = gt_mono
    
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
              mapping = aes(x = "FSC-A", y = "SSC-A"),
              subset = "Singlets") +
    geom_hex(bins = 100) + ggcyto_par_set(limits = "data") + geom_gate()
 ggcyto(gs1,
                mapping = aes(x = "CD3", y = "CD19"),
                subset = "PBMC") +
    geom_hex(bins = 100) + ggcyto_par_set(limits = "data") + geom_gate()   
ggcyto(gs1,
       mapping = aes(x = "CD14"),
       subset = "D_NK_M") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300) + geom_gate("CD14_MinusTrim")

  
     ggcyto(gs1,
              mapping = aes(x = "CD14", y = "CD16"),
              subset = "D_NK_M") +
    geom_hex(bins = 100) + ggcyto_par_set(limits = "data") + geom_gate()
  
 
empty <- ggplot()+geom_point(aes(1,1), colour="white")+
         theme(axis.ticks=element_blank(), 
               panel.background=element_blank(), 
               axis.text.x=element_blank(), axis.text.y=element_blank(),           
               axis.title.x=element_blank(), axis.title.y=element_blank())      
scatter =   ggcyto(gs1,
              mapping = aes(x = "CD14", y = "CD16"),
              subset = "D_NK_M") +
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate()+ geom_stats("NonClassT")+geom_stats("ClassT")
   
    
hist_top =   ggcyto(gs1,
       mapping = aes(x = "CD14"),
       subset = "D_NK_M") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300) 
       hist_right =   ggcyto(gs1,
       mapping = aes(x = "CD16"),
       subset = "D_NK_M") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300)
    
grid.arrange(as.ggplot(hist_top), empty, as.ggplot(scatter) + theme(legend.position="none"), as.ggplot(hist_right)+coord_flip(), ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))
   