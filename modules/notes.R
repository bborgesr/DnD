
notesModUI <- function(id) {
  ns <- NS(id)
  tagList(
    withTags(
      ul(
        li(a("Mock session", href = "data/notes/mock-session.html", target='blank')),
        li(a("Mock session", href = "data/notes/mock-inventory.html", target='blank'))
      )
    )
  )
}

notesMod <- function(input, output, session) {
  print(file.exists("data/notes/mock-session.html"))
}
