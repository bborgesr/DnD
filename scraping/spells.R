library(rvest)
library(tibble)
library(dplyr)

spells_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Spells")

spells_names_raw <- html_nodes(spells_raw, ".mw-content-text ul li") %>% html_text()
