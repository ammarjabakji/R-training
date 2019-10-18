
library(sf)
library(tidyverse)

aoi <- st_read("syr/syr_admin2.shx")

st_geometry_type(aoi)
st_bbox(aoi)

ggplot() + 
  geom_sf(data = aoi , size =1, color = "black", fill = "cyan1") + 
  ggtitle("Syria Map") + 
  coord_sf()


