## Reactivity - two outputs / reactive() function

## Summary----

# Here, one slider input creates two output objects (histogram & summary stats text block)
# renderPrint() is used for blocks of text
# renderPlot() is used for the histogram
# Both use the same input$num input
# If rnorm() is called twice, it will generate different datasets for the two outputs
# reactive() function creates an object to use (in downstream code)
# Objects created by reactive() need to be called like a function for use ({})
# Reactive expressions cache their values to avoid unnecessary computation (if invalid --> runs, if not --> value already saved, doesn't run)

# 1. Change slider value
# 2. input$num notifies data expression its invalid
# 3. Code rerun -> reactive expression notifies downstream objects (hist & stats text block here).

## Code----

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  plotOutput("hist"), #plot output
  verbatimTextOutput("stats") #summary stats text output
)

server <- function(input, output) {
  
  data <- reactive({ #save result of reactive expression as data (notice {})
    rnorm(input$num)
  })
  
  output$hist <- renderPlot({
    hist(data()) #call reactive expression data for histogram
  })
  output$stats <- renderPrint({ #call the same reactive expression data for stats
    summary(data())
  })
}

shinyApp(ui = ui, server = server)

## Recap ----

# 1. Inputs can have multiple output objects.
# 2. Calling rnorm() each time will generate different datasets for each object.
# 3. reactive() makes an object to use (in downstream code) ensuring the same dataset used for outputs.
# 4. Call reactive expression like a function.
# 5. Reactive expressions cache their values to avoid unnecessary computation (if invalid --> runs, if not --> doesn't as value saved already)







