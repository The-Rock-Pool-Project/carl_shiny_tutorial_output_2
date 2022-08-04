## Action Buttons


## Summary----

# Action buttons take an input ID, takes a label and inserts a button object into your app.
# One or a vector of reactive values are required for observeEvent() to produce the action button.
# Produces observer object that will only respond to changes in reactive values.
# Requires a second argument of a code block to run whenever observer object is invalidated.
# Will update whenever clicked and can provide any R code to run when clicked (determined by second argument code block).
# Requires a render function.
# Here, the action button is printing the value of input clicks back to the R server running the app.


## Code----

library(shiny)

ui <- fluidPage(
  actionButton(inputId = "clicks", #button type
               label = "Click me") #button label
)

server <- function(input, output) {
  observeEvent(input$clicks, { #create action button to click in app
    print(as.numeric(input$clicks)) #code run when action button is clicked, prints back to server
  })
}

shinyApp(ui = ui, server = server)


## Recap----

# observeEvent() triggers code to run on the server
# specify precisely which reactive values should invalidate the observer e.g. a button being clicked
# use observe() for a more implicit syntax, but tracks every reactive value in the code that you observe.
