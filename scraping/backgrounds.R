library(rvest)
library(tibble)
library(dplyr)

backgrounds_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Backgrounds")

backgrounds_names_raw <- html_nodes(backgrounds_raw, ".mw-content-text ul~ul~ul~ul~ul li") %>% html_text()

backgrounds_names <- sub("\\(.*", "", backgrounds_names_raw)
backgrounds_names <- trimws(backgrounds_names, which = c("both"))

       
backgrounds_names_url <- gsub(" ", "_", backgrounds_names, fixed = TRUE)


isOverview <- function(text) {
  init <- substr(text, 1, 9)
  if (init == " Overview") TRUE
  else FALSE
}

for(i in 1:length(backgrounds_names_url)){
  url <- paste("http://engl393-dnd5th.wikia.com/wiki/", backgrounds_names_url[i], sep = "")
  backgrounds_pages_raw <- read_html(url)
  backgrounds_overview_header <- html_nodes(backgrounds_pages_raw, ".mw-content-text h2") %>% html_text()
  
  for(i in 1:length(backgrounds_overview_header)){
    if(isOverview(backgrounds_overview_header[i])){
      backgrounds_overview <- html_nodes(backgrounds_pages_raw, ".mw-content-text + h2 + p") %>% html_text()
    }
  }

}

isFeature <- function(text) {
  init <- substr(text, 1, 7)
  if (init == "Feature") TRUE
  else FALSE
}

isSuggestedChar <- function(text) {
  init <- substr(text, 1, 9)
  if (init == "Suggested") TRUE
  else FALSE
}