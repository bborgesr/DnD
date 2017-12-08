
library(tibble)

sheetModUI <- function(id) {
  ns <- NS(id)
  tagList(
    tableOutput(ns("table"))
  )
}

sheetMod <- function(input, output, session) {
  output$table <- renderTable({
    tibble(col1 = names, col2 = attributes)
  }) 
}

names <- c("Class", "Level", "Background", "Name", "Faction", "Race", "Alignment", "Experience", "DCI NUmber",
  "Armor Class", "Initiative", "Speed", "Hit Points", "Current Hit Points", "Temporary Hit Points", "Hit Dice",
  "Death Saves", "Inspiration", "Proficiency", "Strength Score", "Strength Mod", "Strength Save Mod", "Dexterity Score",
  "Dexterity Mod", "Dexterity Save Mod", "Constitution Score", "Constitution Mod", "Constitution Save Mod", 
  "Intelligence Score", "Intelligence Mod", "Inteligence Save Mod", "Wisdom Score", "Wisdom Mod", "Wisdom Save Mod",
  "Charisma Score", "Charisma Mod", "Charisma Save Mod", "Acrobatics", "Animal Handling", "Arcana", "Athletics",
  "Deception", "History", "Insight", "Intimidation", "Investigation", "Medicine", "Nature", "Perception", "Performance",
  "Persuasion", "Religion", "Sleight of Hand", "Stealth", "Survival", "Passive Perception", "Other Proficiencies",
  "Languages", "Weapons", "Spells", "Money", "Equipment", "Personality Traits", "Ideals", "Bonds", "Flaws", "Features",
  "Traits", "Age", "Height", "Weight", "Eyes", "Skin", "Hair", "Character Appearance", "Allies", "Allied Factions",
  "Backstory")

attributes <- c("Barbarian", "5", "Hermit", "Oswald", "", "Human", "TN", "6000", "", "16", "3", "30", "45", "45", "0",
  "d12", "", "No", "+3", "16", "+1", "+3", "14", "+2", "+4", "16", "+2", "+2", "10", "-1", "-1", "10", "0", "0",
  "11", "0", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "13",
  "", "Common", "Sword", "Vicious Mockery", "3.5 GP", "", "", "", "", "", "", "", "", "18", "", "", "", "", "", "", "", "")