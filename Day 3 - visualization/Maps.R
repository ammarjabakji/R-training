

library(tidyverse)

library(leaflet)


m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map


orstationc <- read_csv("http://geog.uoregon.edu/bartlein/old_courses/geog414s05/data/orstationc.csv")



leaflet(orstationc) %>% 
  addTiles() %>%
  addCircleMarkers() #Add graphics elements and layers to the map widget.


leaflet(orstationc) %>% 
  addTiles() %>%
  addCircleMarkers(~tann)

leaflet(orstationc) %>% 
  addTiles() %>%
  addCircleMarkers(~tjul)


pal <- colorQuantile("YlOrRd", NULL, n = 8)
leaflet(orstationc) %>% 
  addTiles() %>%
  addCircleMarkers(color = ~pal(tann))


pal <- colorQuantile("YlOrRd", NULL, n = 8)
leaflet(orstationc) %>% 
  addTiles() %>%
  addCircleMarkers(color = ~pal(tjul))