library("tidyverse")

wide_monthly_tdiff <- read_csv("data-raw/wide_monthly_tdiff.csv")
wide_horses_data <- read_csv("data-raw/wide-horses.csv")

wide_monthly_tdiff %>% 
  gather(location, tdiff,
         bradford.tdiff,
         heathrow.tdiff,
          oxford.tdiff, 
         stornoway.tdiff)

wide_monthly_tdiff %>% 
  gather(location, tdiff,
         bradford.tdiff:stornoway.tdiff)

wide_monthly_tdiff %>% 
  gather(location, tdiff,
         contains("tdiff"))

names(wide_horses_data )

wide_horses_data %>% 
  gather(year,horses,
         `Horses (per 100 people) in 1819`,
         `Horses (per 100 people) in 1820`)  %>% 
  View()


wide_horses_data %>% 
  gather(year,horses,
         contains("Horses"))  %>% 
  View()