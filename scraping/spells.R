library(rvest)
library(tibble)
library(dplyr)

spells_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Spells")

spells_names_raw <- html_nodes(spells_raw, ".mw-content-text ul li") %>% html_text()

spells_names <- sub("\\[.*", "", spells_names_raw)
spells_names <- sub("\\(.*", "", spells_names)

for(i in 1:length(spells_names)){
  url <- paste("http://engl393-dnd5th.wikia.com/wiki/", spells_names[i], sep = "")
  spells_pages_raw <- read_html(url)
}
