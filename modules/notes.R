
notesModUI <- function(id) {
  ns <- NS(id)
  tagList(
    withTags(
      ul(
        li(a("Mock session", href = "notes/mock-session.html", target = "blank")),
        li(a("Mock inventory", href = "notes/mock-inventory.html", target = "blank"))
      )
    )
  )
}

notesMod <- function(input, output, session) {}
