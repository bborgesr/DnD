library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "PC"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Character Sheet"),
      menuItem("Notes"),
      menuItem("Dice Roller"),
      menuItem("Database")
    )
  ),
  dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)