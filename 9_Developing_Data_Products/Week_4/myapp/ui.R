library(shiny)
library(plotly)

shinyUI(fluidPage(
        
        titlePanel("Sine Curve"),
        
        sidebarLayout(
                sidebarPanel(
                        p("On the right, you see a plot of y = a * sin(a * x). The parameters 
                          a and b can be changed below to understand how they influence the curve."),
                        sliderInput("a",
                                   "Parameter a",
                                   min = .1,
                                   max = 5,
                                   value = 1),
                        sliderInput("b",
                                   "Parameter b",
                                   min = .1,
                                   max = 5,
                                   value = 1)
                        ),

                mainPanel(
                        plotlyOutput("plot")
                        )
        )
))
