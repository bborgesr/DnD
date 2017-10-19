library(rvest)
library(tibble)
library(dplyr)

feats_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Feats")

feats_name_raw <- html_nodes(feats_raw, ".mw-headline") %>%  html_text
feats_name <- sub("\\(.*", "", feats_name_raw) %>% sapply(trimws) %>% unname # length(feats_name) # 95

feats_first_raw <- html_nodes(feats_raw, "h3 + p") %>%  html_text

isPrereq <- function(text) {
  init <- substr(text, 1, 12)
  if (init == "Prerequisite") TRUE
  else FALSE
}

feats_prereq <- character(0)
  
for (i in 1:length(feats_first_raw)) {
  item <- feats_first_raw[i]
  if (isPrereq(item)) {
    prereq <- sub("Prerequisite: ", "", item)
    prereq <- sub("\\\n", "", prereq)
    prereq <- sub("When.*", "", prereq)
    prereq <- sub("You.*", "", prereq)
    feats_prereq[i] <- prereq
  } else feats_prereq[i] <- NA
}

feats_second <- character(0)
feats_ul <- character(0)

feats_first <- html_nodes(feats_raw, "h3 + p:not(i)") %>% html_text
feats_second <- html_nodes(feats_raw, "h3 + p + p") %>% html_text
feats_ul <- html_nodes(feats_raw, "h3 + p + ul") %>% html_text


feats_tbl <- tibble(name = feats_name, prereq = feats_prereq, stdescription = feats_first, nddescription = feats_second, uldescription = feats_ul)

