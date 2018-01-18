



library(ggplot2)
library(knitr)
library(MASS)

t2 <- theme(
  axis.line = element_line(colour = "black"),
  axis.text = element_text(colour = "black"),
  axis.ticks = element_line(colour = "black"),
  # panel.grid.major.x = element_blank(),
  panel.grid.minor.x = element_blank(),
  # panel.grid.major.y = element_blank(),
  # panel.grid.minor.y = element_blank(),
  panel.border = element_blank(),
  # panel.background = element_blank(),
  # legend.position="none",
  axis.text.x = element_text(angle = 90, hjust = 1)
)
theme_set(theme_grey(base_size = 18))



load(
  "/Volumes/Beta/data/flow/results_r25_25full_SS_SubCD8_SCD14_Manuals/FULL/all.freq.metrics.PrePostFix.Rdata"
)

results = data.frame()
methods = c("COUNT", "FREQ_PARENT", "FREQ_LYMPH_PBMC")


for (panel in unique(merge$Panel.x)) {
  panelsub = merge[which(merge$Panel.x == panel), ]
  
  for (pop in unique(panelsub$Manual.x)) {
    if (!is.na(pop)) {
      sub = panelsub[which(panelsub$Manual.x == pop), ]
      
      for (method in methods) {
        if (method == "COUNT") {
          testC1 = cor.test(sub$Count.x,
                            sub$Count.y,
                            method = "pearson",
                            na.action =
                              "na.omit")
          testC2 = cor.test(sub$Count.x,
                            sub$Count.y,
                            method = "spearman",
                            na.action =
                              "na.omit")
          pb = ggplot(sub,
                      aes(
                        x = Count.x,
                        y = Count.y,
                        colour = MACHINE.x
                      )) +
            geom_point() +
            xlab(paste0("Count pre-fix")) +
            ylab(paste0("Count post-fix")) + t2 + ggtitle(paste0("Pop=", pop))
          print(pb)
          tmp = data.frame(
            POPULATION = pop,
            N = length(sub$name.x),
            PEARSON = testC1$estimate,
            SPEARMAN = testC2$estimate,
            MEDIAN_PRE = median(Count.x),
            MEDIAN_POST = median(Count.y),
            MEAN_PRE = mean(Count.x),
            MEAN_POST =  mean(Count.y),
            SD_PRE = sd(Count.x),
            SD_POST = sd(Count.y),
            METRIC = method
          )
          
          results = rbind(results, tmp)
          
        }
        if (method == "FREQ_PARENT") {
          testF1 = cor.test(
            sub$freqParent.x,
            sub$freqParent.y,
            method = "pearson",
            na.action =
              "na.omit"
          )
          testF2 = cor.test(
            sub$freqParent.x,
            sub$freqParent.y,
            method = "spearman",
            na.action =
              "na.omit"
          )
          pb = ggplot(sub,
                      aes(
                        x = freqParent.x,
                        y = freqParent.y,
                        colour = MACHINE.x
                      )) +
            geom_point() +
            xlab(paste0("freq Parent pre-fix")) +
            ylab(paste0("freq Parent post-fix")) + t2 + ggtitle(paste0("Pop=", pop))
          print(pb)
          
          tmp = data.frame(
            POPULATION = pop,
            N = length(sub$name.x),
            PEARSON = testF1$estimate,
            SPEARMAN = testF1$estimate,
            MEDIAN_PRE = median(freqParent.x),
            MEDIAN_POST = median(freqParent.y),
            MEAN_PRE = mean(freqParent.x),
            MEAN_POST =  mean(freqParent.y),
            SD_PRE = sd(freqParent.x),
            SD_POST = sd(freqParent.y),
            METRIC = method
          )
          
          results = rbind(results, tmp)
          
        }
        if (method == "FREQ_LYMPH_PBMC") {
          toTestFLPX = "freq_lymph.x"
          toTestFLPY = "freq_lymph.y"
          if (panel == "panel2") {
            toTestFLPX = "freq_PBMC.x"
            toTestFLPY = "freq_PBMC.y"
          }
          
          
          testFLP1 = cor.test(sub[, c(toTestFLPX)], sub[, c(toTestFLPY)], method = "pearson", na.action =
                                "na.omit")
          testFLP2 = cor.test(sub[, c(toTestFLPX)], sub[, c(toTestFLPY)], method = "spearman", na.action =
                                "na.omit")
          
          pb = ggplot(sub,
                      aes(
                        x = sub[, c(toTestFLPX)],
                        y = sub[, c(toTestFLPY)],
                        colour = MACHINE.x
                      )) +
            geom_point() +
            xlab(paste0("freq lymph/pbmc pre-fix")) +
            ylab(paste0("freq lymph/pbmc post-fix")) + t2 + ggtitle(paste0("Pop=", pop))
          print(pb)
          
          tmp = data.frame(
            POPULATION = pop,
            N = length(sub$name.x),
            PEARSON = testFLP1$estimate,
            SPEARMAN = testFLP2$estimate,
            MEDIAN_PRE = median(sub[, c(toTestFLPX)]),
            MEDIAN_POST = median(sub[, c(toTestFLPY)]),
            MEAN_PRE = mean(sub[, c(toTestFLPX)]),
            MEAN_POST =  mean(sub[, c(toTestFLPY)]),
            SD_PRE = sd(sub[, c(toTestFLPX)]),
            SD_POST = sd(sub[, c(toTestFLPY)]),
            METRIC = method
          )
          
          results = rbind(results, tmp)
        }
        
      }
      
    }
    
    
  }
}
