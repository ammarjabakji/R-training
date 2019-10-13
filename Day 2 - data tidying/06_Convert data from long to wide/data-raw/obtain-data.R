## Data harvested from http://www.metoffice.gov.uk/public/weather/climate-historic/#?tab=climateHistoric

library("tidyverse")


oxford_weather <-
  read_table(file = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/oxforddata.txt",
             skip = 5,
             col_names = TRUE) %>%
  slice(-1) %>%
  mutate(
    sun = gsub("\\**", "", sun),
    sun = gsub("Provisional", "", sun),
    sun = gsub("---", NA, sun),
    sun = as.numeric(sun)
  ) %>%
  mutate_if(is.character, as.numeric) %>%
  mutate(airport = "oxford")


bradford_weather <-
  read_table(file = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt",
             skip = 5,
             col_names = TRUE) %>%
  slice(-1) %>%
  mutate(
    sun = gsub("\\**", "", sun),
    sun = gsub("Provisional", "", sun),
    sun = gsub("---", NA, sun),
    sun = as.numeric(sun)
  ) %>%
  mutate_if(is.character, as.numeric) %>%
  mutate(airport = "bradford")

heathrow_weather <-
  read_table(file = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/heathrowdata.txt",
             skip = 5,
             col_names = TRUE) %>%
  slice(-1) %>%
  mutate(
    sun = gsub("\\**", "", sun),
    sun = gsub("Provisional", "", sun),
    sun = gsub("---", NA, sun),
    sun = as.numeric(sun)
  ) %>%
  mutate_if(is.character, as.numeric) %>%
  mutate(airport = "heathrow")


stornoway_weather <-
  read_table(file = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/stornowaydata.txt",
             skip = 5,
             col_names = TRUE) %>%
  slice(-1) %>%
  mutate(
    sun = gsub("\\**", "", sun),
    sun = gsub("Provisional", "", sun),
    sun = gsub("---", NA, sun),
    sun = as.numeric(sun)
  ) %>%
  mutate_if(is.character, as.numeric) %>%
  mutate(airport = "stornoway")

british_weather <- oxford_weather %>%
  full_join(bradford_weather) %>%
  full_join(heathrow_weather) %>%
  full_join(stornoway_weather)

monthly_tdiff <- british_weather %>%
  mutate(tdiff = tmax - tmin) %>%
  group_by(airport, mm) %>%
  summarise(avg.tdiff = mean(tdiff, na.rm = TRUE)) %>%
  rename(month = mm)


write_csv(monthly_tdiff, path = "data-raw/long_monthly_tdiff.csv")
  




