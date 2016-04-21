#' @include leafier-internal.R misc.R

#' @rdname simplifyData
#' @method simplifyData SpatialPoints
#' @export 
simplifyData.SpatialPoints <- function(x, tol) {
	return(x)
}

#' @rdname simplifyData
#' @method simplifyData SpatialLines
#' @export 
simplifyData.SpatialLines <- function(x, tol) {
	gSimplify(x, as.numeric(tol))
}

#' @rdname simplifyData
#' @method simplifyData SpatialPolygons
#' @export 
simplifyData.SpatialPolygons <- function(x, tol) {
	gSimplify(x, as.numeric(tol))
}

