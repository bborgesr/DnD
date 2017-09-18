
source("data/scripts/global.R")

# 1) Legal Information
# This is for us to read as users of this repo 
# (https://github.com/BTMorton/dnd-5e-srd/tree/master/json)


# 2) Races
races <- json_data %>% enter_object("Races")               # enter the "Races" key
races %>% gather_keys %>% json_types %>% json_lengths      # peek into keys


## *********************************************************************** ##
## *********************************************************************** ##
## 2.1) Racial Traits
## *********************************************************************** ##
## *********************************************************************** ##

racial_traits <- races %>% enter_object("Racial Traits")
racial_traits %>% gather_keys %>% json_types %>% json_lengths

# final Racial Traits table
racial_traits <- racial_traits %>% gather_keys("Trait") %>% 
  append_values_string("Description") %>% 
  select(-document.id) %>% 
  mutate(Trait = replace(Trait, Trait == "content", "Intro"))

# See the final data
View(racial_traits)

# usage example (see what "Languages" says)
racial_traits %>% filter(Trait == "Languages") %>% pull(Description)


## *********************************************************************** ##
## *********************************************************************** ##
## 2.2) Dwarf
## *********************************************************************** ##
## *********************************************************************** ##

dwarf <- races %>% enter_object("Dwarf")
dwarf %>% gather_keys %>% json_types %>% json_lengths

dwarf <- dwarf %>% enter_object("Dwarf Traits")
dwarf %>% gather_keys %>% json_types %>% json_lengths

dwarf_traits <- dwarf %>% enter_object("content") %>% 
  gather_array %>% append_values_string("Description") %>% 
  select(-c(document.id, array.index)) %>%
  mutate(
    Trait = map(Description, function(string) {
      temp <- str_split(string, "\\*\\*\\*")[[1]][2]
      trait <- str_split(temp, "\\.")[[1]][1] 
      if (is.na(trait)) {
        trait <- "Intro"
      }
      trait
    }) %>% unlist(),
    Description = map(Description, function(string) {
      splits <- str_split(string, "\\.\\*\\*\\*")[[1]]
      if (is.na(splits[2])) splits[1] else splits[2] 
    }) %>% unlist()
  ) %>%
  select(Trait, Description)

dwarf_hill <- dwarf %>% enter_object("Hill Dwarf") %>% 
  enter_object("content") %>% gather_array %>% 
  append_values_string("Description") %>% 
  select(-c(document.id, array.index)) %>%
  mutate(
    Trait = map(Description, function(string) {
      temp <- str_split(string, "\\*\\*\\*")[[1]][2]
      trait <- str_split(temp, "\\.")[[1]][1] 
      if (is.na(trait)) {
        trait <- "Intro"
      }
      trait
    }) %>% unlist(),
    Description = map(Description, function(string) {
      splits <- str_split(string, "\\.\\*\\*\\*")[[1]]
      if (is.na(splits[2])) splits[1] else splits[2] 
    }) %>% unlist()
  ) %>%
  select(Trait, Description)

# See the final data
View(dwarf_traits)
View(dwarf_hill)

# usage example (see what "Intro" says)
dwarf_hill %>% filter(Trait == "Intro") %>% pull(Description)


## *********************************************************************** ##
## *********************************************************************** ##
## 2.3) Elf
## *********************************************************************** ##
## *********************************************************************** ##

elf <- races %>% enter_object("Elf")
elf %>% gather_keys %>% json_types %>% json_lengths

elf <- elf %>% enter_object("Elf Traits")
elf %>% gather_keys %>% json_types %>% json_lengths

elf_traits <- elf %>% enter_object("content") %>% 
  gather_array %>% append_values_string("Description") %>% 
  select(-c(document.id, array.index)) %>%
  mutate(
    Trait = map(Description, function(string) {
      temp <- str_split(string, "\\*\\*\\*")[[1]][2]
      trait <- str_split(temp, "\\.")[[1]][1] 
      if (is.na(trait)) {
        trait <- "Intro"
      }
      trait
    }) %>% unlist(),
    Description = map(Description, function(string) {
      splits <- str_split(string, "\\.\\*\\*\\*")[[1]]
      if (is.na(splits[2])) splits[1] else splits[2] 
    }) %>% unlist()
  ) %>%
  select(Trait, Description)

elf_high <- elf %>% enter_object("High Elf") %>% 
  enter_object("content") %>% gather_array %>% 
  append_values_string("Description") %>% 
  select(-c(document.id, array.index)) %>%
  mutate(
    Trait = map(Description, function(string) {
      temp <- str_split(string, "\\*\\*\\*")[[1]][2]
      trait <- str_split(temp, "\\.")[[1]][1] 
      if (is.na(trait)) {
        trait <- "Intro"
      }
      trait
    }) %>% unlist(),
    Description = map(Description, function(string) {
      splits <- str_split(string, "\\.\\*\\*\\*")[[1]]
      if (is.na(splits[2])) splits[1] else splits[2] 
    }) %>% unlist()
  ) %>%
  select(Trait, Description)

# See the final data
View(elf_traits)
View(elf_high)

# usage example (see what "Intro" says)
elf_high %>% filter(Trait == "Intro") %>% pull(Description)


