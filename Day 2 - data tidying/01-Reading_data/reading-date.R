library("tidyverse")

baseR_dataframe <- read.csv("timeperiods.csv")
tidyverse_tibble <- read_csv("timeperiods.csv")

data_baseR <- read.csv("transit-data.csv", skip = 1)
data_readr <- read_csv("transit-data.csv", skip = 1)
data_readr
data_baseR

glimpse(data_readr)
str(data_readr)

typeof(data_readr$`Sender latitude`)

data_baseR$Sender.latitude
data_readr$`Sender latitude`

colnames(data_baseR)
colnames(data_readr)
names(data_readr)

class(data_baseR)
class(data_readr)

# change names to lowercase 
colnames(data_readr) <- 
colnames(data_readr)  %>% 
  tolower

names(data_readr) <- 
  names(data_readr)  %>% 
  tolower()


names(data_readr)

write_csv(data_readr, "transport-data.csv")


