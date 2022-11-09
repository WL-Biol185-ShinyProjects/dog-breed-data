library(shiny)
library(leaflet)
library(tidyverse)
library(shinyWidgets)
library(shinythemes)
library(bslib)

# Creating Navigation bar
fluidPage(

navbarPage("Westminster Dog Show Data",
           tags$style(HTML(".navbar.navbar-default {
                          background-color: #52247f !important;
                          
           }    
           
           .navbar.navbar-default .navbar-nav {
           color: #f9f8fc;
           
           }
           
           .navbar.navbar-default .navbar-brand {
            color: #f9f8fc;
           }
                               }")),
           theme = bs_theme(bootswatch = "flatly"),
           tabPanel("Map", 
                    titlePanel("Westminster Dog Show Winners and their Origins"),
                    h4("instructions"),
                      leafletOutput("map")
                    
                    ),
           tabPanel("Winners",
                    mainPanel(plotOutput("plot")),
                    sidebarPanel(
                      selectInput("dogBreed", "Filter by Breed",
                                  choices = finalDogData$Breed, selected = finalDogData$Breed[9], multiple = TRUE))
                    )
                    ,
           tabPanel("About",
                    titlePanel("Our story"),
                    h4("learn about westminster"),
                    p("hello"),
                    "About information")
           
    


))