# File:     05_01_Frequencies.R
# Project:  LearningR

# INSTALL AND LOAD PACKAGES ################################

library(tidyverse)
library(readxl)
# LOAD AND PREPARE DATA ####################################
db <- read_excel("StateData.xlsx") 
glimpse(db)
is.factor(db$psychRegions)
# Save categorical variables
db <- read_excel("StateData.xlsx") %>%
  select(state_code, region, psychRegions) %>%
  mutate(psychRegions = as.factor(psychRegions)) %>%
  print()

# SUMMARIZE DATAFRAME ######################################

summary(db)  # Gives frequencies for factors only

# SUMMARIZE CATEGORICAL VARIABLE ###########################

# "region" is a character variable

# summary() not very useful
db %>% 
  select(region) %>%
  summary()

# table() works better
db %>% 
  select(region) %>%
  table()

# SUMMARIZE FACTOR #########################################

# "psychRegions" is a factor

# Using summary() works best
db %>%
  select(psychRegions) %>%
  summary()

# Using table()
db %>%
  select(psychRegions) %>%
  table()

# Summarize multiple factors
db <- db %>%
  mutate(region = as.factor(region)) %>%
  mutate(psychRegions = as.factor(psychRegions)) %>%
  print()

summary(db)

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
