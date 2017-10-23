library(rvest)
library(tibble)
library(dplyr)

spells_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Spells")

spells_names_raw <- html_nodes(spells_raw, ".mw-content-text h3") %>% html_text()

spell_names_list <- html_nodes(spells_names_raw, "ul") %>% html_text()

spell_names <- html_nodes(spell_names_list, "li") %>% html_text()