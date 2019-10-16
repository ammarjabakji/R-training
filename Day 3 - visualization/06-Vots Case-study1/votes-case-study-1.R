library(tidyverse)
library(tidyr)
library(purrr)
library(broom)
library(stringr)
#https://rpubs.com/williamsurles/299664

votes <- read_csv("votes.csv")

votes

# 1 = Yes
# 2 = Abstain
# 3 = No
# 8 = Not present
# 9 = Not a member

# Check all votes values
unique(votes$vote)

votes %>% 
  distinct(vote)


glimpse(votes)

#load Countrycode pachage
library(countrycode)

# Convert country code 100
countrycode(2, "cown", "country.name")

# Add a country column within the mutate: votes_processed
votes_processed <- votes %>%
  filter(vote <= 3) %>%
  mutate(
    year = session + 1945,
    country = countrycode(ccode, "cown", "country.name"),
    country = recode(country, 
                     'United States of America' =  'United States',
                     'United Kingdom of Great Britain and Northern Ireland' = 'United Kingdom')
  )


# Define by_year
by_year <- votes_processed %>%
  group_by(year) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))


# Create line plot
ggplot(by_year, aes(x = year, y = percent_yes)) +
  geom_line()

# Change to scatter plot and add smoothing curve
ggplot(by_year, aes(year, percent_yes)) +
  geom_point() +
  geom_smooth()



# Start with by_year_country dataset
by_year_country <- votes_processed %>%
  group_by(year, country) %>%
  summarize(total = n(),
  percent_yes = mean(vote == 1))

# Print by_year_country
by_year_country

# Create a filtered version: UK_by_year
UK_by_year <- by_year_country %>%
  filter(country == 'United Kingdom')


# Line plot of percent_yes over time for UK only
ggplot(UK_by_year, aes(x = year, y = percent_yes)) +
  geom_line()

# Vector of four countries to examine
countries <- c("United States", "United Kingdom",
               "France", "India")

# Filter by_year_country: filtered_4_countries
filtered_4_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes in four countries
ggplot(filtered_4_countries, aes(x = year, y = percent_yes, color = country)) +
  geom_line()

# Vector of six countries to examine
countries <- c("United States", "United Kingdom",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries
filtered_6_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(x = year, y = percent_yes)) +
  geom_line() + 
  facet_wrap(~ country)


# Vector of six countries to examine
countries <- c("United States", "United Kingdom",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries
filtered_6_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(year, percent_yes)) +
  geom_line() +
  facet_wrap(~ country)

#Tidy modeling with broom ========
#Linear regression on the United States

# Percentage of yes votes from the US by year: US_by_year
US_by_year <- by_year_country %>%
  filter(country == "United States")


# Print the US_by_year data
US_by_year


