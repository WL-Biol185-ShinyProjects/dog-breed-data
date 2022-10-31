library(leaflet)

leaflet(data=finalDogData) %>% 
  addTiles() %>% 
  addMarkers(
    lng = ~Longitude,
    lat = ~Latitude,
    label = finalDogData$Breed,
    popup = ~paste(
      '<img src="' , finalDogData$imageURL,'" 
      width=200
      height=200
      />'), 
)



