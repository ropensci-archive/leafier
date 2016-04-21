context('03-render') 

test_that('render.SimpleSpatialPointsDataFrame', {
	data(points)
	m <- leaflet()
	p2 <- preprocess(lines)
	x <- render.SimpleSpatialPointsDataFrame(m, p2, c(-27, 153, -26, 154), 1)
})

test_that('render.SimpleSpatialLinesDataFrame', {
	data(lines)
	m <- leaflet()
	l2 <- preprocess(lines)
	x <- render.SimpleSpatialLinesDataFrame(m, l2, c(-27, 153, -26, 154), 1)
})

test_that('render.SimpleSpatialPolygonsDataFrame', {
	data(polys)
	m <- leaflet()
	p2 <- preprocess(polys)
	x <- render.SimpleSpatialPolygonsDataFrame(m, p2, c(-27, 153, -26, 154), 1)
})

 


