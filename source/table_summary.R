library("tidyr")
library("dplyr")
library("ggplot2")
library("stringr")


source("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/source/calculates_summary_information.R")

mean_medicine_data <- rename(mean_medicine_data, Country = X)

summary_table <- mean_CHE_data %>%
  inner_join(mean_HIV_Prev_data, by = "Country")%>%
  inner_join(mean_medicine_data, by = "Country")%>%
  mutate_if(is.numeric, round)

  
