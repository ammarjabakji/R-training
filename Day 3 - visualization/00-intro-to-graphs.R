browseVignettes(package = "ggplot2")


library(tidyverse)

Refuges <- c(Turkey=3.5,Jordan=1,Lebaon=1.5,Iraq=0.25)
Refuges
View(Refuges)
barplot(Refuges)
pie(Refuges)



# will not work
ggplot(data = Refuges,mapping = aes(Refuges)) +
  geom_bar()

# will not work
ggplot(data=Refuges) +
  geom_bar(mapping=aes(x=Refuges))



#### Simple ggplot example
df <- enframe(Refuges,'country','refuges')


# Basic barplot
ggplot()


ggplot(data=df, aes(x=country, y=refuges)) +
  geom_col()


ggplot(data=df, aes(x=country, y=refuges)) +
  geom_col() +
  coord_polar("y")

# Horizontal bar plot
ggplot(data=df, aes(x=countres, y=refuges)) +
  # geom_bar(stat="identity")
  geom_col() 
