context('04-leaflet')

test_that('leaflet test - points', {
	data(points)
	x <- preprocess(points)
	m = leaflet() %>% addTiles() %>% render(points, 1)
})

test_that('leaflet test - lines', {
	data(lines)
	x <- preprocess(lines)
	m = leaflet() %>% addTiles() %>% render(lines, 1)

})

test_that('leaflet test - polygons', {
	data(polygons)
	x <- preprocess(polygons)
	m = leaflet() %>% addTiles() %>% render(points, 1)

})
