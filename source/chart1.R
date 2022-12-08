library(dplyr)
library(stringr)
library(ggplot2)

health_expenditure <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/CHE_data.csv")
names(health_expenditure) <- health_expenditure[1,]
health_expenditure = health_expenditure[-1,]
health_expenditure <- health_expenditure[!is.na(health_expenditure$`2019`),]

health_expenditure <- health_expenditure %>% 
  mutate("Current health expenditure (CHE) per capita in US$" = health_expenditure$`2019`) %>% 
  select(Country, `Current health expenditure (CHE) per capita in US$`)

hiv <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-apeled/main/data/prev_hiv.csv")
names(hiv) <- hiv[1,]  
hiv = hiv[-1,]

hiv <- hiv[hiv$` 2019` != "No data",]
hiv[hiv=="&lt;0.1 [&lt;0.1-0.2]"] <- "0.1"
hiv[hiv=="&lt;0.1 [&lt;0.1-&lt;0.1]"] <- "0.1"
hiv[hiv=="&lt;0.1 [&lt;0.1-0.1]"] <- "0.1"
hiv[hiv=="&lt;0.1 [&lt;0.1-0.3]"] <- "0.1"

hiv <- hiv %>% 
  mutate("Prevalence of HIV among adults aged 15 to 49 (%)" = str_remove(hiv$` 2019`, "\\[.*")) %>% 
  select(Country, `Prevalence of HIV among adults aged 15 to 49 (%)`)

hiv$`Prevalence of HIV among adults aged 15 to 49 (%)` <- as.numeric(hiv$`Prevalence of HIV among adults aged 15 to 49 (%)`)

merged_data <- inner_join(hiv, health_expenditure, by = "Country")

graph1 <- ggplot(data = merged_data) +
  geom_point(mapping =  aes(x = `Prevalence of HIV among adults aged 15 to 49 (%)`, 
                            y = `Current health expenditure (CHE) per capita in US$`,
                            color = Country)) +
  theme(legend.key.size = unit(0.2, "cm")) +
  theme(legend.position="bottom")


print(graph1)

