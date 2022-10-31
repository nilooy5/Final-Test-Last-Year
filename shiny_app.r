## Only run examples in interactive R sessions
library(shiny)
if (interactive()) {
  options(device.ask.default = FALSE)

  # Define UI
  ui <- fluidPage(

    # Application title
    titlePanel("Hello Shiny!"),

    sidebarLayout(

      # Sidebar with a slider input
      sidebarPanel(
        sliderInput("obs",
                    "Number of observations:",
                    min = 0,
                    max = 1000,
                    value = 500)
      ),

      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("distPlot")
      )
    )
  )

  # Server logic
  server <- function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
  }

  # Complete app with UI and server components
  shinyApp(ui, server)
}
