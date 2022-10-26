library(leaflet)

leaflet(data=finalDogData) %>% addTiles() %>% addMarkers(popup = ~Breed) 

