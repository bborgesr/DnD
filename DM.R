library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "DM"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Combat Tracker"),
      menuItem("Dice Roller"),
      menuItem("Notes", tabName = "notes"),
      menuItem("Database")
    )
  ),
  dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)