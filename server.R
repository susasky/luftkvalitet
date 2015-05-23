#server.R
library(shiny)
# devtools::install_github("rCharts", "ramnathv", ref = "dev")
library(rCharts)

# Define server logic required to generate and plot air quality data
options(RCHART_WIDTH = 800)
shinyServer(function(input, output) {
        
        output$caption <- renderText({
        #    paste(input$caption,min(no_co$stime),": ")
             
             paste("Air Quality Data from",min(no_co$stime)," ")
        })
        
        # The output$summary depends on the datasetInput reactive expression, 
        # so will be re-executed whenever datasetInput is invalidated
        # (i.e. whenever the input$dataset changes)
        output$summary <- renderPrint({
                dataset <- values[,c(3,4,5)]
                summary(dataset)
        })
        
        output$airplot <- renderPlot({
               airplot <- mPlot(x="stime", y=input$poll, type = "Line", data = values)
               airplot$set(pointSize = 0, lineWidth = 1)
               return(airplot)
          })
})