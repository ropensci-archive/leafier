plot_data <- reactive({
        # return null if the map isn't initialized properly
        if(is.null(input$plot_bounds$north)){
                return(NULL)
        }
        # but if it has initialized, then we extract the bounding box of the map
        top=input$plot_bounds$north
        left=input$plot_bounds$west
        bottom=input$plot_bounds$south
        right=input$plot_bounds$east
        # extract simplified data for the current zoom level, and then clip it to the map
        g <- geom.subset(spgeom=bikeways_simple[[as.integer(input$plot_zoom)]],top=top, left=left, bottom=bottom, right=right)
        cat('zoom level = ', input$plot_zoom,
            '; tol = ', tols[as.integer(input$plot_zoom)],
            '; length =',suppressWarnings(gLength(g)),
            '\n')
        # return the clipped data
        return(g)
})

# initialise map
output$plot <- renderLeaflet  ({
        leaflet() %>% addTiles() %>% setView(lng = 153.0292, lat= -27.47228, zoom = 15) %>% addPolylines(data=disaggregate(bikeways), group='base')
})

# add/update the lines in the map
observe({
        pdata <- plot_data()
        # check if the map properly initialized
        if (is.null(pdata)) {return()}
        # but if the map is initialized, then we load the lines
        # this also gets when we pan/zoom
        leafletProxy("plot") %>% clearGroup('line') %>% addPolylines(data=pdata,  color='red', group='line')
})