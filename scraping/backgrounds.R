library(rvest)
library(tibble)
library(dplyr)

backgrounds_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Backgrounds")

backgrounds_names_raw <- html_nodes(backgrounds_raw, ".mw-content-text ul~ul~ul~ul~ul li") %>% html_text()

backgrounds_names <- sub("\\(.*", "", backgrounds_names_raw)
trimws(backgrounds_names, which = c("both"))
       
backgrounds_names_url <- sub("\\ ", "", backgrounds_names)
