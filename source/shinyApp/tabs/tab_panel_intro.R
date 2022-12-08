# tab_panel_intro

library(shiny)

tab_panel_intro <-tabPanel(
    "Introduction",
    p("The purpose of our project is to compare factors like health care expenditure and availibility of medical resources ")
    
    # # SAMPLE CODE FOR FORMATING:
    # # Sidebar layout with input and output definitions ----
    #
    # sidebarLayout(
    #   
    #   # Sidebar panel for inputs ----
    #   sidebarPanel(
    #     
    #     # Input: Slider for the number of bins ----
    #     sliderInput(inputId = "year_plot1",
    #                 label = "Year:",
    #                 min = 1750,
    #                 max = 2021,
    #                 value = 2021)
    #     
    #   ),
    #   
    #   # Main panel for displaying outputs ----
    #   mainPanel(
    #     
    #     # Output: Histogram ----
    #     plotOutput(outputId = "co2_per_capita_year")
    #     
    #   )
    # )

)
