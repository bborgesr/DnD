
rollerModUI <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("d4"), "Randomize a d4")
  )
}

rollerMod <- function(input, output, session) {
  observeEvent(input$d4, {
    output$rd4 <- sample(1:4)  
  })
}
