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
                    h4("The Westminster Kennel Club organization began in 1877 with the mission of enhancing dogs’ lives, celebrating their companionship, promoting responsible dog ownership, and preserving breeds. The Westminster Kennel Club Dog Show is an all-breed conformation competition that began in 1948, making it the longest nationally televised like dog show.  "),
                    h4("As dog lovers themselves, Grace, Mary Camilla, Jill, and John decided to bring to life a collection of data from both the American Kennel Club and the Westminster Kennel Club Dog Show.  "),
                    h4("We hope you all enjoy exploring the visualizations as much as we enjoyed creating it!")
                    )
           
    


))