library("tidyverse")

long_monthly_tdiff <- read_csv("data/long_monthly_tdiff.csv")
long_horses_data <- read_csv("data/long_horses_data.csv")

long_monthly_tdiff %>% 
  spread(airport, avg.tdiff)

long_horses_data %>% 
  spread(year, horses)