#' @include leafier-internal.R misc.R SimpleSpatialDataFrame.R

#' SimpleSpatialPointsDataFrame: An S4 class to represent simplified \code{SpatialPointsDataFrame} objects
#'
#' This class is used to store simplified \code{SpatialPointsDataFrame} objects.
#'
#' @slot data \code{data.frame}.
#' @slot points \code{list} of \code{SpatialPolygons} objects.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
setClass("SimpleSpatialPointsDataFrame",
	representation(
		points="list"
	),
	contains='SimpleSpatialDataFrame',
	validity=function(object) {
		return(TRUE)
	}
)

#' Create SimpleSpatialPointsDataFrame object
#'
#' This function creates a new SimpleSpatialPointsDataFrame object.
#'
#' @slot data \code{data.frame}.
#' @slot points \code{list} of \code{SpatialPolygons} objects.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
SimpleSpatialPointsDataFrame <- function(data, points, zoom.level, simplify.tolerance) {
	x <- new('SimpleSpatialPointsDataFrame', data=data, points=points, zoom.level=as.numeric(zoom.level), simplify.tolerance=as.numeric(simplify.tolerance))
	validObject(x, test=FALSE)
	return(x)
}

#' @rdname get.zoom.level
#' @method get.zoom.level SimpleSpatialPointsDataFrame
#' @export
get.zoom.level.SimpleSpatialPointsDataFrame <- function(x, zoom.level) {
	SpatialPointsDataFrame(
		x@points[[zoom.level]],
		data=x@data
	)
}

