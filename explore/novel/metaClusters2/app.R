library(shiny)
library(plotly)
library(RColorBrewer)
library(scales)
library(shinyWidgets)
library(reshape2)
library(superheat)
library(gridExtra)

# summary <- readRDS("data/summary.rds")
summary <- readRDS("data/summary.CV.rds")
# summary <- readRDS("data/summary.rds")

# summary = summary[order(summary$META_CLUSTER),]
theme_set(theme_bw(15))
maxMeta = 10
nms <- names(summary)

normmarkers = nms[grepl(pattern = "_SCALED_CENTROID", nms)]
normmarkers = normmarkers[!grepl(pattern = "SAMPLE", normmarkers)]
rawMarkers = nms[grepl(pattern = "_RAW_CENTROID", nms)]
rawMarkers = rawMarkers[!grepl(pattern = "SAMPLE", rawMarkers)]


markers = c(normmarkers, rawMarkers)
markers = markers[!grepl(pattern = "SAMPLE", markers)]
markers = sort(markers)
displayMarkers = gsub("_SCALED_CENTROID", "", normmarkers)
pops = nms[grepl(pattern = "_ClusterFreq|_TotalFreq", nms)]

displayPops = gsub("_ClusterFreq", "", pops)
displayPops = unique(gsub("_TotalFreq", "", displayPops))

displayPops = displayPops[!grepl(pattern = "CD28P_27M", displayPops)]

clusters = c("META_CLUSTER", "PHENOGRAPH_CLUSTER")
facets = c("EXPERIMENTER", "CTL", "CTL_CV", "FREQ_PHENOGRAPH_PARENT")

colorMe <- function(color, data) {
  if (color %in% normmarkers) {
    data <- squish(data, range = c(-2, 2))
  } else if (color %in% pops) {
    data <- squish(data, range = c(0, 1))
  } else if (color %in% rawMarkers) {
    data <- squish(data, range = c(10, 200))
  } else if (color %in% c("FREQ_PHENOGRAPH_PARENT")) {
    data <- squish(data, range = c(0, 0.2))
  }
  return(data)
}



getHeat <- function(markers, type, data) {
  subBM = data
  subBM = subBM[order(subBM$META_CLUSTER),]
  subHC = subBM[, c(markers), ]
  colnames(subHC) = gsub(type, "", colnames(subHC))
  
  superheat(
    as.matrix(t(subHC)),
    # make gridlines white for enhanced prettiness
    grid.hline.col = "white",
    grid.vline.col = "white",
    membership.cols = subBM$META_CLUSTER,
    row.dendrogram = T,
    # membership.rows = markersToCluster,
    # rotate bottom label text
    bottom.label.text.angle = 90
  )
}

getTsnePlot <- function(data, x, y, color) {
  ggplot(data,
         aes_string(x = x,
                    y = y,
                    color = color)) +
    geom_point(size = .5) + theme(legend.position = "none")
}

options = c(facets, clusters, markers, pops)

ui <- fluidPage(
  headerPanel("Meta-cluster Explorer"),
  sidebarPanel(
    selectInput(
      'x',
      'X',
      choices = c("metaTsne1"),
      selected = "metaTsne1"
    ),
    selectInput(
      'y',
      'Y',
      choices = c("metaTsne2"),
      selected = "metaTsne2"
    ),
    selectInput(
      'topcolor',
      'Top Plot Color',
      choices = options ,
      selected = "META_CLUSTER"
    ),
    selectInput(
      'middlecolor',
      'Middle Plot Color',
      choices = options,
      selected = "OPEN_CYTO_Helper Tcells-CD4+_ClusterFreq"
    ),
    selectInput(
      'bottomcolor',
      'Bottom Plot Color',
      choices = options,
      selected = "OPEN_CYTO_cytotoxic Tcells-CD8+_ClusterFreq"
    ),
    
    # selectInput('facet_col', 'Facet Column', c(None = '.', facets), selected = "."),
    # selectInput('facet_col', 'Facet Column', c(None = '.', c("."))),
    
    pickerInput(
      inputId = "metaclusters",
      label = "Meta clusters to characterize",
      choices = sort(unique(summary$META_CLUSTER)),
      options = list(`actions-box` = TRUE),
      multiple = TRUE,
      selected = unique(summary$META_CLUSTER)
    ),
    pickerInput(
      inputId = "markerdisplay",
      label = "Markers",
      choices = sort(unique(displayMarkers)),
      options = list(`actions-box` = TRUE),
      multiple = TRUE,
      selected = unique(displayMarkers)
    ),
    pickerInput(
      inputId = "displayPops",
      label = "Known Populations",
      choices = unique(displayPops),
      options = list(`actions-box` = TRUE),
      multiple = TRUE,
      selected = displayPops
    ),
    # sliderInput(
    #   'maxSamples',
    #   'Limit to this many samples',
    #   min = 0,
    #   max = length(unique(summary$SAMPLE)),
    #   value = 200
    # ),
    sliderInput(
      'minN',
      'Minimum number of events in phenograph cluster',
      min = 0,
      max = 10000,
      value = 0
    ),
    sliderInput(
      'plotHeight',
      'Height of plot (in pixels)',
      min = 100,
      max = 1000,
      value = 1000
    )
    ,
    sliderInput(
      'pointSize',
      'Size of tsne points',
      min = 0,
      max = 5,
      value = 2
    ),
    sliderInput(
      'opacity',
      'Opacity of tsne points',
      min = 0,
      max = 1,
      value = .75
    )
    
    
    
    
  ),
  
  # tabPanel("Tsne Plots", plotlyOutput('tsnePlot', height = "1000px")),
  # renderPlotly
  mainPanel(
    verbatimTextOutput("info"),
    
    tabsetPanel(
      type = "tabs",
      tabPanel("Example",
               includeMarkdown("example.md")),
      tabPanel("Tsne Plots", plotlyOutput('tsnePlot', height = "1000px")) ,
      tabPanel("Meta-cluster Counts",
               plotlyOutput('counts', height = "500px")),
      tabPanel("Raw Marker Heatmap",
               plotOutput('rawheat', height = "700px")),
      tabPanel(
        "Normalized Marker Heatmap",
        plotOutput('normheat', height = "700px")
      ),
      tabPanel(
        "Marker Distributions",
        plotOutput('characterPlot', height = "1000px")
      ),
      tabPanel(
        "Population Freq Heatmap",
        plotOutput('clusterPopheat', height = "700px")
      ),
      tabPanel(
        "Total Population Freq Heatmap",
        plotOutput('totalPopheat', height = "700px")
      ),
      tabPanel(
        "Population Distributions",
        plotOutput('popPlot', height = "1000px")
      )
      
    )
  )
)


getPlot <- function(x,
                    y,
                    color,
                    colors,
                    opacity,
                    pointSize,
                    type) {
  if (type %in% c(normmarkers, pops, rawMarkers)) {
    plot_ly(
      x =  x,
      y =  y,
      type = "scattergl",
      mode = "markers",
      color = color,
      colors = colors,
      marker = list(opacity = opacity, size = pointSize)
    )
    # data=dataset(),
  } else{
    plot_ly(
      x =  x,
      y =  y,
      type = "scattergl",
      mode = "markers",
      color = color,
      marker = list(opacity = opacity, size = pointSize)
    )
  }
}
server <- function(input, output) {
  dataset <- reactive({
    subSamples = unique(summary$SAMPLE)
    # if(input$maxSamples<length(subSamples)){
    #   subSamples=subSamples[1:input$maxSamples]
    # }
    current = summary[summary$TOTAL_PHENOGRAPH_COUNTS > input$minN &
                        summary$META_CLUSTER %in% input$metaclusters &
                        summary$SAMPLE %in% subSamples,]
  })
  
  
  output$tsnePlot <- renderPlotly({
    # https://codepen.io/etpinard/pen/XXrzBe
    # nRand <- 10000
    # nPlot <- 25
    # https://plot.ly/r/line-and-scatter/
    x = dataset()[, input$x]
    y = dataset()[, input$y]
    color = colorMe(color = input$topcolor, data = dataset()[, input$topcolor])
    colorscale = 'Viridis'
    pointSize = input$pointSize
    opacity = input$opacity
    myPalette <-
      colorRampPalette(rev(RColorBrewer::brewer.pal(11, "Spectral")))
    # sc <- scale_colour_gradientn(,limits=c(0, 1),oob=squish)
    
    colors = myPalette(100)
    
    # ,color=~input$bottomcolor,colors = ~scRawMarkers
    p1 <-
      getPlot(
        x = x,
        y = y,
        color = color,
        colors = colors,
        opacity = opacity,
        pointSize = pointSize,
        type = input$topcolor
      )
    
    
    color = colorMe(color = input$middlecolor, data = dataset()[, input$middlecolor])
    p2 <-
      plot_ly(
        data = dataset(),
        x =  x,
        y =  y,
        type = "scattergl",
        mode = "markers",
        color = color,
        colors = colors,
        marker = list(opacity = opacity, size = pointSize)
      )
    
    color = colorMe(color = input$bottomcolor, data = dataset()[, input$bottomcolor])
    
    p3 <-
      plot_ly(
        data = dataset(),
        x =  x,
        y =  y,
        type = "scattergl",
        mode = "markers",
        color = color,
        colors = colors,
        marker = list(opacity = opacity, size = pointSize)
      )
    
    p <- subplot(p1, p2, p3, nrows = 3, shareX = TRUE) %>%
      
      layout(
        height = input$plotHeight,
        autosize = TRUE,
        showlegend = F
      )
  })
  
  
  
  output$info = renderText(
    paste0(
      "Currently ",
      length(dataset()$META_CLUSTER),
      " datapoints, ",
      length(unique(dataset()$META_CLUSTER)),
      " meta clusters, and ",
      length(unique(dataset()$SAMPLE)),
      " samples"
    )
  )
  
  output$characterPlot <- renderPlot({
    data = dataset()
    validate(need(
      length(unique(data$META_CLUSTER)) < maxMeta ,
      paste0("please limit the number of  meta-clusters selected to less than ", maxMeta)
    ))
    subBM = melt(data[, c("META_CLUSTER",
                               paste0(input$markerdisplay, "_SCALED_CENTROID")), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_SCALED_CENTROID", "", subBM$variable)
    
    g1g = ggplot(subBM)  +
      xlab("marker") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_boxplot(aes(x = variable,
                                                                                                   y = value, color = META_CLUSTER)) + ylab("scaled expression")
    # g1 = ggplotly(g1g) %>% layout(height = input$plotHeight, autosize = TRUE)
    
    subBM = melt(dataset()[, c("META_CLUSTER",
                               paste0(input$markerdisplay, "_RAW_CENTROID")), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_RAW_CENTROID", "", subBM$variable)
    
    # + theme(legend.position = "none")
    g2g = ggplot(subBM)  +
      xlab("marker") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_boxplot(aes(x = variable,
                                                                                                   y = value, color = META_CLUSTER)) + ylab("raw expression")
    # g2 = ggplotly(g2g)
    
    
    grid.arrange(g1g,
                 g2g,
                 ncol = 1,
                 nrow = 2)
    
    # p <- subplot(g1, g2, nrows = 2, shareX = TRUE) %>%
    #   layout(height = input$plotHeight, autosize = TRUE)
    #
  })
  
  output$popPlot <- renderPlot({
    data = dataset()
    validate(need(
      length(unique(data$META_CLUSTER)) < maxMeta ,
      paste0("please limit the number of  meta-clusters selected to less than ", maxMeta)
    ))
    # displayPops = gsub("_ClusterFreq", "", pops)
    subBM = melt(data[, c("META_CLUSTER",
                          paste0(input$displayPops, "_ClusterFreq")), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_ClusterFreq", "", subBM$variable)
    
    g1g = ggplot(subBM)  +
      xlab("population") + ylab("freq in cluster") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_boxplot(aes(x = variable,
                                                                                                                                 y = value, color = META_CLUSTER))
    # g1 = ggplotly(g1g) %>% layout(height = input$plotHeight, autosize = TRUE)
    # + ylab("scaled expression")  + theme(legend.position = "none")
    
    subBM = melt(dataset()[, c("META_CLUSTER",
                               paste0(input$displayPops, "_TotalFreq")), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_TotalFreq", "", subBM$variable)
    
    # + ylab("raw expression") + theme(legend.position = "none")
    g2g = ggplot(subBM)  +
      xlab("population") + ylab("freq of all events in population")  + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_boxplot(aes(x = variable,
                                                                                                                                                   y = value, color = META_CLUSTER))
    # g2 = ggplotly(g2g)
    
    grid.arrange(g1g,
                 g2g,
                 ncol = 1,
                 nrow = 2)
    # p <- subplot(g1, g2, nrows = 2, shareX = TRUE) %>%
    #   layout(height = input$plotHeight, autosize = TRUE)
    #
  })
  
  output$rawheat <- renderPlot({
    data = dataset()
    validate(need(
      length(unique(data$META_CLUSTER)) < maxMeta ,
      paste0("please limit the number of  meta-clusters selected to less than ", maxMeta)
    ))
    getHeat(
      markers = paste0(input$markerdisplay, "_RAW_CENTROID"),
      type = "_RAW_CENTROID",
      data = data
    )
    
  })
  output$normheat <- renderPlot({
    data = dataset()
    validate(need(
      length(unique(data$META_CLUSTER)) < maxMeta ,
      paste0("please limit the number of  meta-clusters selected to less than ", maxMeta)
    ))
    getHeat(
      markers = paste0(input$markerdisplay, "_SCALED_CENTROID"),
      type = "_SCALED_CENTROID",
      data = data
    )
    
  })
  
  output$clusterPopheat <- renderPlot({
    data = dataset()
    validate(need(
      length(unique(data$META_CLUSTER)) < maxMeta ,
      paste0("please limit the number of  meta-clusters selected to less than ", maxMeta)
    ))
    getHeat(
      markers = paste0(input$displayPops, "_ClusterFreq"),
      type = "_ClusterFreq",
      data = data
    )
    
  })
  output$totalPopheat <- renderPlot({
    data = dataset()
    validate(need(
      length(unique(data$META_CLUSTER)) < maxMeta ,
      paste0("please limit the number of  meta-clusters selected to less than ", maxMeta)
    ))
    # print()
    getHeat(
      markers = paste0(input$displayPops, "_TotalFreq"),
      type = "_TotalFreq",
      data = data
    )
    
  })
  output$counts <- renderPlotly({
    c = as.data.frame(table(unique(dataset()[, c("META_CLUSTER", "SAMPLE")])$META_CLUSTER))
    colnames(c) = c("META_CLUSTER", "NUM_SAMPLES")
    p <-
      plot_ly(
        x = c$META_CLUSTER ,
        y = c$NUM_SAMPLES,
        color = c$META_CLUSTER,
        name = "sample counts"
      ) %>%
      
      layout(height = 500,
             autosize = TRUE,
             showlegend = T)
    
  })
}

shinyApp(ui, server)


# rsconnect::deployApp('/Users/Kitty/git/auto-fcs/explore/novel/metaClusters2/')
