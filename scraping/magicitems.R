library(rvest)
library(tibble)
library(dplyr)

magicitems_raw <- read_html("https://donjon.bin.sh/5e/magic_items/")

magicitems_names_raw <- html_nodes(magicitems_raw, "#item_list tr + td") %>% html_text()
magicitems_names_raw

