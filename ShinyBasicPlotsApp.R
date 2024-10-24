rm(list = ls())
library(shiny)

ui = fluidPage(
  "Hello Shiny!" ,
  selectInput("datasetID", label = "Dataset", choices = ls("package:datasets")[c(3,4,43,65,86)]),
  verbatimTextOutput("summary"),
  tableOutput("table")

)

server = function(input, output){
  # create a reactive expression
  dataSet = reactive({
    get(input$datasetID, "package:datasets")
  })

  output$summary = renderPrint({
    summary(dataSet()) # Use a reactive expression by calling it like a function
  })

  output$table = renderTable({
    dataSet() # Use a reactive expression by calling it like a function
  })
}

shinyApp(ui, server)
