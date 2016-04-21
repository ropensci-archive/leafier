#' @include leafier-internal.R misc.R SimpleSpatialDataFrame.R

#' SimpleSpatialPolygonsDataFrame: An S4 class to represent simplified \code{SpatialPolygonsDataFrame} objects
#'
#' This class is used to store simplified \code{SpatialPolygonsDataFrame} objects.
#'
#' @slot data \code{data.frame}.
#' @slot polygons \code{list} of \code{SpatialPolygons} objects.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
setClass("SimpleSpatialPolygonsDataFrame",
	representation(
		polygons="list"
	),
	contains='SimpleSpatialDataFrame',
	validity=function(object) {
		return(TRUE)
	}
)

#' Create SimpleSpatialPolygonsDataFrame object
#'
#' This function creates a new SimpleSpatialPolygonsDataFrame object
#'
#' @slot data \code{data.frame}.
#' @slot polygons \code{list} of \code{SpatialPolygons} objects.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
SimpleSpatialPolygonsDataFrame <- function(data, polygons, zoom.level, simplify.tolerance) {
	x <- new('SimpleSpatialPolygonsDataFrame', data=data, polygons=polygons, zoom.level=as.numeric(zoom.level), simplify.tolerance=as.numeric(simplify.tolerance))
	validObject(x, test=FALSE)
	return(x)
}

#' @rdname get.zoom.level
#' @method get.zoom.level SimpleSpatialPolygonsDataFrame
#' @export
get.zoom.level.SimpleSpatialPolygonsDataFrame <- function(x, zoom.level) {
	SpatialPolygonsDataFrame(
		x@polygons[[zoom.level]],
		data=x@data
	)
}

