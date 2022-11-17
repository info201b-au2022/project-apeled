library("tidyr")
library("dplyr")
library("ggplot2")
library("stringr")

Medicine_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/med_aval.csv")
HIV_Prev_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/prev_hiv.csv")
CHE_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/CHE_data.csv")

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$average_observations <- round(((nrow(CHE_data)+nrow(HIV_Prev_data)+nrow(Medicine_data))/3))
summary_info$max_mean_che <- CHE_data %>%
  mutate("Mean Health Expenditure 2007-2013 ($)" = rowMeans(CHE_data[,8:14], na.rm = TRUE)) %>%
  filter(`Mean Health Expenditure 2007-2013 ($)` == max(`Mean Health Expenditure 2007-2013 ($)`, na.rm=TRUE)) %>%
  mutate_if(is.numeric, round)%>%
  pull(`Mean Health Expenditure 2007-2013 ($)`)

summary_info$max_mean_che_country <- CHE_data %>%
  mutate("Mean Health Expenditure 2007-2013 ($)" = rowMeans(CHE_data[,8:14], na.rm = TRUE)) %>%
  filter(`Mean Health Expenditure 2007-2013 ($)` == max(`Mean Health Expenditure 2007-2013 ($)`, na.rm=TRUE)) %>%
  pull(X)
  
summary_info$max_mean_med <- Medicine_data %>%
  mutate("Mean Availability of Generic Medicine 2007-2013" = 
           ((as.numeric(Medicine_data$Median.availability.of.selected.generic.medicines.......Private) +
               as.numeric(Medicine_data$Median.availability.of.selected.generic.medicines.......Public))/2), na.rm = TRUE) %>%
  filter(`Mean Availability of Generic Medicine 2007-2013` == max(`Mean Availability of Generic Medicine 2007-2013`, na.rm = TRUE)) %>%
  mutate_if(is.numeric, round)%>%
  pull(`Mean Availability of Generic Medicine 2007-2013`)

summary_info$max_mean_med_country <- Medicine_data %>%
  mutate("Mean Availability of Generic Medicine 2007-2013" = 
           ((as.numeric(Medicine_data$Median.availability.of.selected.generic.medicines.......Private) +
               as.numeric(Medicine_data$Median.availability.of.selected.generic.medicines.......Public))/2), na.rm = TRUE) %>%
  filter(`Mean Availability of Generic Medicine 2007-2013` == max(`Mean Availability of Generic Medicine 2007-2013`, na.rm = TRUE)) %>%
  pull(X)