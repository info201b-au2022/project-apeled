# tab_panel_summary

library(shiny)

tab_panel_summary <-tabPanel(
    "Summary",
    p("This is for the summary of key points."),
    
    h3("Top 5 Countries with the highest average Prevalence of HIV 2007-2013 (%)"),
    
    tableOutput(outputId = "summaryTableHIV"),
    
    h3("Top 5 Countries with the highest average Health Expenditure 2007-2013 ($)"),
    
    tableOutput(outputId = "summaryTableCHE"),
    
    h3("Top 5 Countries with the highest average Availability of Generic Medicine 2007-2013"),
    
    tableOutput(outputId = "summaryTableMED"),
    
)

