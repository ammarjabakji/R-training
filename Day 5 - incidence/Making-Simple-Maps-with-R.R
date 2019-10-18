#https://eriqande.github.io/rep-res-eeb-2017/map-making-in-R.html?source=post_page-----3f5734dcd4ff----------------------
# some standard map packages.
install.packages(c("maps", "mapdata"))

# the ggmap package.  Might as well get the bleeding edge version from GitHub
devtools::install_github("dkahle/ggmap")

library(tidyverse)
# library(mapdata)

# library(maps)
library(stringr)
library(viridis)
#https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
# ggplot2 provides the map_data() function.
# Think of it as a function that turns a series of 
# points along an outline into a data frame of those points
usa <- map_data("usa")

dim(usa)

head(usa)



usa <- map_data("usa") # we already did this, but we can do it again
ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group)) + 
  coord_quickmap()



ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group), fill = NA, color = "red") + 
  coord_quickmap()

gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group), fill = "red", color = "blue") + 
  coord_quickmap()
gg1



labs <- tibble(
  long = c(-122.064873, -122.306417),
  lat = c(36.951968, 47.644855),
  names = c("SWFSC-FED", "NWFSC"))  

gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), shape = 21, color = "black", fill = "yellow", size = 5) +
  geom_text(data = labs, aes(x = long, y = lat, label = names), hjust = 0, nudge_x = 1)


# without group
ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat), fill = "violet", color = "blue") + 
  geom_point(data = labs, aes(x = long, y = lat), shape = 21, color = "black", fill = "yellow", size = 5) +
  geom_text(data = labs, aes(x = long, y = lat, label = names), hjust = 0, nudge_x = 1) +
  coord_quickmap()


states <- map_data("state")
dim(states)



ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group),color = "black") + 
  coord_quickmap() +
  guides(fill = FALSE)  # do this to leave off the color legend


west_coast <- states %>%
  filter(region %in% c("california", "oregon", "washington"))

ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat), fill = "green", color = "black") 


ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat, group = group,fill = "green") ,color = "black") + 
  coord_quickmap()


ca_df <- states %>%
  filter(region == "california")

head(ca_df)


counties <- map_data("county")
ca_county <- counties %>%
  filter(region == "california")

head(ca_county)


ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat, group = group)) + 
  coord_quickmap() + 
  geom_polygon(color = "black", fill = "gray")
ca_base + theme_void()


ca_base + theme_void() + 
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA) 


# make a data frame
x <- readLines("inputs/ca-counties-wikipedia.txt")
pop_and_area <- str_match(x, "^([a-zA-Z ]+)County\t.*\t([0-9,]{2,10})\t([0-9,]{2,10}) sq mi$")[, -1] %>%
  na.omit() %>%
  as.data.frame(stringsAsFactors = FALSE) %>%
  mutate(subregion = str_trim(V1) %>% tolower(),
         population = as.numeric(str_replace_all(V2, ",", "")),
         area = as.numeric(str_replace_all(V3, ",", ""))
  ) %>%
  dplyr::select(subregion, population, area) %>%
  tbl_df()

head(pop_and_area)


cacopa <- left_join(ca_county, pop_and_area, by = "subregion") %>%
  mutate(people_per_mile = population / area)
head(cacopa)

elbow_room1 <- ca_base + 
  geom_polygon(data = cacopa, aes(fill = people_per_mile), color = "white") +
  geom_polygon(color = "black", fill = NA) +
  theme_void()
s
elbow_room1 

elbow_room1 + scale_fill_gradient(trans = "log10")