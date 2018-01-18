library(htmltools)
library(shiny)
library(shinydashboard)

source("modules/sheet.R")
source("modules/notes.R")
source("modules/roller.R")
source("modules/database.R")

ui <- dashboardPage(
  dashboardHeader(title = "PC"),
  dashboardSidebar(
    sidebarMenu(id = "tabs",
      menuItem("Character Sheet", tabName = "sheet", icon = icon("user")),
      menuItem("Notes", tabName = "notes", icon = icon("sticky-note-o")),
      menuItem("Dice Roller", tabName = "roller", icon = icon("cube")),
      menuItem("Database", tabName = "database", icon = icon("database"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("sheet",    sheetModUI("sheet-mod")),
      tabItem("notes",    notesModUI("notes-mod")),
      tabItem("roller",   rollerModUI("roller-mod")),
      tabItem("database", databaseModUI("database-mod")) 
    )
  )
)

server <- function(input, output, session) {
  
  callModule(sheetMod,    "sheet-mod")
  callModule(notesMod,    "notes-mod")
  callModule(rollerMod,   "roller-mod")
  callModule(databaseMod, "database-mod")
}

shinyApp(ui, server)