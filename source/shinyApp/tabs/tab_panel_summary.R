# tab_panel_summary

library(shiny)

tab_panel_summary <-tabPanel(
    "Summary",
    h3("Key takeaways:"),
    p("One takeaway that we found from our analysis was that there is not a strong correlation between generic medicine availability and HIV prevalence. Our reasoning for thinking there would be a correlation when we first made the research question was that countries with high medicine availability would be more developed countries and be more likely to have lower HIV rates, but this was not always true."),
    p("Another takeaway we had was that countries that spent the least on their health expenditure per capita had the highest HIV prevalence among adults aged 15 to 49. This was something we predicted in our proposal, but it was also interesting to note that some of the countries with low HIV prevalence also did not spend nearly as much as other countries that spent thousands of dollars per capita. This could also be due to lower population counts."),
    p("The final takeaway we had was that African countries are disproportionately affected by HIV. The highest rates of HIV prevalence were all found in Africa, and these countries are not equipped with the funding to spend on their citizens and treat HIV like other first world countries are able to."),
          
    h3("Top 5 Countries with the highest average Prevalence of HIV 2007-2013 (%)"),
    
    tableOutput(outputId = "summaryTableHIV"),
    
    h3("Top 5 Countries with the highest average Health Expenditure 2007-2013 ($)"),
    
    tableOutput(outputId = "summaryTableCHE"),
    
    h3("Top 5 Countries with the highest average Availability of Generic Medicine 2007-2013"),
    
    tableOutput(outputId = "summaryTableMED"),
    
    h3("Some summary values"),
    
    tableOutput(outputId = "summary_information")
)

