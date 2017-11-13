library(rvest)
library(tibble)
library(dplyr)
library(glue)
library(DT)
library(magrittr)

backgrounds_raw <- read_html("http://engl393-dnd5th.wikia.com/wiki/Backgrounds")

backgrounds_names_raw <- html_nodes(backgrounds_raw, ".mw-content-text ul~ul~ul~ul~ul li") %>% html_text()
backgrounds_names <- sub("\\(.*", "", backgrounds_names_raw)
backgrounds_names <- trimws(backgrounds_names, which = c("both"))
backgrounds_names_url <- gsub(" ", "_", backgrounds_names, fixed = TRUE)

backgrounds_overview_header_list <- list()
backgrounds_overview_header <- character(0)
backgrounds_overview <- character(0)
urls <- character(0)

for (i in 1:length(backgrounds_names_url)) {
  urls[i] <- paste("http://engl393-dnd5th.wikia.com/wiki/", backgrounds_names_url[i], sep = "")
}

backgrounds_overview <- list()
backgrounds_feature <- list()
backgrounds_suggested <- list()
backgrounds_personality <- list()
unique_columns <- character(0)
columns <- character(0)

backgrounds_overview_html_types <- list()
backgrounds_feature_html_types <- list()
backgrounds_suggested_html_types <- list()

for (i in 1:length(backgrounds_names)) {
  ith_background <- try(read_html(urls[i]))
  if (inherits(ith_background, "try-error")) next
  else {
    all_text <- html_nodes(ith_background, css = "#mw-content-text *:not(nav):not(div):not(span):not(a):not(img):not(noscript):not(link)")
    h2s <- all_text %>% html_nodes(".mw-headline") 
    unique_columns <- unique(c(columns, unlist(lapply(h2s, function(x) html_attr(x, "id") ))))
    columns <- c(columns, unlist(lapply(h2s, function(x) html_attr(x, "id") )))
    
    idxs <- which(html_name(all_text) == "h2")
    for (j in idxs) {
      jth_h2 <- all_text %>% extract(j)
      if (html_text(jth_h2) == "Contents") idxs <- idxs[!idxs == j]
    }
    print(paste(backgrounds_names[i], length(idxs)))
    # idx_overview <- idxs[1]
    # idx_feature <- idxs[2]
    # idx_suggested <- idxs[3]
    # idx_last <- length(all_text)
    # 
    # ith_overview <- all_text %>% extract((idx_overview + 1):(idx_feature - 1)) %>% html_nodes(css = "*:not(h2)")
    # backgrounds_overview[i] <- paste(ith_overview, collapse = " ")
    # 
    # ith_feature <- all_text %>% extract((idx_feature + 1):(idx_suggested - 1)) %>% html_nodes(css = "*:not(h2)")
    # backgrounds_feature[i] <- paste(ith_feature, collapse = " ")
    # 
    # ith_suggested <- all_text %>% extract((idx_suggested + 1):(idx_last)) %>% html_nodes(css = "*:not(h2)")
    # backgrounds_suggested[i] <- paste(ith_suggested, collapse = " ")
    # 
    # backgrounds_overview_html_types[i] <- paste(html_name(ith_overview), collapse = "; ")
    # backgrounds_feature_html_types[i] <- paste(html_name(ith_feature), collapse = "; ")
    # backgrounds_suggested_html_types[i] <- paste(html_name(ith_suggested), collapse = "; ")
  }
}

backgrounds_tbl <- tibble(
  name = backgrounds_names, 
  overview = backgrounds_overview, 
  feature = backgrounds_feature,
  `suggested characteristics` = backgrounds_suggested,
  personality = backgrounds_personality
)

backgrounds_tbl_html_types <- tibble(
  name = backgrounds_names, 
  overview = backgrounds_overview_html_types, 
  feature = backgrounds_feature_html_types,
  suggested = backgrounds_suggested_html_types
)

datatable(backgrounds_tbl, escape = FALSE)
