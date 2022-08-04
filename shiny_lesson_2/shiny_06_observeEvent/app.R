## Observe / ObserveEvent()

## Summary----

# observe() is parallel to observeEvent(), very similar with a few small differences.
# Provides a single block of code to run (two required for observeEvent).
# observe() will run that block of code whenever observer object is invalidated.
# observe() will respond to every reactive value in the code (unlike observeEvent).
# Same syntax as render(), reactive() and isolate().
# observeEvent() precision considered better for general use.


## Code----

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number",
              min = 1, max = 100, value = 25),
  actionButton(inputId = "go", 
               label = "Print Value")
)

server <- function(input, output) {
  
  # observe responds to the print button
  # but not the slider as wrapped with observeEvent
  observeEvent(input$go, {
    print(as.numeric(input$num))
  })
}

shinyApp(ui = ui, server = server)



## Recap----


# observeEvent() triggers code to run on the server
# specify precisely which reactive values should invalidate the observer e.g. a button being clicked
# use observe() for a more implicit syntax, but tracks every reactive value in the code that you give observe.
