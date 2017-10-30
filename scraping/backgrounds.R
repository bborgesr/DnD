library(rvest)
library(tibble)
library(dplyr)

backgrounds_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Backgrounds")

backgrounds_names_raw <- html_nodes(backgrounds_raw, ".mw-content-text ul~ul~ul~ul~ul li") %>% html_text()

backgrounds_names <- sub("\\(.*", "", backgrounds_names_raw)
backgrounds_names <- trimws(backgrounds_names, which = c("both"))

       
backgrounds_names_url <- sub(" ", "_", backgrounds_names)
backgrounds_names_url[2] <- "Black_Fist_Double_Agent"
backgrounds_names_url[50] <- "Urban_Bounty_Hunter"
backgrounds_names_url

for(i in 1:length(backgrounds_names_url)){
  url <- backgrounds_names_url[i]
  backgrounds_pages_raw <- read_html(url)
  backgrounds_overview_header <- html_nodes(backgrounds_pages_raw, ".mw-content-text + h2") %>% html_text()
  if(isOverview(backgrounds_overview_header)){
    backgrounds_overview <- html_nodes(backgrounds_pages_raw, ".mw-content-text + h2 + p") %>% html_text()
  }
  
}

isOverview <- function(text) {
  init <- substr(text, 1, 8)
  if (init == "Overview") TRUE
  else FALSE
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