library(shiny)
library(leaflet)
library(tidyverse)
library(shinyWidgets)

# Creating Navigation bar
navbarPage("Westminster Dog Show Data",
           tabPanel("Map",
                    titlePanel("Westminster Dog Show Winners and their Origins"),
                    mainPanel(
                      leafletOutput("map"))
                    
                    ),
           tabPanel("Winners",
                    mainPanel(plotOutput("plot")),
                    sidebarPanel(
                      selectInput("dogBreed", "Filter by Breed",
                                  choices = finalDogData$Breed, multiple = TRUE))
                    )
                    ,
           tabPanel("About",
                    "About information")
           
    


)