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
load_med_data <- function() {
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

####                        ####
#### CHART 1: SHAWN SECTION ####
####                        ####

# server function: inputs should be in your panel tabs
server <- function(input, output) {
  #
  # Loading the Dataframes
  # Please change data names in your code to following:
  # Medicine data = med_data
  # HIV Prevelance data = hiv_data
  # CHE data = che_data
  
  # load medicine data
  med_data <- load_med_data()
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
  
  merged_data_chart1 <- inner_join(hiv_data_chart1, che_data_chart1, by = "Country")
  merged_data_chart1 <- rename(merged_data_chart1, region = Country)
  # 
  ##
  # Load the library "maps"
  #
  library(maps)
  #
  # Data wrangling function that returns a data frame that is suitable for 
  # visualization. The function uses the map data provided by R for each country
  # The 'merged_data_chart1' DF from Shawns Chart 1 was wranggled to return certain  
  # countries that are within the inputs lower and upper limits for HIV_Prev
  #
  #   
  country_map_data <- map_data("world")
  #
  
  output$hiv_prev_chart <- renderPlot({
    final_data <- merged_data_chart1 %>%
      filter(`Prevalence of HIV among adults aged 15 to 49 (%)` <= max(input$hiv_range)) %>%
      filter(`Prevalence of HIV among adults aged 15 to 49 (%)` >= min(input$hiv_range))
    
    merged_data_chart1 <- inner_join(country_map_data, final_data, by='region')
    
    chart1 <- ggplot() +
      geom_polygon(data=merged_data_chart1, 
                   aes(x=long, y=lat, group=group, fill = `Current health expenditure (CHE) per capita in US$`), 
                   color="white", size = 0.2) +
      scale_fill_continuous(name="Current health expenditure (CHE) per capita in US$", 
                            low = "lightgreen", high = "darkblue", na.value = "grey50") +
      
      labs(x="Longitude",
           y="Latitude",
           caption = "This chart compares the total health expenditure per capita (in US$) to the prevalence of HIV within a target country's population") +
      theme(axis.title = element_text(size = 16), axis.text = element_text(size = 13), plot.caption = element_text(size = 12))
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
  #
  # formulate hiv_data for chart 2
  #
  hiv_data_chart2 <- hiv_data
  names(hiv_data_chart2) <- hiv_data_chart2[1,]
  hiv_data_chart2 = hiv_data_chart2[-1,]
  
  hiv_data_chart2 <- hiv_data_chart2[hiv_data_chart2$` 2021` != "No data",]
  
  #
  # formulate med_data for chart 2
  #
  med_data_chart2 <- med_data
  names(med_data_chart2) <- med_data_chart2[1,]
  med_data_chart2 = med_data_chart2[-1,]
  med_data_chart2 = med_data_chart2[-3]
  
  colnames(med_data_chart2)[2] = "Median Availability of Generic Medicines 2007-2013 (%)"
  
  hiv_data_chart2[hiv_data_chart2=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
  hiv_data_chart2[hiv_data_chart2=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
  hiv_data_chart2[hiv_data_chart2=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
  hiv_data_chart2[hiv_data_chart2=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"
  
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2013 = str_remove(hiv_data_chart2$` 2013`, "\\[.*"))
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2012 = str_remove(hiv_data_chart2$` 2012`, "\\[.*"))
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2011 = str_remove(hiv_data_chart2$` 2011`, "\\[.*"))
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2010 = str_remove(hiv_data_chart2$` 2010`, "\\[.*"))
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2009 = str_remove(hiv_data_chart2$` 2009`, "\\[.*"))
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2008 = str_remove(hiv_data_chart2$` 2008`, "\\[.*"))
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate(data_2007 = str_remove(hiv_data_chart2$` 2007`, "\\[.*"))
  
  hiv_data_chart2$data_2013 <- as.numeric(hiv_data_chart2$data_2013)
  hiv_data_chart2$data_2012 <- as.numeric(hiv_data_chart2$data_2012)
  hiv_data_chart2$data_2011 <- as.numeric(hiv_data_chart2$data_2011)
  hiv_data_chart2$data_2010 <- as.numeric(hiv_data_chart2$data_2010)
  hiv_data_chart2$data_2009 <- as.numeric(hiv_data_chart2$data_2009)
  hiv_data_chart2$data_2008 <- as.numeric(hiv_data_chart2$data_2008)
  hiv_data_chart2$data_2007 <- as.numeric(hiv_data_chart2$data_2007)
  
  hiv_data_chart2 <- hiv_data_chart2 %>%
    mutate("Median Prevalence of HIV 2007-2013 (%)" = rowMeans(hiv_data_chart2[,24:30], na.rm = TRUE))
  
  merged_data_chart2 <- inner_join(hiv_data_chart2, med_data_chart2, by = "Country")
  merged_data_chart2 <- merged_data_chart2 %>%
    select(Country, `Median Prevalence of HIV 2007-2013 (%)`, `Median Availability of Generic Medicines 2007-2013 (%)`)
  
  chart_1_df <- reactive ({
    c1_df <- merged_data_chart2[sample(x=1:nrow(merged_data_chart2), size = input$country),]
  })
  
  output$chart2 <- renderPlot({
    ggplot(chart_1_df(), aes(x = Country, fill = `Median Prevalence of HIV 2007-2013 (%)`, y = `Median Availability of Generic Medicines 2007-2013 (%)`)) +
    geom_bar(position = "dodge", stat = "identity") + 
    theme(axis.title = element_text(size = 16), axis.text = element_text(size = 13), plot.caption = element_text(size = 12), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 0.5, size = 11)) +
    labs(caption = "This graph compares the availability of generic medicines by percentage to the percent prevalence of HIV for a country's population.")
  })
  
  output$value <- renderPrint({ input$country })
  
  ####                        ####
  ####       SUMMARY CODE     ####
  ####                        ####
  # initialize the summary tables
  summary_hiv_data <- hiv_data
  summary_che_data <- che_data
  summary_med_data <- med_data
  #Extract the column names
  names(summary_hiv_data) <- summary_hiv_data[1,]
  summary_hiv_data = summary_hiv_data[-1,]
  
  summary_hiv_data <- summary_hiv_data[summary_hiv_data$` 2021` != "No data",]
  
  names(summary_che_data) <- summary_che_data[1,]
  summary_che_data <- summary_che_data[-1,]
  
  # Clean the HIV_Prev data
  summary_hiv_data[summary_hiv_data=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
  summary_hiv_data[summary_hiv_data=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
  summary_hiv_data[summary_hiv_data=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
  summary_hiv_data[summary_hiv_data=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"
  
  summary_hiv_data <- summary_hiv_data %>%
    mutate(data_2013 = str_remove(summary_hiv_data$` 2013`, "\\[.*"))%>%
    mutate(data_2012 = str_remove(summary_hiv_data$` 2012`, "\\[.*"))%>%
    mutate(data_2011 = str_remove(summary_hiv_data$` 2011`, "\\[.*"))%>%
    mutate(data_2010 = str_remove(summary_hiv_data$` 2010`, "\\[.*"))%>%
    mutate(data_2009 = str_remove(summary_hiv_data$` 2009`, "\\[.*"))%>%
    mutate(data_2008 = str_remove(summary_hiv_data$` 2008`, "\\[.*"))%>%
    mutate(data_2007 = str_remove(summary_hiv_data$` 2007`, "\\[.*"))
  
  # Make it numeric values
  summary_hiv_data$data_2013 <- as.numeric(summary_hiv_data$data_2013)
  summary_hiv_data$data_2012 <- as.numeric(summary_hiv_data$data_2012)
  summary_hiv_data$data_2011 <- as.numeric(summary_hiv_data$data_2011)
  summary_hiv_data$data_2010 <- as.numeric(summary_hiv_data$data_2010)
  summary_hiv_data$data_2009 <- as.numeric(summary_hiv_data$data_2009)
  summary_hiv_data$data_2008 <- as.numeric(summary_hiv_data$data_2008)
  summary_hiv_data$data_2007 <- as.numeric(summary_hiv_data$data_2007)  
  
  # Calculate mean columns for each dataframe
  mean_summary_hiv_data <- summary_hiv_data %>%
    mutate("Mean Prevalence of HIV 2007-2013 (%)" = rowMeans(summary_hiv_data[,24:30], na.rm = TRUE))%>%
    select(Country, `Mean Prevalence of HIV 2007-2013 (%)`)
  mean_CHE_data <- summary_che_data %>%
    mutate("Mean Health Expenditure 2007-2013 ($)" = rowMeans(summary_che_data[,8:14], na.rm = TRUE)) %>%
    select(Country, `Mean Health Expenditure 2007-2013 ($)`)
  mean_med_data <- summary_med_data %>%
    mutate("Mean Availability of Generic Medicine 2007-2013" = 
             ((as.numeric(summary_med_data$Median.availability.of.selected.generic.medicines.......Private) +
                 as.numeric(summary_med_data$Median.availability.of.selected.generic.medicines.......Public))/2), na.rm = TRUE) %>%
    filter(!is.na(as.numeric(Median.availability.of.selected.generic.medicines.......Private))) %>%
    select(X, `Mean Availability of Generic Medicine 2007-2013`)
  
  mean_med_data <- rename(mean_med_data, Country = X)
  
  # Join the mean columns on the basis of Country name
  summary_table <- mean_CHE_data %>%
    full_join(mean_summary_hiv_data, by = "Country")%>%
    full_join(mean_med_data, by = "Country")%>%
    mutate_if(is.numeric, round)
  # output
  
  output$summaryTableHIV<- renderTable({
    present_hiv_summary_table <- summary_table %>%
      top_n(5, `Mean Prevalence of HIV 2007-2013 (%)`) %>%
      arrange(desc(`Mean Prevalence of HIV 2007-2013 (%)`)) %>%
      select(Country, `Mean Prevalence of HIV 2007-2013 (%)`)
    
    present_hiv_summary_table
  })
  output$summaryTableCHE<- renderTable({
    present_che_summary_table <- summary_table %>%
      top_n(5, `Mean Health Expenditure 2007-2013 ($)`) %>%
      arrange(desc(`Mean Health Expenditure 2007-2013 ($)`)) %>%
      select(Country, `Mean Health Expenditure 2007-2013 ($)`)
    
    present_che_summary_table
  })
  output$summaryTableMED<- renderTable({
    present_med_summary_table <- summary_table %>%
      top_n(5, `Mean Availability of Generic Medicine 2007-2013`) %>%
      arrange(desc(`Mean Availability of Generic Medicine 2007-2013`)) %>%
      select(Country, `Mean Availability of Generic Medicine 2007-2013`)
    
    present_med_summary_table
  })
  
  # summary_info.R 
  # A source file that takes in a dataset and returns a list of info about it:
  summary_info <- list()
  summary_info$average_observations <- round(((nrow(che_data)+nrow(hiv_data)+nrow(med_data))/3))
  summary_info$max_mean_che <- che_data %>%
    mutate("Mean Health Expenditure 2007-2013 ($)" = rowMeans(che_data[,8:14], na.rm = TRUE)) %>%
    filter(`Mean Health Expenditure 2007-2013 ($)` == max(`Mean Health Expenditure 2007-2013 ($)`, na.rm=TRUE)) %>%
    mutate_if(is.numeric, round)%>%
    pull(`Mean Health Expenditure 2007-2013 ($)`)
  
  summary_info$max_mean_che_country <- che_data %>%
    mutate("Mean Health Expenditure 2007-2013 ($)" = rowMeans(che_data[,8:14], na.rm = TRUE)) %>%
    filter(`Mean Health Expenditure 2007-2013 ($)` == max(`Mean Health Expenditure 2007-2013 ($)`, na.rm=TRUE)) %>%
    pull(X)
  
  summary_info$max_mean_med <- med_data %>%
    mutate("Mean Availability of Generic Medicine 2007-2013" = 
             ((as.numeric(med_data$Median.availability.of.selected.generic.medicines.......Private) +
                 as.numeric(med_data$Median.availability.of.selected.generic.medicines.......Public))/2), na.rm = TRUE) %>%
    filter(`Mean Availability of Generic Medicine 2007-2013` == max(`Mean Availability of Generic Medicine 2007-2013`, na.rm = TRUE)) %>%
    mutate_if(is.numeric, round)%>%
    pull(`Mean Availability of Generic Medicine 2007-2013`)
  
  summary_info$max_mean_med_country <- med_data %>%
    mutate("Mean Availability of Generic Medicine 2007-2013" = 
             ((as.numeric(med_data$Median.availability.of.selected.generic.medicines.......Private) +
                 as.numeric(med_data$Median.availability.of.selected.generic.medicines.......Public))/2), na.rm = TRUE) %>%
    filter(`Mean Availability of Generic Medicine 2007-2013` == max(`Mean Availability of Generic Medicine 2007-2013`, na.rm = TRUE)) %>%
    pull(X)
  
  output$summary_information <- renderTable(
    summary_info
  )

}


