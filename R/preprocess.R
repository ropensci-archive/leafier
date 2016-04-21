#' @include leafier-internal.R misc.R SimpleSpatialPointsDataFrame.R SimpleSpatialLinesDataFrame.R SimpleSpatialPolygonsDataFrame.R simplifyData.R

#' @rdname preprocess
#' @method preprocess SpatialPointsDataFrame
#' @export
preprocess.SpatialPointsDataFrame <- function(x, zoom.level=1:12, simplify.tolerance=1:12) {
	SimpleSpatialPointsDataFrame(
		data=x@data,
		points=Map(simplifyData.SpatialPoints, x=list(x)[rep(1, length(zoom.level))], tol=simplify.tolerance),
		zoom.level=zoom.level,
		simplify.tolerance=simplify.tolerance
	)
}

#' @rdname preprocess
#' @method preprocess SpatialLinesDataFrame
#' @export
preprocess.SpatialLinesDataFrame <- function(x, zoom.level=1:12, simplify.tolerance=1:12) {
	SimpleSpatialLinesDataFrame(
		data=x@data,
		lines=Map(simplifyData.SpatialLines, x=list(x)[rep(1, length(zoom.level))], tol=simplify.tolerance),
		zoom.level=zoom.level,
		simplify.tolerance=simplify.tolerance
	)
}

#' @rdname preprocess
#' @method preprocess SpatialPolygonsDataFrame
#' @export
preprocess.SpatialPolygonsDataFrame <- function(x, zoom.level=1:12, simplify.tolerance=1:12) {
	SimpleSpatialPolygonsDataFrame(
		data=x@data,
		polygons=Map(simplifyData.SpatialPolygons, x=list(x)[rep(1, length(zoom.level))], tol=simplify.tolerance),
		zoom.level=zoom.level,
		simplify.tolerance=simplify.tolerance
	)
}

