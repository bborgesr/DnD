# load needed libraries
library(dplyr)
library(tidyjson)
library(stringr)
library(purrr)

json_data <- tidyjson::read_json("data/json/5esrd.json")   # import raw data
json_data %>% gather_keys %>% json_types %>% json_lengths  # peek into keys