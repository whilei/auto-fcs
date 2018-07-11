library(openCyto)
library(flowCore)
library(data.table)
library(ggcyto)
library(gridExtra)


## NOTE: this example is targetted to Panel2 samples only, run on the LSR machine
## NOTE: the example sample below is not an example of a "perfect" gate, but just an example

# OpenCyto allows you to create custom gating methods, this is an example that takes the union of two other gates
.intersectGate <-
  function(fr,
           pp_res,
           channels = NA,
           filterId = "",
           ...) {
    xs <-
      exprs(fr[, c(channels)]) # extract just the parameter values being inspected
    print(max(xs[, 1]))
    print(min(xs[, 1]))
    
    if (length(channels) == 2) {
      print(max(xs[, 2]))
      print(min(xs[, 2]))
      c1 = (c(min(xs[, 1]), max(xs[, 1])))
      c2 = (c(min(xs[, 2]), max(xs[, 2])))
      
      gate_coordinates = list(c1, c2)
      names(gate_coordinates) <- channels
      return(rectangleGate(gate_coordinates))
    } else{
      # https://rdrr.io/bioc/openCyto/src/R/gating-functions.R
      gate_coordinates <- list(c(-Inf, min(xs[, 1])))
      names(gate_coordinates) <- channels
      rectangleGate(gate_coordinates, filterId = filterId)
    }
  }

#This registers the intersectGate function for use in OpenCyto
registerPlugins(fun = .intersectGate,
                methodName = "intersectGate",
                dep = 'mvtnorm',
                "gating")

# This template defines how the gates will be applied
templateMono = "./example.template.txt"


#This loads the template into a gating template
panel2LSRGatingTemplate <-
  gatingTemplate(templateMono, autostart = 1L, strict = FALSE)


# This is a data transformation that is similar to what is used in flowjo
biexpTrans <-
  flowJo_biexp_trans(
    channelRange = 256,
    maxValue = 262144.0000291775 ,
    pos = 4.418539922,
    neg = 0,
    widthBasis = -100
  )


## NOTE: to extend to gating multiple fcs files, the below could be put in a for-loop around all fcs files to gate


# test file for a panel2, LSR fcs file
# replace file= and  inputDir= with a local test file to run
file = "2017-06-29_PANEL 2_LSR_ZF_HB_Group two_ZF_F1632834_022.fcs"
inputDir = "/Volumes/Beta2/flow/example/"

# Load the fcs file
frame = read.FCS(paste(inputDir, file, sep = ""))

# extract compensation matrix
comp <- compensation(keyword(frame)$`SPILL`)

# Extract channels to transform
chnls <- parameters(comp)
tf <- transformerList(chnls, biexpTrans)

frames = c(frame)
names(frames) = c(basename(file))
fs =  as(frames, "flowSet")

gs1 <- GatingSet(fs)
print(paste("compensating ....", file))

gs1 <- compensate(gs1, comp)

print(paste("transforming ....", file))
gs1 <- transform(gs1, tf)


print(paste("gating ....", file))
gh <- gs1[[1]]
gating(panel2LSRGatingTemplate, gs1)


# Looks like we are not the only ones with getting the plotting error
# https://stackoverflow.com/questions/51267692/autoplot-error-when-using-ggcyto-bioconductor-package-ggplot-data-frame-not/51273898
# https://github.com/RGLab/ggcyto/issues/37

# install.packages("devtools")
# devtools::install_github("RGLab/ggcyto", ref='trunk')


#Simple plot of  an example gate, in the case below, plot PBMCs on the CD3, CD19 axes, with the Dendritic cells Natural killer cells Monocytes gate highlighted



ggcyto(gs1,
       mapping = aes(x = "CD3", y = "CD19"),
       subset = "PBMC") +
  geom_hex(bins = 100) + ggcyto_par_set(limits = "data") + geom_gate()
