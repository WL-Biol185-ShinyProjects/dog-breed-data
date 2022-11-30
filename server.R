library(shiny)
library(leaflet)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(DT)

# Define server logic required to draw a histogram
function(input, output) {

  #CREATING A MAP
  
  output$map <- renderLeaflet({
      if(input$mapTheme=="Dark mode"){leaflet(data=finalDogData) %>%
          addProviderTiles(provider = providers$NASAGIBS.ViirsEarthAtNight2012) %>% 
          setView(0, 40, zoom =4) %>%
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
      />') 
          )
      } else {
        leaflet(data=finalDogData) %>%
          addTiles() %>% 
          setView(0, 40, zoom =4) %>%
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
      />') 
          )
  }})
  
  output$plot <- renderPlot({
    dogBreeds <- reactive({
      req(input$dogBreed)
      filter(finalDogData, Breed %in% input$dogBreed)
      })
   ggplot(dogBreeds(), aes(Year, Breed,)) + geom_point(show.legend = FALSE, color = 'black') + theme_hc() + theme(plot.background = element_rect(fill = "#E6E6FA")) + scale_x_continuous(breaks = round(seq(min(finalDogData$Year), max(finalDogData$Year), by = 10)))
   
  })

  
  
  output$Dogs <- renderDataTable(downloadDogs, filter = 'top')
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("Dogs", Sys.Date(), ".csv", sep="")
    },
    content = function (file) {
      write.csv (downloadDogs, file)
    }
  )
  
  
  output$Interactive <- renderPlot({
    if(input$barData == "Origin"){
      ggplot(breedWinStats, aes(Origin, Frequency)) + geom_col() + theme(axis.text.x = element_text(angle = 60, hjust = 1))
    }
    else{
      if(input$barData == "Temperament"){
      ggplot(breedWinStats, aes(Temperament, Frequency)) + geom_col() + theme(axis.text.x = element_text(angle = 60, hjust = 1))
      }
     
      }
    
    }
    
  )

  

}


  

    