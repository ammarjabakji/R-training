#http://rstudio.github.io/leaflet
# http://jkunst.com/highcharter/

library(tidyverse)

library(magrittr)
library(highcharter)

highchart() %>% 
  hc_title(text = "Scatter chart with size and color") %>% 
  hc_add_series_scatter(mtcars$wt, mtcars$mpg,
                        mtcars$drat, mtcars$hp)



highchart() %>% 
  hc_title(text = "Bar plot") %>% 
  hc_add_series_boxplot(mtcars$wt, mtcars$mpg,
                        mtcars$drat, mtcars$hp)


highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "A highcharter chart") %>% 
  hc_xAxis(categories = 2012:2016) %>% 
  hc_add_series(data = c(3900,  4200,  5700,  8500, 11900),
                name = "Downloads")


#### example map =======
cities <- data_frame(
  name = c("Aleppo", "Homs"),
  lat = c(36.2021, 34.7324),
  lon = c(37.1343, 36.7137),
  z = c(2, 2)
)

glimpse(cities)

hcmap("countries/sy/sy-all", showInLegend = FALSE) %>% 
  hc_add_series(data = cities, type = "mapbubble", name = "Cities", maxSize = '10%') %>% 
  hc_mapNavigation(enabled = TRUE) 



 