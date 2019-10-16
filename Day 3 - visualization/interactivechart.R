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



## example map 2
install.packages("geojsonio")
library(geojsonio)

ausgeojson <- getContent("https://raw.githubusercontent.com/johan/world.geo.json/master/countries/AUS.geo.json")
ausgeojson <- jsonlite::fromJSON(ausgeojson, simplifyVector = FALSE)
ausgeojson <- geojsonio::as.json(ausgeojson)
class(ausgeojson)
## [1] "json"     "geo_json"

# http://openflights.org/data.html
airports <- read.csv("https://commondatastorage.googleapis.com/ckannet-storage/2012-07-09T214020/global_airports.csv")
airports <- filter(airports, country == "Australia", name != "Roma Street Railway Station")

airp_geojson <- geojson_json(airports, lat = "latitude", lon = "longitude")
class(airp_geojson)
## [1] "json"     "geo_json"

highchart(type = "map") %>%
  hc_add_series(mapData = ausgeojson, showInLegend = FALSE) %>%
  hc_add_series(data = airp_geojson, type = "mappoint",
                dataLabels = list(enabled = FALSE),
                name = "Airports", tooltip = list(pointFormat = "{point.name}")) 