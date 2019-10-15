# Data Visualization with ggplot
# histogram boxplot

# Load the dataset as described in Video 1.3

#more info https://rstudio-pubs-static.s3.amazonaws.com/178969_6de3a027e3f84177bcae1b3854da0654.html
# leanier model example https://www.youtube.com/watch?v=66z_MRwtFJM

library(tidyverse)


LungData <-  read.delim('LungCapData.txt')

# Here’s the meannig of the variables:
#   
# LungCap It’s the lung capacity of the person
# Age It’s how old is the person
# Hieght It’s how tall is the person
# Smoke If the person smokes or doesn’t smoke
# Gender If are male or female
# Caesarean If they’re born by caesarean


ggplot(LungData, aes(LungCap)) +
  geom_bar()

ggplot(LungData, aes(LungCap)) +
  geom_histogram()

ggplot(LungData) +
  geom_histogram(aes(LungCap), bins = 100)


ggplot(data=LungData) +
  geom_jitter(mapping=aes(x=Gender, y=LungCap))

ggplot(data=LungData) +
  geom_point(mapping=aes(x=Gender, y=LungCap))

ggplot(data=LungData) +
  geom_boxplot(mapping=aes(x=Gender, y=LungCap))
