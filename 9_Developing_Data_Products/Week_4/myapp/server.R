library(shiny)
library(plotly)

shinyServer(function(input, output) {
        
        output$plot <- renderPlotly({
                
                a <- input$a
                b <- input$b
                
                x <- seq(from = -400, to = 400, length.out = 150)
                y <- a * sin(b * x * (180/pi))
                
                plot_ly(x = x, 
                        y = y, 
                        type = "scatter", 
                        mode = "lines"
                        ) %>%
                        layout(xaxis = list(title = "x in degrees",
                                            dtick = 90),
                               yaxis = list(title = "a * sin(b * x)",
                                            range = c(-5,5))
                               )
                
  })
  
})