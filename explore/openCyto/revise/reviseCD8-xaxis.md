
file="2017-01-26_PANEL 1_DHS_Group two_F1638623_035.fcs"
file="2016-11-29_PANEL 1_HB_group one_F1631006_025.fcs"
file="2016-05-13_PANEL 1_ZF_panel one_F1631922_003.fcs"
file="2016-12-27_PANEL 1_ZF_Group two_F1637410_033.fcs"
file="2016-05-23_PANEL 1_DHS_panel one_F1636715_011.fcs"
file="2016-11-28_PANEL 1_DHS_Group two_F1636573_039.fcs"
file="2016-11-29_PANEL 1_HB_group one_F1652719_016.fcs"

oldgate
file="2017-01-10_PANEL 1_HB_Group one_F1636024_006.fcs"
file="2017-01-25_PANEL 1_ZF_Group one_F1637114_013.fcs"
file="2017-01-10_PANEL 1_HB_Group three_ZF_F1638575_039.fcs"
file="2016-12-08_PANEL 1_ZF_Group one_F1652445_005.fcs"
file="2016-12-09_PANEL 1_ZF_Group two_F1636107_027.fcs"
halfway
F1638687_004
F1638593_032
file="2016-11-07_PANEL 1_ZF_Group one_F1636999_009.fcs"

news

file="2016-06-07_PANEL 1_DHS_Group one_F1631352_005.fcs"
file="2016-06-09_PANEL 1_ZF_Group one_F1632288_005.fcs"
file="2017-06-02_PANEL 1_LSR_HB_Group one-ZF_F1635125_029.fcs"
file="2017-08-16_PANEL 1_LSR_EC_Group one_EC_F1640263_006.fcs"

file="2016-05-16_PANEL 1_DHS_panel one_F1632231_009.fcs"
file="2017-06-02_PANEL 1_LSR_HB_Group one-ZF_F1635259_036.fcs"

file="2017-09-07_PANEL 1_LSR_ZF_Group one_EC_F1642139_026.fcs"

file="2017-02-27_PANEL 1_DHS_group one_F1653150_021.fcs"

file="2016-06-27_PANEL 1_DHS_Group one_F1631267_006.fcs"
file="2016-11-18_PANEL 1_HB_HRS-P1-GROUP1_F1635598_022.fcs"
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
    geom_hex(bins = 200) + ggcyto_par_set(limits = "data") + geom_gate()+ geom_stats("CD8")
   
    
hist_top =   ggcyto(gs1,
       mapping = aes(x = "CD4"),
       subset = "Tcells") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300) 
       hist_right =   ggcyto(gs1,
       mapping = aes(x = "CD8"),
       subset = "Tcells") + ggcyto_par_set(limits = "data") + geom_histogram(bins = 300)
    
grid.arrange(as.ggplot(hist_top), empty, as.ggplot(scatter) + theme(legend.position="none"), as.ggplot(hist_right)+coord_flip(), ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))
   