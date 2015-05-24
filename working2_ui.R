## ui.R
library(shiny)
library(rCharts)

# Define UI for application that plots air quality data
shinyUI(fluidPage(               
  # Application title
  titlePanel("Aarhus Luftkvalitet"),
  sidebarLayout(       
  # Sidebar with a select input for polluttant
   sidebarPanel(
    checkboxGroupInput("poll",
    "Select Polluttant to graph:",
    c("NO2" = "NO_2","NOx" = "NO_x","CO" = "CO"),
    selected="CO"),
   submitButton(text = "Apply Changes", icon = NULL)
   ), #closes SidebarPanel
  
   mainPanel(
    h3(textOutput("caption")), 
    verbatimTextOutput("summary"),
    plotOutput("airplot", width = "100%", height = "400px")
   ) #closes mainPanel 
  ) # closes sidebarLayout
))
