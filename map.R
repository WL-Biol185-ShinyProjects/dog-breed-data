library(leaflet)

leaflet(data=finalDogData) %>% addTiles() %>% addMarkers(popup = ~Breed) 
#making HTMLs

paste('<img src = ""', c("HTML"), '" />', sep = "")
