
library(shiny)
library(leaflet)
library(BrisbaneBikeways)
library(dplyr)

geom.subset <- function(spgeom, top, left, bottom, right ){
  
  coords <- data.frame(y = c(left, right, right, left ), x =c(top, top, bottom, bottom) )
  poly <-  sp::Polygon(coords)
  polys <- sp::Polygons( list(poly) , ID =0)
  polys.spatial <- SpatialPolygons(list(polys), proj4string =  spgeom@proj4string)
  inter <- rgeos::gIntersection(spgeom, polys.spatial, byid =TRUE)
} 

bikeways <- bikeways2015#[grepl('BRISBANE', bikeways2015$suburb),]

shinyServer(function(input, output) {
  
  plot_data <- reactive({
    
    if(is.null(input$plot_bounds$north)){
      
      print("plot_data plotbounds = NULL")
      
      return(bikeways)
    }
    
    top=input$plot_bounds$north
    left=input$plot_bounds$west
    bottom=input$plot_bounds$south
    right=input$plot_bounds$east
    
   # print("plot_data is good")
    g <- geom.subset(spgeom=bikeways,top=top, left=left, bottom=bottom, right=right)
    
    print(length(g@lines))
    g
  })
  
  
  output$plot <- renderLeaflet  ({
    
    print("rendering leaflet")
  
    leaflet() %>% addTiles() %>% setView(lng = 153.0292, lat= -27.47228, zoom = 15)
  })
  
  observe({
    data <- plot_data()
    if (is.null(plot_data)) {return()}
    
    print("updating plot")
    
    leafletProxy("plot")%>% addPolylines(data=data)
  })
  
})
