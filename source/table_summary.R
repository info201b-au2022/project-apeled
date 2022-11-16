library("tidyr")
library("dplyr")
library("ggplot2")
library("stringr")


source("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/source/calculates_summary_information.R")


Medicine_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/med_aval.csv")
HIV_Prev_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/prev_hiv.csv")
CHE_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/CHE_data.csv")

names(HIV_Prev_data) <- HIV_Prev_data[1,]
HIV_Prev_data = HIV_Prev_data[-1,]

HIV_Prev_data <- HIV_Prev_data[HIV_Prev_data$` 2021` != "No data",]

names(Medicine_data) <- Medicine_data[1,]
Medicine_data = Medicine_data[-1,]

names(CHE_data) <- CHE_data[1,]
CHE_data = CHE_data[-1,]

HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"

HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2013 = str_remove(HIV_Prev_data$` 2013`, "\\[.*"))
HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2012 = str_remove(HIV_Prev_data$` 2012`, "\\[.*"))
HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2011 = str_remove(HIV_Prev_data$` 2011`, "\\[.*"))
HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2010 = str_remove(HIV_Prev_data$` 2010`, "\\[.*"))
HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2009 = str_remove(HIV_Prev_data$` 2009`, "\\[.*"))
HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2008 = str_remove(HIV_Prev_data$` 2008`, "\\[.*"))
HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2007 = str_remove(HIV_Prev_data$` 2007`, "\\[.*"))

HIV_Prev_data$data_2013 <- as.numeric(HIV_Prev_data$data_2013)
HIV_Prev_data$data_2012 <- as.numeric(HIV_Prev_data$data_2012)
HIV_Prev_data$data_2011 <- as.numeric(HIV_Prev_data$data_2011)
HIV_Prev_data$data_2010 <- as.numeric(HIV_Prev_data$data_2010)
HIV_Prev_data$data_2009 <- as.numeric(HIV_Prev_data$data_2009)
HIV_Prev_data$data_2008 <- as.numeric(HIV_Prev_data$data_2008)
HIV_Prev_data$data_2007 <- as.numeric(HIV_Prev_data$data_2007)

HIV_Prev_data <- HIV_Prev_data %>%
  mutate("Median Prevalence of HIV 2007-2013 (%)" = rowMeans(HIV_Prev_data[,24:30], na.rm = TRUE))
CHE_data <- CHE_data %>%
  mutate("Median Health Expenditure 2007-2013 ($)" = rowMeans(CHE_data[,8:14], na.rm = TRUE))

mean_medicine_data <- rename(mean_medicine_data, Country = X)

summary_table <- mean_CHE_data %>%
  inner_join(mean_HIV_Prev_data, by = "Country")%>%
  inner_join(mean_medicine_data, by = "Country")%>%
  mutate_if(is.numeric, round)

  
