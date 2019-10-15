# Data Visualization with ggplot
# Scatterplots


#more info https://rstudio-pubs-static.s3.amazonaws.com/178969_6de3a027e3f84177bcae1b3854da0654.html
# leanier model example https://www.youtube.com/watch?v=66z_MRwtFJM

library(tidyverse)

browseVignettes(package = "ggplot2") 


LungData <- read_tsv('LungCapData.txt')

# Here’s the meannig of the variables:
#   
# LungCap It’s the lung capacity of the person
# Age It’s how old is the person
# Hieght It’s how tall is the person
# Smoke If the person smokes or doesn’t smoke
# Gender If are male or female
# Caesarean If they’re born by caesarean

names(LungData)
summary(LungData)

# Error x' must be numeric
cor(LungData)

cor(LungData[, c(1,2,3)])
cor(LungData[, 1:3])
plot(LungData[, 1:3])
LungData

cor.test( LungData$Height, LungData$LungCap,  method = "pearson")

#linear models
?lm
# y= intercept + slob X  (y=b0 + b1x)
# model <-  # lm (y= target or depended ~ x =independed, data)

# https://www.youtube.com/watch?v=66z_MRwtFJM
cor.test( LungData$Age, LungData$LungCap )
model <-lm( LungData$LungCap ~ LungData$Age)
summary(model)
plot(LungData$Age,LungData$LungCap)
abline(model)

ggplot(data=LungData,aes(x=Age, y=LungCap)) +
geom_point() +
geom_smooth(method = "lm")


cor.test( LungData$Height, LungData$LungCap )

ggplot(data=LungData) +
  geom_point(mapping=aes(x=Height, y=LungCap, shape=Gender))


ggplot(data=LungData) +
  geom_point(mapping=aes(x=Height, y=LungCap, color=Gender))


ggplot(data=LungData) +
  geom_point(mapping=aes(x=Height, y=LungCap, color=Gender , size =Age))



ggplot(data=LungData) +
  geom_point(mapping=aes(x=Height, y=LungCap, color=Gender , size =Age , alpha=0.5))

ggplot(data=LungData) +
  geom_point(mapping=aes(x=Height, y=LungCap, color=Gender , size =Age , alpha=0.5 , shape= Gender))


ggplot(data=LungData) +
  geom_point(mapping=aes(x=Height, y=LungCap, color=Gender , size =Age , alpha=0.5 , shape= Gender))


