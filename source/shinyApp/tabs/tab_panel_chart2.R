# tab_panel_chart2

library(shiny)
library(plotly)

tab_panel_chart2 <-tabPanel(
  "Chart 2",
  h3("Comparing Median Availability of Generic Medicines to Prevalence of HIV"),
  sidebarLayout(
    sidebarPanel(
<<<<<<< HEAD
      sliderInput("country", label = h3("Number of Countries"), min = 1, step = 1, 
                  max = nrow(merged_data_chart2), value = nrow(merged_data_chart2))
=======
      sliderInput("country", label = h3("How Many Countries Would You Like to See?"), min = 1, step = 1, 
                  max = nrow(merged_data), value = nrow(merged_data))
>>>>>>> a67c627a8c10429fcd46815f0b0b4f3955b54d86
    ),
    mainPanel(
      plotOutput(outputId = "chart2", height = 800)
    )
  )
  
)

