library(tidyverse)

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
  distinct(vote).[[1]


glimpse(votes)

# Filter for votes that are "yes", "abstain", or "no"
votes %>%
  filter(vote <= 3) %>% 
  distinct(vote)

# – Adding a year column
# first session was in 1946. That is session 1.
# There is one session per year.
# So, year = session + 1945

# Add another %>% step to add a year column
voteswithyears <- votes %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945)  
   

votes2005 = voteswithyears %>% 
  filter(year == 2005)

#load Countrycode pachage
library(countrycode)

# Convert country code 100
countrycode(20, "cown", "country.name")

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
# votes_processed[260,] 

#### Grouping and summarizing
votes_processed %>%
  filter(country == "Syria")



yes <- votes_processed %>%
  filter(vote == 1)%>%
  count()

all <- votes_processed %>%
  count()

yes/all



votes_processed %>%
  summarise(
    total = n(),
    percent_yes = sum(vote == 1)/n()
  )

votes_processed %>%
  summarise(
    percent_yes = m(vote == 1)
  )

votes_processed %>%
  group_by(year) %>%
  summarize(total = n(),
            percent_yes = sum(vote == 1)/total)

# You have the votes summarized by country
by_country <- votes_processed %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Print the by_country dataset
by_country


by_country %>%
  arrange(percent_yes)

by_country %>%
  arrange(desc(percent_yes))
# Now sort in descending order
by_country %>%
  arrange(desc(percent_yes))

# Filter out countries with fewer than 100 votes
by_country %>%
  arrange(percent_yes) %>%
  filter(total >= 100)

head(by_country)
tail(by_country)



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

SY_by_year <- by_year_country %>%
  filter(country == 'Syria')

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

ggplot(filtered_4_countries, aes(x = year, y = percent_yes, color = country)) +
geom_point() +
  geom_smooth()

ggplot()
