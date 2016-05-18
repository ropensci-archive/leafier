#' @include leafier-internal.R misc.R
#' @title Preprocess objects
#' @rdname preprocess
#'
#' @description This function preprocesses \code{Spatial*} objects.
#'
#' @param x \code{SpatialPointsDataFrame},  \code{SpatialLinesDataFrame}, \code{SpatialPolygonsDataFrame} object.
#' @param zoom.level \code{numeric} with zoom levels at which to pre-process data. Defaults to \code{1:12}.
#' @param simplify.tolerance \code{numeric} tolerance to simplify the data at the specified zoom levels. Defaults to \code{c(1,2,3,4,5,6,7,8,12)}. 
#' @return \code{SimpleSpatialPointsDataFrame},  \code{SimpleSpatialLinesDataFrame}, \code{SimpleSpatialPolygonsDataFrame} object.
#' @export
preprocess <- function(x, zoom.level=1:12, simplify.tolerance=1:12) {UseMethod('preprocess')}

#' Render objects
#'
#' This function renders \code{Spatial*} objects.
#'
#' @param x \code{SpatialPointsDataFrame},  \code{SpatialLinesDataFrame}, \code{SpatialPolygonsDataFrame} object.
#' @param bbox \code{numeric} vector with bounding box coordinates.
#' @param zoom.level \code{numeric} with current zoom level in map.
#' @param ... arguments passed to \code{\link[leaflet]{addMarkers}}, \code{\link[leaflet]{addPolyLines}}, and \code{\link[leaflet]{addPolygons}}.
#' @return \code{SimpleSpatialPointsDataFrame},  \code{SimpleSpatialLinesDataFrame}, \code{SimpleSpatialPolygonsDataFrame} object.
#' @export
render <- function(map, x, bbox, zoom.level, ...) {UseMethod('render')}

#' Simplify objects
#'
#' This function simplifies \code{Spatial*} objects.
#'
#' @param x \code{SpatialPoints},  \code{SpatialLines}, \code{SpatialPolygons} object.
#' @return \code{SpatialPoints},  \code{SpatialLines}, \code{SpatialPolygons} object.
#' @export
simplifyData <- function(x, tol) {UseMethod('simplifyData')}

#' Get zoom level from object
#'
#' This gets the zoom level
#' 
#' @param x object
#' @param zoom.level zoom level
#' @export
get.zoom.level <- function(x, zoom.level) {UseMethod('get.zoom.level')}


