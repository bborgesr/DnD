
notesModUI <- function(id) {
  ns <- NS(id)
  tagList(
    withTags(
      ul(id = "notes",
        li(a("Mock session", href = "notes/mock-session.html", target = "blank")),
        li(a("Mock inventory", href = "notes/mock-inventory.html", target = "blank"))
      )
    ),
    fileInput(ns("file"), "Upload", accept = ".md")
  )
}

notesMod <- function(input, output, session) {
  observeEvent(input$file, {
    newName <- sub(".md", "", input$file$name, fixed = TRUE)
    render(input$file$datapath, "html_document", output_dir ="www/notes", output_file = glue("{newName}.html"))
    
    observeEvent(file.exists(glue("www/notes/{newName}.html")), {
      insertUI(
        selector = "#notes",
        where = "beforeEnd",
        ui = tags$li(tags$a(newName, href = glue("notes/{newName}.html"), target = "blank"))
      )
    })
  }, ignoreInit = TRUE)
}
