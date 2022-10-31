library(shiny)
source("ui.R")
source("server.R")

main_panel <- mainPanel(plotOutput("originMap"))


shinyApp(ui, server)