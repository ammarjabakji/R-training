browseVignettes(package = "dplyr") 

library(tidyverse)

LungData <- read_tsv('LungCapData.txt')


# Here’s the meannig of the variables:
#   
# LungCap It’s the lung capacity of the person
# Age It’s how old is the person
# Hieght It’s how tall is the person
# Smoke If the person smokes or doesn’t smoke
# Gender If are male or female
# Caesarean If they’re born by caesarean


glimpse(LungData)
str(LungData)
names(LungData)
summary(LungData)


# Dplyr aims to provide a function for each basic verb of data manipulation:
#   
# filter() to select cases based on their values.
# arrange() to reorder the cases.
# select() and rename() to select variables based on their names.
# mutate() and transmute() to add new variables that are functions of existing variables.
# summarise() to condense multiple values to a single value.
# sample_n() and sample_frac() to take random samples.

## Select =================================
?select

LungData %>% 
  select(LungCap,Age,Height)

LungData %>% 
  select(1:3)

LungData[1:3]

LungData %>% 
  select(1:3) %>% 
  top_n(10,Age)

LungData %>% 
  select(Age:Gender)

LungData %>% 
  select(-Age)

# Select with renaming
LungData %>% 
  select( "Age of Patients" = Age)

# There are a number of helper functions you can use within select(),
# like starts_with(), ends_with(), matches() and contains().
# These let you quickly match larger blocks of variables that meet some criterion.

LungData %>% 
  select(contains('Ag'), ends_with('Cap')) 



## filter =================================

LungData %>% 
  filter( Gender == 'female')

LungData %>% 
  filter(Age < 4 & Gender == 'male')

LungData %>% 
  filter(between(Age,5,10))

## arrange =================================

LungData %>% 
  filter(Age < 4 & Gender == 'male') %>% 
  arrange(Height)

LungData %>% 
  filter(Age < 4 & Gender == 'male') %>% 
  arrange(desc(Height))


LungData %>% 
  select(Age,Gender,Height) %>% 
  filter(Age < 4 & Gender == 'male') %>% 
  arrange(desc(Height))


## mutate =================================


LungData <- LungData %>% 
 mutate("height in ft"= round(Height/30.48,2)) %>% 
  View()

LungData <- LungData %>% 
  mutate(members = 1:n())  %>%
  View()

## summarise =================================

LungData %>% 
  filter(Smoke == "yes")

LungData %>% 
  summarise()

LungData %>% 
  summarise(Avreage = mean(Age))



## group_by =================================



LungData %>% 
  group_by(Gender) %>% 
  summarise(total =n())

LungData %>% 
  group_by(Gender) %>% 
  summarise(Sum =sum(Age))

LungData %>% 
  group_by(Gender) %>% 
  count()

LungData %>% 
  group_by(Gender,Smoke) %>% 
  count()

LungData %>% 
  group_by(Gender) %>% 
  summarise(Avreage = mean(Age))

LungData %>% 
  group_by(Gender) %>% 
  summarise(Avreage = mean(Age))

LungData %>% 
  group_by(Gender) %>% 
  filter(Smoke == "yes") %>% 
  summarise(total = n())

LungData %>% 
  group_by(Smoke) %>% 
  summarise(total = n())

LungData %>% 
  group_by(Caesarean,Smoke) %>% 
  summarise(total = n(),"Avreage Age" = mean(Age))


  
# is there relation between Smokers and Caesarean

LungData %>% 
  group_by(Caesarean,Smoke) %>% 
  count()


table(Smoker = LungData$Smoke,Caesarean =LungData$Caesarean)

class(table(Smoker = LungData$Smoke,Caesarean =LungData$Caesarean))

LungData %>% 
  group_by(Caesarean,Smoke) %>% 
  summarise(total = n(),"Avreage Age" = mean(Age))

  chisq.test(table(Smoker = LungData$Smoke,infected =LungData$Caesarean))
  
  
  # chisq Case study
  # https://rpubs.com/anasteisha/da_2

# You can use sample_n() and sample_frac() to take a random sample of rows:
#   use sample_n() for a fixed number and sample_frac() for a fixed fraction.
  
  sample_n(LungData, 10)  

  sample_frac(LungData, 0.01)