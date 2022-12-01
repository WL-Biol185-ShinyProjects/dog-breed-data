library(shiny)
library(leaflet)
library(tidyverse)
library(shinyWidgets)
library(shinythemes)
library(bslib)
library(DT)

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
                    
                    h5("Explore the origins of your favorite Westminster Dog Show Winners through this interactive map. Hover over the blue pins to preview the breed, and click into any pin to see a picture, the dog's origin, and group. Click and drag the map to see different areas, and zoom in to see more breeds."),
                    br(),
                    
                    fluidRow(radioButtons(
                      inputId = "mapTheme", "Map Theme:", choices = c("Dark mode", "Light mode"), selected = "Light mode"
                    ),
                    leafletOutput("map", height="70vh")
                    )),
           
           tabPanel("Winners",
                    titlePanel("Browse Winning Dogs by Breed"),
                    
                    h5("Explore the history of the winners of the Westminster Dog Show from 1907 to 2017. Click into the drop down, or type, to select which breeds you would like to see. Points on the plot will appear in the years that the selected breed(s) won."),
                    br(),
                    br(),
                    br(),
                    
                     fluidRow(column(8, plotOutput("plot")),
                              column(4, selectInput("dogBreed", "Filter by Breed",
                                                    choices = finalDogData$Breed, 
                                                    selected = finalDogData$Breed[9], 
                                                    multiple = TRUE))
           ),
           ),  
           
           tabPanel("Breed Specifications",
                    titlePanel("Filter Winning Dogs by Breed Specifications"),
                    h5("Use filters under each column to sort through the winners by year of win, breed, height, weight, life expectancy and group."),
                    br(),
                    fluidRow(column(8,  DT::dataTableOutput("Dogs")),
                             column(4, downloadButton("downloadData", "Download")),
           ),
           ),
           
           tabPanel("Comparison Plots",
                    titlePanel("Comparison Plots"),
                    h5("Compare winning frequency from 1907 to 2017 to three different Westminster Dog Show competitor statistics: origin, temperament, and group. Use the buttons below the x-axis to toggle between what statistic you are comparing to win frequency."),
                    plotOutput("Interactive"),
                    br(),
                    fluidRow(radioButtons(
                      inputId = "barData", "X axis choices", choices = c("Origin", "Temperament", "Group"), selected = "Temperament")
                    )),
           
           tabPanel("About",
                    titlePanel("Our story"),
                    h4("The Westminster Kennel Club organization began in 1877 with the mission of enhancing dogs’ lives, celebrating their companionship, promoting responsible dog ownership, and preserving breeds. The Westminster Kennel Club Dog Show is an all-breed conformation competition that began in 1948, making it the longest nationally televised live dog show.  "),
                    h4("As dog lovers themselves, Grace, John, Jill, and Mary Camilla decided to bring to life a collection of data from both the American Kennel Club and the Westminster Kennel Club Dog Show.  "),
                    h4("We hope you all enjoy exploring the visualizations as much as we enjoyed creating them!"),
                    br(),
                    br(),
                    fluidRow(column(3, img(src = "IMG_6464.jpg",
                                           width = "300px", height = "300px")),
                             column(3,  img(src = "thumbnail_IMG_8312.jpg",
                                            width = "300px", height = "300px")),
                             column(3, img(src = "thumbnail_IMG_E2596.jpg",
                                       width = "300px", height = "300px")),
                             column(3, img(src = "thumbnail_IMG_8351.jpg",
                                          width = "300px", height = "300px"))
                                     )),

))