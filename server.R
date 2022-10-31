library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
function(input, output) {

  #CREATING A MAP
  
  output$map <- renderLeaflet({
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
  })
  
    }