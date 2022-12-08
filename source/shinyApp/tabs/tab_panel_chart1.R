# tab_panel_chart1

library(shiny)

tab_panel_chart1 <-tabPanel(
  "Chart 1",
  h1("Comparing Health Expenditure and HIV Prevalence "),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      sliderInput("hiv_range", label = h3("HIV Prevelance Slider"), min = 0.1, 
                  max = 22.3, value = c(0.1, 15)),
      p("Move the slider to see what countries have a HIV prevalence within the slider range")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "hiv_prev_chart", height = 500)
      
    )
  )
)

