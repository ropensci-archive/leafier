library(shiny)
library(leaflet)
library(BrisbaneBikeways)
library(dplyr)
library(sp)
library(rgeos)
library(rgdal)

geom.subset <- function(spgeom, top, left, bottom, right ){
  
  coords <- data.frame(y = c(left, right, right, left ), x =c(top, top, bottom, bottom) )
  poly <-  sp::Polygon(coords)
  polys <- sp::Polygons( list(poly) , ID =0)
  polys.spatial <- SpatialPolygons(list(polys), proj4string =  spgeom@proj4string)
  inter <- rgeos::gIntersection(spgeom, polys.spatial, byid =TRUE)
} 

bikeways <- bikeways2015#[grepl('BRISBANE', bikeways2015$suburb),]
