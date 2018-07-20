library(shiny)
library(plotly)
library(RColorBrewer)
library(scales)
library(shinyWidgets)
library(reshape2)
library(superheat)


summary <- readRDS("data/summary.rds")

theme_set(theme_bw(15))

nms <- names(summary)

normmarkers = nms[grepl(pattern = "_SCALED_CENTROID", nms)]
normmarkers = normmarkers[!grepl(pattern = "SAMPLE", normmarkers)]
rawMarkers = nms[grepl(pattern = "_RAW_CENTROID", nms)]
rawMarkers = rawMarkers[!grepl(pattern = "SAMPLE", rawMarkers)]


markers = c(normmarkers, rawMarkers)
markers = markers[!grepl(pattern = "SAMPLE", markers)]
markers = sort(markers)

pops = sort(nms[grepl(pattern = "_ClusterFreq", nms)])

myPalette <-
  colorRampPalette(rev(brewer.pal(11, "Spectral")))
scNormMarkers <-
  scale_colour_gradientn(colours = myPalette(100),
                         limits = c(-2, 2),
                         oob = squish)
scRawMarkers <-
  scale_colour_gradientn(colours = myPalette(100),
                         limits = c(-10, 220),
                         oob = squish)


scPops <-
  scale_colour_gradientn(colours = myPalette(100),
                         limits = c(0, 1),
                         oob = squish)
clusters = c("META_CLUSTER", "PHENOGRAPH_CLUSTER")
facets = c("EXPERIMENTER", "CTL")

colorMe <- function(color, pg) {
  if (color %in% normmarkers) {
    pg <- pg + scNormMarkers
  } else if (color %in% pops) {
    pg <- pg + scPops
  } else if (color %in% rawMarkers) {
    pg <- pg + scRawMarkers
  }
  return(pg)
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
      selected = "CD45RA_RAW_CENTROID"
    ),
    selectInput(
      'bottomcolor',
      'Bottom Plot Color',
      choices = options,
      selected = "CCR7_RAW_CENTROID"
    ),
    
    # selectInput('facet_col', 'Facet Column', c(None = '.', facets), selected = "."),
    # selectInput('facet_col', 'Facet Column', c(None = '.', c("."))),
    sliderInput(
      'plotHeight',
      'Height of plot (in pixels)',
      min = 100,
      max = 1000,
      value = 700
    ),
    pickerInput(
      inputId = "metaclusters",
      label = "Meta clusters to characterize",
      choices = sort(unique(summary$META_CLUSTER)),
      options = list(`actions-box` = TRUE),
      multiple = TRUE,
      selected = unique(summary$META_CLUSTER)
    )
    
  ),
  mainPanel(
    tabsetPanel(
      type = "tabs",
      tabPanel("Example",
               includeMarkdown("example.Rmd")),
      tabPanel("Tsne Plots", plotlyOutput('tsnePlot', height = "1000px")),
      tabPanel("Raw Heatmap",
               plotOutput('rawheat', height = "700px")),
      tabPanel("Normalized Heatmap",
               plotOutput('normheat', height = "700px")),
      tabPanel(
        "Distributions",
        plotlyOutput('characterPlot', height = "1000px")
      )
    )
  )
)

server <- function(input, output) {
  dataset <- reactive({
    summary[(summary$META_CLUSTER %in% input$metaclusters),]
  })
  
  output$tsnePlot <- renderPlotly({
    p1g <-
      ggplot(dataset(),
             aes_string(
               x = input$x,
               y = input$y,
               color = input$topcolor
             )) +
      geom_point() + theme(legend.position = "none")
    
    p2g <-
      ggplot(dataset(),
             aes_string(
               x = input$x,
               y = input$y,
               color = input$middlecolor
             )) +
      geom_point() + theme(legend.position = "none")
    
    p3g <-
      ggplot(dataset(),
             aes_string(
               x = input$x,
               y = input$y,
               color = input$bottomcolor
             )) +
      geom_point() + theme(legend.position = "none")
    
    p1g = colorMe(color = input$topcolor , pg = p1g)
    p2g = colorMe(color = input$middlecolor , pg = p2g)
    p3g = colorMe(color = input$bottomcolor , pg = p3g)
    
    # if at least one facet column/row is specified, add it
    if (!is.null(input$facet_col)) {
      facets <- paste(input$facet_col)
      if (facets != '.') {
        p1g <- p1g + facet_grid(facets)
        p2g <- p2g + facet_grid(facets)
        p3g <- p3g + facet_grid(facets)
        
      }
    }
    
    p1 = ggplotly(p1g)
    p2 = ggplotly(p2g)
    p3 = ggplotly(p3g)
    
    p <- subplot(p1, p2, p3, nrows = 3, shareX = TRUE) %>%
      
      layout(height = input$plotHeight, autosize = TRUE)
  })
  
  
  output$characterPlot <- renderPlotly({
    subBM = melt(dataset()[, c("META_CLUSTER", normmarkers), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_SCALED_CENTROID", "", subBM$variable)
    
    g1g = ggplot(subBM)  +
      xlab("marker") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_boxplot(aes(x = variable,
                                                                                                   y = value, color = META_CLUSTER)) + ylab("scaled expression")  + theme(legend.position = "none")
    g1 = ggplotly(g1g) %>% layout(height = input$plotHeight, autosize = TRUE)
    
    subBM = melt(dataset()[, c("META_CLUSTER", rawMarkers), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_RAW_CENTROID", "", subBM$variable)
    
    g2g = ggplot(subBM)  +
      xlab("marker") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + geom_boxplot(aes(x = variable,
                                                                                                   y = value, color = META_CLUSTER)) + ylab("raw expression") + theme(legend.position = "none")
    g2 = ggplotly(g2g)
    
    p <- subplot(g1, g2, nrows = 2, shareX = TRUE) %>%
      layout(height = input$plotHeight, autosize = TRUE)
    
  })
  
  output$rawheat <- renderPlot({
    getHeat(markers = rawMarkers,
            type = "_RAW_CENTROID",
            data = dataset())
    
  })
  output$normheat <- renderPlot({
    getHeat(markers = normmarkers,
            type = "_SCALED_CENTROID",
            data = dataset())
    
  })
}

shinyApp(ui, server)


# rsconnect::deployApp('/Users/Kitty/git/auto-fcs/explore/novel/metaClusters/')
