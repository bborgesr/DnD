library(rvest)
library(tibble)
library(dplyr)

spells_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Spells")

spells_names_raw <- html_nodes(spells_raw, ".mw-content-text ul li") %>% html_text()

spells_names <- sub("\\[.*", "", spells_names_raw)
spells_names <- sub("\\(.*", "", spells_names)
spells_names <- trimws(spells_names, which = "both")

spells_names_underscored <- gsub(" ", "_", spells_names, fixed = TRUE)

spell_pages <- character(0)

for(i in 1:length(spells_names)){
  url <- paste("http://engl393-dnd5th.wikia.com/wiki/", spells_names_underscored[i], sep = "")
  spells_pages_raw <- read_html(url)
  spell_pages[i] <- html_nodes(spells_pages_raw, ".mw-content-text + p") %>% html_text()
}

# url <- "http://engl393-dnd5th.wikia.com/wiki/Booming_Blade"
# spell_raw <- read_html(url)
# spell <- html_nodes(spell_raw, ".mw-content-text p") %>% html_text()
# spell