# tab_panel_intro

library(shiny)

tab_panel_intro <-tabPanel(
    "Introduction",
    p("Health is the most important factor to consider for anyone in the world. 
      A citizens' accessibility to care draws great worry and is important as many countries in our world today are unable to provide their citizens with adequate treatment. 
      To address this concern, we plan to analyze 3 different datasets."),
    p("The data sets we analyzed present 3 different statistics,
      global health expenditure of a country per capita, a country's availibility of generic medicines, and prevalence of HIV within a target country's population. 
      By analyzing these three data sets we hope to answer 3 specific questions."),
    p(strong("Is there a positive correlation between health expenditure per capita and availability of generic medicines?")),
    p(strong("Does higher expenditure of a country per capita have any effect or correlation with prevalence of HIV within a country's population? ")),
    p(strong("Does availability of generic medicines, and in turn the ability to treat HIV, within a countries population affect how prevalent HIV is within a target countries population?")),
    
    p("By answering these questions we hope to gain insight about the overall health of countries around the world, and to possibly address these issues in the future.")
    
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
