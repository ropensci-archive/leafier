context('02-preprocessor')


test_that('preprocess.SpatialPointsDataFrame', {
	data(points)
	x <- preprocess.SpatialPointsDataFrame(points)
})

test_that('preprocess.SpatialLinesDataFrame', {
	data(lines)
	x <- preprocess.SpatialLinesDataFrame(lines)
})

test_that('preprocess.SpatialPolygonsDataFrame', {
	data(polys)
	x <- preprocess.SpatialPolygonsDataFrame(polys)
})

 
