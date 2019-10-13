library(tidyverse)
library(gapminder)

# * Connect operations with `%>%` 
# * Extract cases with `filter()`  
# * Make new variables, with `mutate()`  
# * Make tables of summaries with `summarise()`  
# * Do groupwise operations with `group_by()`
 

# https://cran.r-project.org/web/packages/gapminder/README.html
#https://github.com/cwickham/data-science-in-tidyverse/blob/master/02-Transform.Rmd

?gapminder
data(gapminder)


summary(gapminder)


countries <- c("Syria", "Saudi Arabia", "Egypt","Turkey")

by_countires <- gapminder %>% 
  filter(country %in% countries)

# Line plot of % yes in four countries
ggplot(by_countires, aes(x = year, y = lifeExp, color = country)) +
  geom_smooth()
  
  
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot(outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)


# titanic is avaliable in your workspace
titanic <-  read_csv("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv")
# 1 - Check the structure of titanic

str(titanic)

# 2 - Use ggplot() for the first instruction
ggplot(titanic, 
       aes(x = Pclass, fill = Sex)) + 
  geom_bar(
    position = "dodge")

# 3 - Plot 2, add facet_grid() layer
ggplot(titanic, 
       aes(x = Pclass, fill = Sex)) + 
  geom_bar(
    position = "dodge") +
  facet_grid(. ~ Survived)

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Plot 3, but use the position object from instruction 4
ggplot(titanic, 
       aes(x = Pclass, y = Age, col = Sex)) + 
  geom_point(
    size = 3, alpha = 0.5, position = posn.jd) +
  facet_grid(. ~ Survived)