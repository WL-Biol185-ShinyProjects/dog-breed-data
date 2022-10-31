library(leaflet)


leaflet(data=finalDogData) %>% 
  addTiles() %>% 
  addMarkers(
    lng = ~Longitude,
    lat = ~Latitude,
    label = finalDogData$Breed,
    popup = ~paste("<p><b>" , finalDogData$Breed, "</b></p>" , 
                   "<p>", "Origin =", finalDogData$origin, "</p>" , 
                   "<p>", "Group =", finalDogData$Group, "</p>",
      '<img src="' , finalDogData$imageURL,'" 
      width=200
      height=200
      />'), 
)
<<<<<<< HEAD
=======
})

>>>>>>> 45c0329216240fc867bd4ee99cec44b92b7e3231

