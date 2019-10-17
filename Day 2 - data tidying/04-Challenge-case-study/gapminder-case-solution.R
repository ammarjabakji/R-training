library(tidyverse)
library(gapminder)

# * Connect operations with `%>%` 
# * Extract cases with `filter()`  
# * Make new variables, with `mutate()`  
# * Make tables of summaries with `summarise()`  
# * Do groupwise operations with `group_by()`
 
# Toy dataset to use
pollution <- tribble(
  ~city,   ~size, ~amount, 
  "New York", "large",      23,
  "New York", "small",      14,
  "London", "large",      22,
  "London", "small",      16,
  "Beijing", "large",      121,
  "Beijing", "small",      56
)
# https://cran.r-project.org/web/packages/gapminder/README.html
#https://github.com/cwickham/data-science-in-tidyverse/blob/master/02-Transform.Rmd

?gapminder
data(gapminder)


summary(gapminder)

gapminder %>%  
top_n(2,pop)


gapminder %>%  
  top_n(2,gdpPercap)


gapminder %>%  
  top_n(2,lifeExp)

gapminder %>%  
 filter(country == "New Zealand")


gapminder %>%  
  filter(lifeExp > 80)


gapminder %>%  
  filter(country == "New Zealand" & year > 2000)  %>%  
  View()



gapminder %>% 
  filter(country == "New Zealand" & lifeExp > 80) 


gapminder %>% 
  select(country,lifeExp)

gapminder %>% 
  filter(country == "New Zealand") %>%
  summarize(Averagelife = mean(lifeExp))

gapminder %>%
  group_by(country)  %>%
  View()
#Group countries by avrage lifeExp.
gapminder %>% 
  group_by(country) %>%
  summarize(Averagelife = mean(lifeExp))

#Find the records with the smallest population.
filter(gapminder,pop == min(pop))
gapminder %>% filter(pop==min(pop))
gapminder %>% 
  summarize(Min = min(pop))
#Find the records with the largest GDP per capita.
filter(gapminder, gdpPercap == max(gdpPercap))


#base R
aggregate(lifeExp ~ continent, gapminder, median)

gapminder %>%
  group_by(continent) %>%
  summarise(mlifeExp=median(lifeExp))



gapminder %>%
  group_by(country)

library("dplyr")
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(Avg = mean(lifeExp))



countries <- c("Syria", "Saudi Arabia", "Egypt","Turkey")

by_countires <- gapminder %>% 
  filter(country %in% countries)

# Line plot of % yes in four countries
ggplot(by_countires, aes(x = year, y = lifeExp, color = country)) +
  geom_smooth()
  
  
gapminder %>% 
  mutate(size = ifelse(pop < 10e06, "small", "large"))

# Not Correct
gapminder %>% 
  mutate(diff_pop = diff(pop))

db <- gapminder %>% 
  mutate(total_pop = sum(as.numeric(pop)))

# Use summarise() to compute three statistics about the data:
#   
#   * The first (minimum) year in the dataset
# * The last (maximum) year in the dataset
# * The number of countries represented in the data (Hint: use cheatsheet)
gapminder %>% 
  summarise(year = min(year))

gapminder %>% 
  summarise(year = max(year))

gapminder %>% 
  summarise(total = n())


library("ggplot2")
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot(outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)