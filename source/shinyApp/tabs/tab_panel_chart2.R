# tab_panel_chart2

library(shiny)
library(plotly)

tab_panel_chart2 <-tabPanel(
  "Chart 2",
  h3("Comparing Median Availability of Generic Medicines to Prevalence of HIV"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("country", label = h3("How Many Countries Would You Like to See?"), min = 1, step = 1, 
                  max = nrow(merged_data), value = nrow(merged_data))
    ),
    mainPanel(
      plotOutput(outputId = "chart2")
    )
  )
  
)

