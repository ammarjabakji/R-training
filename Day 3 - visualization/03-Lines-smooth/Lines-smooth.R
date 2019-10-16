# Data Visualization with ggplot
# Scatterplots
# Video 2.1

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



ggplot(data=LungData) +
  geom_point(mapping=aes(x=LungCap, y=Height, color=Gender  ))

#Working with legends

ggplot(data=LungData) +
  geom_point(mapping=aes(x=LungCap, y=Height, color=Gender  ))+
  scale_color_manual(values=c("blue","orange"),
                     guide=guide_legend(title="Gender of Students",
                     nrow=1,
                     label.position="bottom",
                     keywidth = 6))+
  theme(legend.position = "top")



ggplot(data=LungData) +
  geom_line(mapping=aes(x=LungCap, y=Height, color=Gender  ))

ggplot(data=LungData) +
  geom_point(mapping=aes(x=LungCap, y=Height, color=Gender  ))+
  geom_line(mapping=aes(x=LungCap, y=Height, color=Gender ))


ggplot(data=LungData, aes(x=LungCap, y=Height, color=Gender)) +
  geom_point() +
  geom_line()


ggplot(data=LungData, aes(x=LungCap, y=Height, color=Gender)) +
  geom_point(alpha=0.2) +
  geom_smooth()


ggplot(data=LungData, aes(x=LungCap, y=Age, color=Gender)) +
  geom_point(alpha=0.2) +
  geom_smooth()


ggplot(data=LungData, aes(x=LungCap, y=Age, color=Gender)) +
  geom_point(alpha=0.2) +
  geom_smooth(se=FALSE) +
  theme_bw()