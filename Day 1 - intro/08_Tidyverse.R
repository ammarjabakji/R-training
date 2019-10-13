#https://r4ds.had.co.nz/
#https://www.tidyverse.org/
install.packages("tidyverse")
library("tidyverse")

baser <- read.csv("social_network.csv")
db <- read_csv("social_network.csv")

data <- c(1, 3, 5, 7, 11, 13, 17)

?diff
diff(data)
mean(diff(data^2))

rep("hi", length(data))


rep("hi", length(data))

data %>% 
  length() %>% 
  rep('hi')

  rep(data %>% 
        length(), "hi")
data %>% 
  length() %>% 
  rep('hi', .)


data.frame(data) %>% 
  top_n(2)

#  %>% is used extensively in the documentation of data science pachages in R 
data^2 %>% # CTRL + SHIFT + M (or CMD + SHIFT + M for OSX) 
  diff() %>%
    mean()

# Extracting  a vecotr from dataframe or tibble
midwest  %>% 
  select(state) %>% 
    unique() %>% 
      .[[1]]