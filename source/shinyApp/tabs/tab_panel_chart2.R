# tab_panel_chart2

library(shiny)
library(plotly)

tab_panel_chart2 <-tabPanel(
  "Chart 2",
  h3("Comparing Median Availability of Generic Medicines to Prevalence of HIV"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("country", label = h3("How Many Countries Would You Like to See?"), min = 1, step = 1, 
                  max = nrow(merged_data_chart2), value = nrow(merged_data_chart2))
    ),
    mainPanel(
      plotOutput(outputId = "chart2", height = 700)
    )
  ),
  p(""),
  p("The purpose of this chart is to compare the two variables of median availability ",
    "of generic medicines and median prevalence of HIV, to find out if there is any ",
    "correlation between the two variables. When we look at the chart we can see an ",
    "almost straight vertical line with an extremely slight negative correlation. ",
    "This trend suggests that there is a very slight decrease in HIV prevalence as ",
    "generic medicines become more available, but overall the graph shows that there ",
    "is little correlation between the two variables. Although this is not definitive ",
    "because the generic medicine availability data is not quite as comprehensive as the ",
    "HIV prevalence data, having far less data points overall.")
  
)

