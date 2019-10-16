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
  name = c("London", "Birmingham", "Glasgow", "Liverpool"),
  lat = c(51.507222, 52.483056,  55.858, 53.4),
  lon = c(-0.1275, -1.893611, -4.259, -3),
  z = c(1, 2, 3, 2)
)

glimpse(cities)
## Observations: 4
## Variables: 4
## $ name <chr> "London", "Birmingham", "Glasgow", "Liverpool"
## $ lat  <dbl> 51.50722, 52.48306, 55.85800, 53.40000
## $ lon  <dbl> -0.127500, -1.893611, -4.259000, -3.000000
## $ z    <dbl> 1, 2, 3, 2

hcmap("countries/gb/gb-all", showInLegend = FALSE) %>% 
  hc_add_series(data = cities, type = "mapbubble", name = "Cities", maxSize = '10%') %>% 
  hc_mapNavigation(enabled = TRUE) 



 