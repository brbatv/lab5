library(shiny)


shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    radioButtons("method", "Search Method", choices=list("Address","Latitude/Longitude")),
    uiOutput("user_input"),
    uiOutput("user_input2")),
  
  mainPanel(
    tableOutput("data_table"),
    textOutput("sentence"),
    textOutput("coordinates"),
    textOutput("sentence2"),
    textOutput("formatted")
  
  )
))
