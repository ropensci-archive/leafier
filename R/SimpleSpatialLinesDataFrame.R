#' @include leafier-internal.R misc.R SimpleSpatialDataFrame.R

#' SimpleSpatialLinesDataFrame: An S4 class to represent simplified \code{SpatialLinesDataFrame} objects
#'
#' This class is used to store simplified \code{SpatialLinesDataFrame} objects.
#'
#' @slot data \code{data.frame}.
#' @slot lines \code{list} of \code{SpatialLines} objects.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
setClass("SimpleSpatialLinesDataFrame",
	representation(
		lines="list"
	),
	contains='SimpleSpatialDataFrame',
	validity=function(object) {
		return(TRUE)
	}
)

#' Create SimpleSpatialLinesDataFrame object
#'
#' This function creates a new \code{SimpleSpatialLinesDataFrame} object.
#'
#' @slot data \code{data.frame}.
#' @slot lines \code{list} of \code{SpatialPolygons} objects.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
SimpleSpatialLinesDataFrame <- function(data, lines, zoom.level, simplify.tolerance) {
	x <- new('SimpleSpatialLinesDataFrame', data=data, lines=lines, zoom.level=as.numeric(zoom.level), simplify.tolerance=as.numeric(simplify.tolerance))
	validObject(x, test=FALSE)
	return(x)
}

#' @rdname get.zoom.level
#' @method get.zoom.level SimpleSpatialLinesDataFrame
#' @export
get.zoom.level.SimpleSpatialLinesDataFrame <- function(x, zoom.level) {
	SpatialLinesDataFrame(
		x@lines[[zoom.level]],
		data=x@data
	)
}

