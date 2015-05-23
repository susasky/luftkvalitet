## ui.R
library(shiny)

# Define UI for application that plots air quality data 
shinyUI(pageWithSidebar(

 # Application title
 headerPanel("Aarhus Luftkvalitet"),
        
 # Sidebar with a select input for polluttant
 sidebarPanel(
  #textInput("caption", "Caption:", "Data Summary"),
         
  checkboxGroupInput("poll",
                     "Select Polluttant to graph:",
                     c("NO2" = "NO_2","NOx" = "NO_x","CO" = "CO"))),

#   selectInput("poll",
#                     "Polluttant:",
#                     choices = c(a,b,"CO"),
#                     selected = "CO")
#   ), #end sidebarPanel         
         
  mainPanel(
   h3(textOutput("caption")), 
   verbatimTextOutput("summary"),
   plotOutput("airplot")
  )
#))