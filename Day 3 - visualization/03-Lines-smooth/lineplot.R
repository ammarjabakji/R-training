# Data Visualization with ggplot
# Scatterplots
# Video 2.1

# Load the dataset as described in Video 1.3


library(tidyverse)

# ChickWeight is available in your workspace
# 1 - Check out the head of ChickWeight
?ChickWeight
head(ChickWeight)

data(ChickWeight)
# 2 - Basic line plot

ggplot(ChickWeight, aes(x = Time, y = weight)) + 
  geom_line(aes(group = Chick))



# 3 - Take plot 2, map Diet onto col.
ggplot(ChickWeight, 
       aes(x = Time, y = weight, col = Diet)) + 
  geom_line(
    aes(group = Chick))

# 4 - Take plot 3, add geom_smooth()
ggplot(ChickWeight, 
       aes(x = Time, y = weight, col = Diet)) + 
    geom_line(
      aes(group = Chick)) + 
      geom_smooth(lwd = 2)


# Check the structure as a starting point
fish.species <-  read_csv("fish.csv")
str(fish.species)
## 'data.frame':    61 obs. of  8 variables:
##  $ Year    : int  1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 ...
##  $ Pink    : int  100600 259000 132600 235900 123400 244400 203400 270119 200798 200085 ...
##  $ Chum    : int  139300 155900 113800 99800 148700 143700 158480 125377 132407 113114 ...
##  $ Sockeye : int  64100 51200 58200 66100 83800 72000 84800 69676 100520 62472 ...
##  $ Coho    : int  30500 40900 33600 32400 38300 45100 40000 39900 39200 32865 ...
##  $ Rainbow : int  0 100 100 100 100 100 100 100 100 100 ...
##  $ Chinook : int  23200 25500 24900 25300 24500 27700 25300 21200 20900 20335 ...
##  $ Atlantic: int  10800 9701 9800 8800 9600 7800 8100 9000 8801 8700 ...
# Use gather to go from fish.species to fish.tidy

fish.tidy <- gather(fish.species, Species, Capture, -Year)

str(fish.tidy)
## 'data.frame':    427 obs. of  3 variables:
##  $ Year   : int  1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 ...
##  $ Species: chr  "Pink" "Pink" "Pink" "Pink" ...
##  $ Capture: int  100600 259000 132600 235900 123400 244400 203400 270119 200798 200085 ...
##– Multiple time series, part 2
# Recreate the plot shown on the right
ggplot(fish.tidy, aes(x = Year, y = Capture, col = Species)) +
  geom_line()


