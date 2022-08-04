## Reactivity (introduction)

## Summary----

# Reactivity in Shiny works in a similar manner to Excel. Input cell value -> formula reacts to the cell value.
# Changes are propagated between cells.
# Input objects work with Output objects in a similar manner.
# The input list is a list of reactive values. The values show the current state of the inputs (changed with a slider here).

# Reactive functions are functions which expects reactive values and knows what to do with them.
# Reactive functions are required to use reactive values (can't recall value otherwise) - common error in R if absent.

## Code----

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100), #input value changes whenever user changes input (values changed using a slider here)
  textInput(inputId = "title", 
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({ #reactive function 
    hist(rnorm(input$num), main = input$title) #function and input values work together to produce shiny response (histogram output here)
  })
}

shinyApp(ui = ui, server = server)


## Recap----

# Reactivity in R is a two-step process.
# Reactive values act as the data streams that flow through your app
# Reactive functions expect to take reactive values and know how to handle them, producing the desired Shiny response.
# You can only call a reactive value from a function that is designed to work with one.






