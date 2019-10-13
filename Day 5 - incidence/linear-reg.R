# Scatterplot with regression line
library(tidyverse)

bdims <- read.csv("http://www.jkarreth.net/files/bdims.csv")
str(bdims)

ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Estimate optimal value of my_slope
ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() 

# Print bdims_summary

cor.test(bdims$hgt,bdims$wgt)

bdims_summary <- bdims %>% 
  summarize(
    N = n(), 
    r = cor(hgt, wgt), 
    mean_hgt = mean(hgt), 
    mean_wgt = mean(wgt), 
    sd_hgt = sd(hgt), 
    sd_wgt = sd(wgt)
  ) %>% print()

# Add slope and intercept
bdims_summary %>%
  mutate(
    slope = r * sd_wgt/sd_hgt, 
    intercept = mean_wgt - (slope * mean_hgt)
  )

