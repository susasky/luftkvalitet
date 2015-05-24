## ui.R
library(shiny)
library(rCharts)

# Define UI for application that plots air quality data
shinyUI(pageWithSidebar(  
  headerPanel("Aarhus Luftkvalitet"),

  sidebarPanel(
   checkboxGroupInput("poll",
    "Select Polluttant to graph:",
    c("NO2" = "NO_2","NOx" = "NO_x","CO" = "CO"),
    selected="CO"),
   actionButton("gobutton","Update Plot")
   #submitButton(text = "Apply Changes", icon = NULL)
  ), #closes SidebarPanel
   
  mainPanel(
   htmlOutput("caption"),
   #tableOutput("summary"),
   verbatimTextOutput("summary"),
   plotOutput("airplot")
  ) #closes mainPanel
))
