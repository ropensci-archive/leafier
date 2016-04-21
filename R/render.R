#' @include leafier-internal.R misc.R 

#' @rdname render
#' @method render SimpleSpatialPointsDataFrame
#' @export
render.SimpleSpatialPointsDataFrame <- function(map, x, bbox, zoom.level, ...) {
	# extract data for zoom-level and viewing window
	curr.x <- geom.subset(get.zoom.level(x, zoom.level),  bbox[1], bbox[2], bbox[3], bbox[4])
	# render data
	addMarkers(map, x, ...)
}

#' @rdname render
#' @method render SimpleSpatialLinesDataFrame
#' @export
render.SimpleSpatialLinesDataFrame <- function(map, x, bbox, zoom.level, ...) {
	# extract data for zoom-level and viewing window
	curr.x <- geom.subset(get.zoom.level(x, zoom.level), bbox[1], bbox[2], bbox[3], bbox[4])
	# render data
	addPolylines(map, x, ...)
}

#' @rdname render
#' @method render SimpleSpatialPolygonsDataFrame
#' @export
render.SimpleSpatialPolygonsDataFrame <- function(map, x, bbox, zoom.level, ...) {
	# extract data for zoom-level and viewing window
	print('bbox')
	print(bbox)
	curr.x <- geom.subset(get.zoom.level(x, zoom.level),  bbox[1], bbox[2], bbox[3], bbox[4])
	# render data
	addPolygons(map, x, ...)
}

 
 
