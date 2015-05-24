#server.R
library(shiny)
library(rCharts)

# Define server logic required to generate and plot air quality data
options(RCHART_WIDTH = 800)
shinyServer(function(input, output) {

        output$caption <- renderUI({
        #    paste(input$caption,min(no_co$stime),": ")
             str1 <- paste("Collected from:",min(no_co$stime)," ")
             str2 <- paste("to:", max(no_co$stime)," ")
             HTML(paste("Aarhus Air Quality Data", str1, str2, sep = '<br/>'))
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
