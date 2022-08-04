## Reactivity (two inputs)

## Summary ----

# render() is a set of functions which provide one argument used to build the output object, each creating a certain type of output e.g. table/plot/text etc.
# Provide one argument which is used to build the object.
# The object will respond to every reactive value in the code
# Always save the result to output$__
# Changing input values invalidates the output (output$hist here), notifying everything downstream that depends on it that it has changed.
# The block of code and render() functions are rerun to update itself calling all input values again.

# Step 1. Use a code chunk to build (and rebuild) an object 
# - what code will the function use?

# Step 2. The object responds to changes in a set of reactive values
# - which reactive values will the object respond to


## Code ----


library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number (input$num)",
              value = 25, min = 1, max = 100),
  textInput(inputId = "title",
            label = "Write a title (input$title)", 
            value = "Histogram of Random Normal Values"),#changing the title in the observer object would invalidate the entire code chunk -> notify downstream & rerun all to update self
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({ #render() function to dictate output type
    hist(rnorm(input$num), main = input$title) #uses two reactive inputs
  })
}

shinyApp(ui = ui, server = server)

# Recap ----

# 1. render() functions produce observer objects to display.
# 2. Calls all input values (input$num, input$title here).
# 3. Changing input values in the observer object (amending title here) notifies everything downstream that it has changed, invalidating the entire code chunk.
# 4. As output$hist made with render() function -> responds and updates
# 5. The object will rerun the entire code block to update itself whenever it is invalidated -> updated output







