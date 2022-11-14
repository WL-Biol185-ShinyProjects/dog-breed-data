library(shiny)
library(leaflet)
library(ggplot2)
library(dplyr)
library(ggthemes)

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
        popup = ~paste("<p><b>" , finalDogData$Breed, "</b></p>" , 
                       "<p>", "Origin =", finalDogData$origin, "</p>" , 
                       "<p>", "Group =", finalDogData$Group, "</p>",
                       '<img src="' , finalDogData$imageURL,'" 
      width=200
      height=200
      />'), 
        )
  })
  
  output$plot <- renderPlot({
    dogBreeds <- reactive({
      req(input$dogBreed)
      filter(finalDogData, Breed %in% input$dogBreed)
      })
   ggplot(dogBreeds(), aes(Year, Breed)) + geom_point(show.legend = FALSE) + theme_hc() + scale_x_continuous(breaks = round(seq(min(finalDogData$Year), max(finalDogData$Year), by = 10)))
  })

  
  
  output$Dogs <- renderTable({
    
    
  })
  

    }
  
    