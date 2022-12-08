#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

source("tabs/tab_panel_intro.R")
source("tabs/tab_panel_chart1.R")
source("tabs/tab_panel_chart2.R")
source("tabs/tab_panel_summary.R")
source("tabs/tab_panel_report.R")

ui <- navbarPage(
  theme = shinythemes::shinytheme("united"),
  title = "Allocation of Health",
  position = "fixed-top",

  # A simple footer
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("Allocation of Health | P3: Final Deliverable | Info 201: Fall 2022 | Amit Peled, Jeffrey Zeng, Shawn Leonard "),
    hr()
  ),
  # The project introduction
  tab_panel_intro,

  # The two charts
  tab_panel_chart1,
  tab_panel_chart2,

  # The project summary
  tab_panel_summary,

  # The project report
  tab_panel_report
)
