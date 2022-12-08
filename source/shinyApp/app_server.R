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
  
  # Try to implement this, if not no biggie
  #
  
  ## Set up initial dataframes
  #
  # formulate che_data for chart 1
  #
  che_data_chart1 <- che_data
  names(che_data_chart1) <- che_data_chart1[1,]
  che_data_chart1 <- che_data_chart1[-1,]
  che_data_chart1 <- che_data_chart1[!is.na(che_data_chart1$`2019`),]
  che_data_chart1 <- che_data_chart1 %>%
    mutate("Current health expenditure (CHE) per capita in US$" = che_data_chart1$`2019`) %>%
    select(Country, `Current health expenditure (CHE) per capita in US$`)
  #
  # formulate hiv_data for chart 1
  #
  hiv_data_chart1 <- hiv_data
  names(hiv_data_chart1) <- hiv_data_chart1[1,]
  hiv_data_chart1 <- hiv_data_chart1[-1,]
  hiv_data_chart1 <- hiv_data_chart1[hiv_data_chart1$` 2019` != "No data",]
  hiv_data_chart1[hiv_data_chart1=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
  hiv_data_chart1[hiv_data_chart1=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
  hiv_data_chart1[hiv_data_chart1=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
  hiv_data_chart1[hiv_data_chart1=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"

  hiv_data_chart1 <- hiv_data_chart1 %>%
    mutate("Prevalence of HIV among adults aged 15 to 49 (%)" = str_remove(hiv_data_chart1$` 2019`, "\\[.*")) %>%
    select(Country, `Prevalence of HIV among adults aged 15 to 49 (%)`)

  hiv_data_chart1$`Prevalence of HIV among adults aged 15 to 49 (%)` <- as.numeric(hiv_data_chart1$`Prevalence of HIV among adults aged 15 to 49 (%)`)

  merged_data <- inner_join(hiv_data_chart1, che_data_chart1, by = "Country")
  merged_data <- rename(merged_data, region = Country)
  # 
  ##
  # Load the library "maps"
  #
  library(maps)
  #
  # Data wrangling function that returns a data frame that is suitable for 
  # visualization. The function uses the map data provided by R for each country
  # The 'merged_data' DF from Shawns Chart 1 was wranggled to return certain  
  # countries that are within the inputs lower and upper limits for HIV_Prev
  #
  #   
  country_map_data <- map_data("world")
  #

  output$hiv_prev_chart <- renderPlot({
    final_data <- merged_data %>%
      filter(`Prevalence of HIV among adults aged 15 to 49 (%)` <= max(input$hiv_range)) %>%
      filter(`Prevalence of HIV among adults aged 15 to 49 (%)` >= min(input$hiv_range))
  
    merged_data <- inner_join(country_map_data, final_data, by='region')
  
    chart1 <- ggplot() +
      geom_polygon(data=merged_data, 
                   aes(x=long, y=lat, group=group, fill = `Current health expenditure (CHE) per capita in US$`), 
                   color="white", size = 0.2) +
      scale_fill_continuous(name="Current health expenditure (CHE) per capita in US$", 
                            low = "lightgreen", high = "darkblue", na.value = "grey50") +
      
      labs(title="Jail Population Ratio (Male to Female) in the Mainland United States in 2018",
           x="Longitude",
           y="Latitude")
    chart1
  })
  # 
  #

  
  
  #
  #
  #
  #
  # Plotting function that returns the visual for countries selected. 
  # Population Ratio (Male to Female) in the Mainland United States in 2018. This 
  # function takes no parameters and calls the data wrangling function 
  # "get_jail_pop_by_gender_map" as it uses the data frame constructed there.
  
  
  
  ####                          ####
  #### CHART 2: JEFFERY SECTION ####
  ####                          ####
  names(hiv_data) <- hiv_data[1,]
  hiv_data = hiv_data[-1,]
  
  hiv_data <- hiv_data[hiv_data$` 2021` != "No data",]
  
  names(med_data) <- med_data[1,]
  med_data = med_data[-1,]
  med_data = med_data[-3]
  
  colnames(med_data)[2] = "Median Availability of Generic Medicines 2007-2013 (%)"
  
  hiv_data[hiv_data=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
  hiv_data[hiv_data=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
  hiv_data[hiv_data=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
  hiv_data[hiv_data=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"
  
  hiv_data <- hiv_data %>%
    mutate(data_2013 = str_remove(hiv_data$` 2013`, "\\[.*"))
  hiv_data <- hiv_data %>%
    mutate(data_2012 = str_remove(hiv_data$` 2012`, "\\[.*"))
  hiv_data <- hiv_data %>%
    mutate(data_2011 = str_remove(hiv_data$` 2011`, "\\[.*"))
  hiv_data <- hiv_data %>%
    mutate(data_2010 = str_remove(hiv_data$` 2010`, "\\[.*"))
  hiv_data <- hiv_data %>%
    mutate(data_2009 = str_remove(hiv_data$` 2009`, "\\[.*"))
  hiv_data <- hiv_data %>%
    mutate(data_2008 = str_remove(hiv_data$` 2008`, "\\[.*"))
  hiv_data <- hiv_data %>%
    mutate(data_2007 = str_remove(hiv_data$` 2007`, "\\[.*"))
  
  hiv_data$data_2013 <- as.numeric(hiv_data$data_2013)
  hiv_data$data_2012 <- as.numeric(hiv_data$data_2012)
  hiv_data$data_2011 <- as.numeric(hiv_data$data_2011)
  hiv_data$data_2010 <- as.numeric(hiv_data$data_2010)
  hiv_data$data_2009 <- as.numeric(hiv_data$data_2009)
  hiv_data$data_2008 <- as.numeric(hiv_data$data_2008)
  hiv_data$data_2007 <- as.numeric(hiv_data$data_2007)
  
  hiv_data <- hiv_data %>%
    mutate("Median Prevalence of HIV 2007-2013 (%)" = rowMeans(hiv_data[,24:30], na.rm = TRUE))
  
  merged_data <- inner_join(hiv_data, med_data, by = "Country")
  merged_data <- merged_data %>%
    select(Country, `Median Prevalence of HIV 2007-2013 (%)`, `Median Availability of Generic Medicines 2007-2013 (%)`)
  
  chart_1_df <- reactive ({
    c1_df <- merged_data[sample(x=1:nrow(merged_data), size = input$country),]
  })
  
  output$chart2 <- renderPlot({
    ggplot(chart_1_df(), aes(x = Country, fill = `Median Prevalence of HIV 2007-2013 (%)`, y = `Median Availability of Generic Medicines 2007-2013 (%)`)) +
    geom_bar(position = "dodge", stat = "identity") + 
    scale_x_discrete(guide = guide_axis(n.dodge = 3))
  })
  
  output$value <- renderPrint({ input$country })
  
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


