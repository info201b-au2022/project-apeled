library("tidyr")
library("dplyr")
library("ggplot2")
library("stringr")

Med_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/med_aval.csv")
HIV_data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/prev_hiv.csv")

names(HIV_data) <- HIV_data[1,]
HIV_data = HIV_data[-1,]

HIV_data <- HIV_data[HIV_data$` 2021` != "No data",]

names(Med_data) <- Med_data[1,]
Med_data = Med_data[-1,]
Med_data = Med_data[-3]

colnames(Med_data)[2] = "Median Availability of Generic Medicines 2007-2013 (%)"

HIV_data[HIV_data=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
HIV_data[HIV_data=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
HIV_data[HIV_data=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
HIV_data[HIV_data=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"

HIV_data <- HIV_data %>%
  mutate(data_2013 = str_remove(HIV_data$` 2013`, "\\[.*"))
HIV_data <- HIV_data %>%
  mutate(data_2012 = str_remove(HIV_data$` 2012`, "\\[.*"))
HIV_data <- HIV_data %>%
  mutate(data_2011 = str_remove(HIV_data$` 2011`, "\\[.*"))
HIV_data <- HIV_data %>%
  mutate(data_2010 = str_remove(HIV_data$` 2010`, "\\[.*"))
HIV_data <- HIV_data %>%
  mutate(data_2009 = str_remove(HIV_data$` 2009`, "\\[.*"))
HIV_data <- HIV_data %>%
  mutate(data_2008 = str_remove(HIV_data$` 2008`, "\\[.*"))
HIV_data <- HIV_data %>%
  mutate(data_2007 = str_remove(HIV_data$` 2007`, "\\[.*"))

HIV_data$data_2013 <- as.numeric(HIV_data$data_2013)
HIV_data$data_2012 <- as.numeric(HIV_data$data_2012)
HIV_data$data_2011 <- as.numeric(HIV_data$data_2011)
HIV_data$data_2010 <- as.numeric(HIV_data$data_2010)
HIV_data$data_2009 <- as.numeric(HIV_data$data_2009)
HIV_data$data_2008 <- as.numeric(HIV_data$data_2008)
HIV_data$data_2007 <- as.numeric(HIV_data$data_2007)

HIV_data <- HIV_data %>%
  mutate("Median Prevalence of HIV 2007-2013 (%)" = rowMeans(HIV_data[,24:30], na.rm = TRUE))

merged_data <- inner_join(HIV_data, Med_data, by = "Country")
merged_data <- merged_data %>%
  select(Country, `Median Prevalence of HIV 2007-2013 (%)`, `Median Availability of Generic Medicines 2007-2013 (%)`)

Graph3 <- ggplot(data = merged_data, aes(x = Country, fill = `Median Prevalence of HIV 2007-2013 (%)`, y = `Median Availability of Generic Medicines 2007-2013 (%)`)) +
  geom_bar(position = "dodge", stat = "identity")
print(Graph3)