context('05-shinyapp')

test_that('make shiny app', {



	library(shiny)
	library(leaflet)

	ui <- fluidPage(leafletOutput("map"),p())

	server <- function(input, output, session) {
  
		preproc_polygons <- preprocess(polygons, 1:12, 1:12)

		points <- eventReactive(input$recalc, {
			cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
		}, ignoreNULL = FALSE)

		output$mymap <- renderLeaflet({
			leaflet() %>%
				addProviderTiles("Stamen.TonerLite",
					options = providerTileOptions(noWrap = TRUE)
				) %>%
				render(preproc_polygons, bbox=input$map_bounds, zoom.level=input$map_zoom)
		})
	
	}

	shinyApp(ui, server)

	
	
	
	
	
	
	
})
