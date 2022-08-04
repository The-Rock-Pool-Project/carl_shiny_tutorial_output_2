## reactiveValues()

## Summary----

# Use reactiveValues() to create a list of reactive values.
# These can be manipulated programatically.
# Similar to the list function. Requires no arguments (optional), but can give arguments to populate list when created.
# Here, data object with 100 rnorm values wrapped with reactiveValues().
# Creates a reactive variable rv$data.
# Action button used -> overwrites rv$data with input$norm (normally distributed data) or input$unif (uniform distribution).
# When pressed -> notifies downstream dependencies -> reruns code -> looks up new value -> renders plot.
# Manipulating the state of rv$data through the action button, overwriting it with Normal / Uniform data.


## Code----

library(shiny)

ui <- fluidPage(
  actionButton(inputId = "norm", label = "Normal"), # input$norm action button
  actionButton(inputId = "unif", label = "Uniform"), #input$unif action button
  plotOutput("hist")
)

server <- function(input, output) {
  
  rv <- reactiveValues(data = rnorm(100)) #create reactive value object
  
  observeEvent(input$norm, { rv$data <- rnorm(100) }) #overwrites rv$data with input$norm data each time button clicked
  observeEvent(input$unif, { rv$data <- runif(100) }) #overwrites rv$data with input$unif data each time button clicked
  
  output$hist <- renderPlot({ #render plot output
    hist(rv$data) 
  })
}

shinyApp(ui = ui, server = server)


## Recap----

# reactiveValues() creates a list of reactive values for use.
# Can manipulate these values (usually with observeEvent and an action button).
