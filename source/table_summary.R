library("tidyr")
library("dplyr")
library("ggplot2")
library("stringr")

#Import the datasets
Medicine_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/med_aval.csv")
HIV_Prev_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/prev_hiv.csv")
CHE_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/CHE_data.csv")

#Extract the column names
names(HIV_Prev_data) <- HIV_Prev_data[1,]
HIV_Prev_data = HIV_Prev_data[-1,]

HIV_Prev_data <- HIV_Prev_data[HIV_Prev_data$` 2021` != "No data",]

names(CHE_data) <- CHE_data[1,]
CHE_data = CHE_data[-1,]

# Clean the HIV_Prev data
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
HIV_Prev_data[HIV_Prev_data=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"

HIV_Prev_data <- HIV_Prev_data %>%
  mutate(data_2013 = str_remove(HIV_Prev_data$` 2013`, "\\[.*"))%>%
  mutate(data_2012 = str_remove(HIV_Prev_data$` 2012`, "\\[.*"))%>%
  mutate(data_2011 = str_remove(HIV_Prev_data$` 2011`, "\\[.*"))%>%
  mutate(data_2010 = str_remove(HIV_Prev_data$` 2010`, "\\[.*"))%>%
  mutate(data_2009 = str_remove(HIV_Prev_data$` 2009`, "\\[.*"))%>%
  mutate(data_2008 = str_remove(HIV_Prev_data$` 2008`, "\\[.*"))%>%
  mutate(data_2007 = str_remove(HIV_Prev_data$` 2007`, "\\[.*"))

# Make it numeric values
HIV_Prev_data$data_2013 <- as.numeric(HIV_Prev_data$data_2013)
HIV_Prev_data$data_2012 <- as.numeric(HIV_Prev_data$data_2012)
HIV_Prev_data$data_2011 <- as.numeric(HIV_Prev_data$data_2011)
HIV_Prev_data$data_2010 <- as.numeric(HIV_Prev_data$data_2010)
HIV_Prev_data$data_2009 <- as.numeric(HIV_Prev_data$data_2009)
HIV_Prev_data$data_2008 <- as.numeric(HIV_Prev_data$data_2008)
HIV_Prev_data$data_2007 <- as.numeric(HIV_Prev_data$data_2007)

# Calculate mean columns for each dataframe
mean_HIV_Prev_data <- HIV_Prev_data %>%
  mutate("Mean Prevalence of HIV 2007-2013 (%)" = rowMeans(HIV_Prev_data[,24:30], na.rm = TRUE))%>%
  select(Country, `Mean Prevalence of HIV 2007-2013 (%)`)
mean_CHE_data <- CHE_data %>%
  mutate("Mean Health Expenditure 2007-2013 ($)" = rowMeans(CHE_data[,8:14], na.rm = TRUE)) %>%
  select(Country, `Mean Health Expenditure 2007-2013 ($)`)
mean_medicine_data <- Medicine_data %>%
  mutate("Mean Availability of Generic Medicine 2007-2013" = 
           ((as.numeric(Medicine_data$Median.availability.of.selected.generic.medicines.......Private) +
               as.numeric(Medicine_data$Median.availability.of.selected.generic.medicines.......Public))/2), na.rm = TRUE) %>%
  filter(!is.na(as.numeric(Median.availability.of.selected.generic.medicines.......Private))) %>%
  select(X, `Mean Availability of Generic Medicine 2007-2013`)

mean_medicine_data <- rename(mean_medicine_data, Country = X)

# Join the mean columns on the basis of Country name
summary_table <- mean_CHE_data %>%
  inner_join(mean_HIV_Prev_data, by = "Country")%>%
  inner_join(mean_medicine_data, by = "Country")%>%
  mutate_if(is.numeric, round)


