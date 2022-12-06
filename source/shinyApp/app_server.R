#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

## Libraries needed to Load:
library("tidyverse")
# add more

library(shiny)

# Load Data Functions

## Load Medicine data function 
load_medicine_data <- function() {
  filename <- "https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/med_aval.csv"
  df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
  return(df)
}
## Load Medicine data function 
load_hiv_data <- function() {
  filename <- "https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/prev_hiv.csv"
  df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
  return(df)
}
## Load Medicine data function 
load_che_data <- function() {
  filename <- "https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/CHE_data.csv"
  df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
  return(df)
}


# server function: inputs should be in your panel tabs
server <- function(input, output) {
  #
  # Loading the Dataframes
  # Please change data names in your code to following:
  # Medicine data = med_data
  # HIV Prevelance data = hiv_data
  # CHE data = che_data
  
  # load medicine data
  med_data <- load_medicine_data()
  # load hiv data
  hiv_data <- load_hiv_data()
  # load che data
  che_data <- load_che_data()
  
  
  ####                        ####
  #### CHART 1: SHAWN SECTION ####
  ####                        ####
  
  
  
  
  
  
  
  
  ####                          ####
  #### CHART 2: JEFFERY SECTION ####
  ####                          ####
  
  
  
  
  
  ####                        ####
  #### SAMPLE CODE: REFERENCE ####
  ####                        ####
  

  # # creating plot with outputId = "co2_per_capita_year"
  # output$co2_per_capita_year <- renderPlot({
  #   
  #   # Uses dataframe called "co2_data"
  #   # DLPYR DONE INSIDE PLOT RENDER
  #   co2_year <- co2_data %>%
  #     filter(year <= input$year_plot1) %>%      # input corresponds to "year_plot1" found in tab_panel____.R
  #     group_by(year) %>%
  #     mutate(average_co2 = mean(co2, na.rm=TRUE)) %>%
  #     select(year, average_co2)
  #   
  #   # plotting the manipulated dataframe
  #   plot(co2_year,
  #        xlab = "Waiting time to next eruption (in mins)",
  #        ylab = "Annual total production-based emissions of carbon dioxide (CO₂)",
  #        main = "Histogram of waiting times")
  # })

}


