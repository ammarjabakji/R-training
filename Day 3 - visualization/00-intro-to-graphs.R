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
df <- data.frame(countres=c("Turkey", "Jordan", "Lebaon","Iraq"),
                 refuges=c(3.0, 1, 1.5, 0.25))
df


Refuges <- Refuges %>% as.list %>% as_tibble

Refuges <- gather(Refuges,countries,ref)

# Basic barplot
ggplot()


ggplot(data=df, aes(x=countres, y=refuges)) +
  geom_col()



# Horizontal bar plot
ggplot(data=df, aes(x=countres, y=refuges)) +
  # geom_bar(stat="identity")
  geom_col() +
  coord_flip()




