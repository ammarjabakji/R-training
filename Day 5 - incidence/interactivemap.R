#http://rstudio.github.io/leaflet
# http://jkunst.com/highcharter/
#http://jkunst.com/highcharter/highmaps.html

library(tidyverse)

library(magrittr)
library(highcharter)

#### example map =======
cities <- data_frame(
  name = c("Aleppo", "Homs"),
  lat = c(36.2021, 34.7324),
  lon = c(37.1343, 36.7137),
  z = c(2, 2)
)

glimpse(cities)
# https://code.highcharts.com/mapdata/
hcmap("countries/sy/sy-all", showInLegend = FALSE) %>% 
  hc_add_series(data = cities, type = "mapbubble", name = "Cities", maxSize = '20%') %>% 
  hc_mapNavigation(enabled = TRUE) 


sydata <- get_data_from_map(download_map_data("countries/sy/sy-all"))
glimpse(sydata)
####

mapdata <- get_data_from_map(download_map_data("countries/us/us-all"))
glimpse(mapdata)
## Observations: 52
## Variables: 19
## $ hc-group    <chr> "admin1", "admin1", "admin1", "admin1", "admin1", ...
## $ hc-middle-x <dbl> 0.36, 0.56, 0.51, 0.47, 0.41, 0.43, 0.71, 0.46, 0....
## $ hc-middle-y <dbl> 0.47, 0.52, 0.67, 0.52, 0.38, 0.40, 0.67, 0.38, 0....
## $ hc-key      <chr> "us-ma", "us-wa", "us-ca", "us-or", "us-wi", "us-m...
## $ hc-a2       <chr> "MA", "WA", "CA", "OR", "WI", "ME", "MI", "NV", "N...
## $ labelrank   <chr> "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", ...
## $ hasc        <chr> "US.MA", "US.WA", "US.CA", "US.OR", "US.WI", "US.M...
## $ woe-id      <chr> "2347580", "2347606", "2347563", "2347596", "23476...
## $ state-fips  <chr> "25", "53", "6", "41", "55", "23", "26", "32", "35...
## $ fips        <chr> "US25", "US53", "US06", "US41", "US55", "US23", "U...
## $ postal-code <chr> "MA", "WA", "CA", "OR", "WI", "ME", "MI", "NV", "N...
## $ name        <chr> "Massachusetts", "Washington", "California", "Oreg...
## $ country     <chr> "United States of America", "United States of Amer...
## $ region      <chr> "Northeast", "West", "West", "West", "Midwest", "N...
## $ longitude   <chr> "-71.99930000000001", "-120.361", "-119.591", "-12...
## $ woe-name    <chr> "Massachusetts", "Washington", "California", "Oreg...
## $ latitude    <chr> "42.3739", "47.4865", "36.7496", "43.8333", "44.37...
## $ woe-label   <chr> "Massachusetts, US, United States", "Washington, U...
## $ type        <chr> "State", "State", "State", "State", "State", "Stat...

set.seed(1234)

data_fake <- mapdata %>% 
  select(code = `hc-a2`) %>% 
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

glimpse(data_fake)
## Observations: 52
## Variables: 2
## $ code  <chr> "MA", "WA", "CA", "OR", "WI", "ME", "MI", "NV", "NM", "C...
## $ value <dbl> 119426.518, 255662.317, 3668.575, 122246.930, 79283.064,...


hcmap("countries/us/us-all", data = data_fake, value = "value",
      joinBy = c("hc-a2", "code"), name = "Fake data",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 2, valuePrefix = "$", valueSuffix = " USD")) 



