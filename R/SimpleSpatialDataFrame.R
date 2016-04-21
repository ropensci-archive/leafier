#' @include leafier-internal.R misc.R 

#' SimpleSpatialDataFrame: An S4 class to represent simplified \code{SimpleSpatialDataFrame} objects
#'
#' This class is used to store simplified \code{SimpleSpatialDataFrame} objects.
#'
#' @slot data \code{data.frame}.
#' @slot zoom.level \code{numeric} vector of zoom levels.
#' @slot simplify.tolerance \code{numeric} vector simplification tolerance for each zoom level.
#' @export
setClass("SimpleSpatialDataFrame",
	representation(
		data='data.frame',
		zoom.level='numeric',
		simplify.tolerance='numeric'
	),
	validity=function(object) {
		return(TRUE)
	}
)


