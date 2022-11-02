library(shiny)

# Creating Navigation bar
navbarPage("Westminster Dog Show Data",
           tabPanel("Map",
                    titlePanel("Westminster Dog Show Winners and their Origins"),
                    mainPanel(
                      leafletOutput("map"))
                    
                    ),
           tabPanel("Winners",
                    mainPanel(plotOutput("plot")),
                    "Winner dropdowm will go here"
                    ),
           tabPanel("About",
                    "About information")
           
    )
  

