# Title: Simple Product Calculator

# Clear the workspace
rm(list = ls())

# Load the Shiny library
library(shiny)

# User Interface
ui <- fluidPage(
  titlePanel("Simple Product Calculator"),  # Adding a title panel

  sliderInput("x",
              label = "If x is",
              min = 1,
              max = 50,
              value = 10),

  sliderInput("y",
              label = "and y is",
              min = 1,
              max = 20,
              value = 5),

  # Display the product message
  h5("Then the product of x and y is:"),

  textOutput("product")
)

# Server Logic
server <- function(input, output, session) {
  output$product <- renderText({
    input$x * input$y
  })
}

# Run the Shiny app
shinyApp(ui, server)
