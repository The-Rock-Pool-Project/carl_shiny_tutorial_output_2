## eventReactive()


## Summary----

# Delay reactions with eventReactive()
# Isolate prevents reactions entirely, this delays the reaction.
# eventReactive() creates a reactive expression.
# Syntax similar to observeEvent(), as only reactive values will invalidate the expression.
# Expression invalidated when action button is pressed -> recomputes dataset -> informs downstream code of invalidation --> reruns to obtain new input and produce plot output.


## Code----

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  actionButton(inputId = "go", #action button
               label = "Update"), #button label
  plotOutput("hist")
)

server <- function(input, output) {
  data <- eventReactive(input$go, { #create reactive expression for delayed output (when action button pressed -> invalidate)
    rnorm(input$num) 
  })
  
  output$hist <- renderPlot({
    hist(data()) #call reactive expression
  })
}

shinyApp(ui = ui, server = server)


## Recap ----

# Use eventReactive() to delay downstream reactions.
# eventReactive() creates a reactive expression.
# You can specify precisely which reactive values should invalidate the expression (like observeEvent).
# Usually paired with an action button but can be any reactive values.






