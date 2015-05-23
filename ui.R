## ui.R
library(shiny)
# devtools::install_github("rCharts", "ramnathv", ref = "dev")
library(rCharts)

# Define UI for application that plots air quality data
               
 # Application title
 #titlePanel("Aarhus Luftkvalitet"),
 sidebarLayout(       
 # Sidebar with a select input for polluttant
 sidebarPanel(
  checkboxGroupInput("poll",
          "Select Polluttant to graph:",
          c("NO2" = "NO_2","NOx" = "NO_x","CO" = "CO"))),
  
 mainPanel(
    h3(textOutput("caption")), 
    verbatimTextOutput("summary"),
    #showOutput("airplot", "morris"))
    plotOutput("airplot")) 
 
  ) # closes sidebarLayout
