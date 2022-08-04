# Isolate()

## Summary----

# Isolate() is analogous to reactive()
# Isolate() produces an output which is not reactive 
# Gives back result (normal R value) when run and doesn't react to it
# Surround input$title with isolate()
# Gives back value in a non-reactive state
# Slider isn't isolated and therefore provides updated histogram when changed
# Can be used to create a new plot, but plot does not immediately react when title changes as input$title is isolated.


## Code----

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  textInput(inputId = "title", 
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num), #not isolated, plot will react and update with slider input change
         main = isolate(input$title)) #isolate input$title to prevent chain of re-activity
  })
}

shinyApp(ui = ui, server = server)


## Recap----

# isolate() makes non-reactive objects out of reactive objects.
# Use isolate() to treat reactive values like normal R values, severing the change of re-activity.
