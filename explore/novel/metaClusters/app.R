






summary <- readRDS("data/summary.rds")
library(shiny)
library(plotly)
library(RColorBrewer)
library(scales)
library(shinyWidgets)
library(reshape2)


theme_set(theme_bw(15))

nms <- names(summary)

markers = nms[grepl(pattern = "_SCALED_CENTROID", nms)]
markers = markers[!grepl(pattern = "SAMPLE", markers)]

pops = nms[grepl(pattern = "_ClusterFreq", nms)]


myPalette <-
  colorRampPalette(rev(brewer.pal(11, "Spectral")))
scMarkers <-
  scale_colour_gradientn(colours = myPalette(100),
                         limits = c(-2, 2),
                         oob = squish)


scPops <-
  scale_colour_gradientn(colours = myPalette(100),
                         limits = c(0, 1),
                         oob = squish)
clusters = c("META_CLUSTER", "PHENOGRAPH_CLUSTER")
facets = c("EXPERIMENTER", "CTL")

colorMe <- function(color, pg) {
  if (color %in% markers) {
    pg <- pg + scMarkers
  } else if (color %in% pops) {
    pg <- pg + scPops
  }
  return(pg)
}

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
      choices = c(facets, clusters, markers, pops),
      selected = "META_CLUSTER"
    ),
    selectInput(
      'middlecolor',
      'Middle Plot Color',
      choices = c(markers, pops),
      selected = "CD45RA_SCALED_CENTROID"
    ),
    selectInput(
      'bottomcolor',
      'Bottom Plot Color',
      choices = c(markers, pops),
      selected = "CCR7_SCALED_CENTROID"
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
  mainPanel(tabsetPanel(
    type = "tabs",
    tabPanel("Tsne Plots", plotlyOutput('tsnePlot', height = "1000px")),
    tabPanel(
      "Cluster Characteristics",
      plotlyOutput('characterPlot', height = "1000px")
    )
  ))
  # plotlyOutput('tsnePlot', height = "1000px")
)

server <- function(input, output) {
  dataset <- reactive({
    # summary
    summary[(summary$META_CLUSTER %in% input$metaclusters),]
  })
  
  output$tsnePlot <- renderPlotly({
    # build graph with ggplot syntax
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
    subBM = melt(dataset()[, c("META_CLUSTER", markers), ], id.vars = "META_CLUSTER")
    subBM$variable = gsub("_SCALED_CENTROID", "", subBM$variable)
    g = ggplot(subBM) + geom_boxplot(aes(x = variable,
                                         y = value, color = META_CLUSTER)) + ylab("scaled expression") +
      xlab("marker") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
    ggplotly(g) %>% layout(height = input$plotHeight, autosize = TRUE)
    
  })
}

shinyApp(ui, server)


# rsconnect::deployApp('/Users/Kitty/git/auto-fcs/explore/novel/metaClusters/')
