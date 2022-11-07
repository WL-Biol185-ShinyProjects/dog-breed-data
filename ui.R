library(shiny)
library(leaflet)
library(tidyverse)
library(shinyWidgets)
library(shinythemes)

# Creating Navigation bar
fluidPage(

navbarPage("Westminster Dog Show Data",
           theme = shinytheme("sandstone"),
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
           
    


))