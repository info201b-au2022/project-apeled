# tab_panel_chart2

library(shiny)
library(plotly)

tab_panel_chart2 <-tabPanel(
  "Chart 2",
  h3("Comparing Median Availability of Generic Medicines to Prevalence of HIV"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("country", label = h3("How Many Countries Would You Like to See?"), min = 1, step = 1, 
                  max = 34, value = 34)
    ),
    mainPanel(
      plotOutput(outputId = "chart2", height = 700)
    )
  ),
  p(""),
  p("The purpose of this chart is to compare the two variables of median availability ",
    "of generic medicines and median prevalence of HIV, to find out if there is any ",
    "correlation between the two variables. When we look at the chart we can see many of the",
    "data points are not consistant in terms of HIV prevalence and availability of generic medicines. ",
    "We see many high availability countries have little HIV prevalence, but there are some that do not follow this pattern at all.
     This trend suggests that overall there is likely",
    "little correlation between the two variables. Although this is not definitive ",
    "because the generic medicine availability data is not quite as comprehensive as the ",
    "HIV prevalence data, having far less data points overall.")
  
)

