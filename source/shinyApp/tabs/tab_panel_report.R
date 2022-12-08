# tab_panel_report

library(shiny)
library("markdown")

tab_panel_report <-tabPanel(
  "Report",

  fluidPage(
    includeMarkdown("tabs/report.md")
  )


)

