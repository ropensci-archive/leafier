#' Boundary Box
#'
#' This function intersects a boundary box with a spatial object
#' @param spgeom within the for-loop working through movements, use the details from the current movement, which will be described as a row in a dataframe.
#' @param top does the movement match any cows? If these cows are to be shifted, stats about the cows are can be calcuated if TRUE. Default is TRUE.
#' @param left what are the weights of the cows that will be shifted in this movement? Format is vector of numbers.
#' @param bottom Leave a comment describing the success or failure of the movement. Format is a string.
#' @param right Leave a comment describing the success or failure of the movement. Format is a string.
#' @keywords boundary, box
#' @export
#' @examples
#' \dontrun{
#'      inter = geom.subset(bikeways2015, -27.460070, 153.020613, -27.480243, 153.030741)
#'      leaflet() %>% addTiles() %>% addPolylines(data=inter) 
#'      }

geom.subset <- function( spgeom, top, left, bottom, right ){
	coords <- data.frame(y = c(left, right, right, left ), x =c(top, top, bottom, bottom) )
	poly <-  sp::Polygon(coords)
	polys <- sp::Polygons( list(poly) , ID =0)
	polys.spatial <- SpatialPolygons(list(polys), proj4string =  spgeom@proj4string)
	inter <- rgeos::gIntersection(spgeom, polys.spatial, byid =TRUE)
	return(inter)
} 

 
