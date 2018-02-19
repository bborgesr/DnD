
rollerModUI <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("d4"), "Randomize a d4"),
    textOutput("rd4")
  )
}

rollerMod <- function(input, output, session) {
  observeEvent(input$d4, {
    output$rd4 <- renderText(sample(1:4, 1, replace = TRUE))
  })
}
