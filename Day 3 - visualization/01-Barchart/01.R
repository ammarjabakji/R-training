
library(tidyverse)
# Creating bar charts for categorical variables

# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read_csv("social_network.csv")

# R doesn't create bar charts directly from the categorical
# variables; instead, we must first create a table that
# has the frequencies for each level of the variable.
# The "table" function is able to create this table from
# the variable, which we specify as sn$Site. That is, we
# first give the name of the data frame, then $, then the 
# name of the variable. (Following Google's style guide,
# it is better to state explictly the data frame than to
# use the shortcut function "attach," which can lead to
# confusion.)

site.freq <- table(sn$Site)  # Creates table from Site
site.freq
barplot(site.freq)  # Creates barplot in new window
? barplot  # For more information on customizing graph



ggplot(data = sn, mapping = aes(x=Site)) + geom_bar()

ggplot(sn, aes(Site)) + geom_bar()

ggplot(sn) + 
        geom_bar(aes(Site)) 

sn %>% 
        ggplot() + geom_bar(aes(Site)) 

# reorder


ggplot(sn) + 
        geom_bar(aes(Site %>% fct_infreq ))

# reverse

ggplot(sn) + 
        geom_bar(aes(fct_infreq(Site) %>% fct_rev ))


ggplot(sn) + 
        geom_bar(aes(fct_infreq(Site))) + 
                coord_flip() 

ggplot(sn) + 
        geom_bar( aes( fct_infreq(Site) ) , fill='steelblue' ) + 
        coord_flip() 
        
ggplot(sn) + 
geom_bar( aes( fct_infreq(Site) ) , fill='steelblue' ) + 
        coord_flip() +
         ggtitle("Social Media \n Follwers") +
         xlab("Social Media)") + ylab("Number of users")

ggplot(sn) + 
        geom_bar( aes( fct_infreq(Site) ) , fill='steelblue' ) + 
        ylim(0, 100)+
        coord_flip() +
        ggtitle("Social Media \n Follwers") +
        xlab("Social Media") + ylab("Number of users")+
        theme(plot.title = element_text(hjust = 0.5))



###


df <- data.frame(Name = c("B", "C", "D", "A"), Number = c(4, 7, 2, 9))
df
#>   Name Number
#> 1    B      4
#> 2    C      7
#> 3    D      2
#> 4    A      9

ggplot(data = df, mapping = aes(x = Name, y = Number)) + 
        geom_col() 



ggplot(df, aes(reorder(Name, Number), Number)) + 
        geom_col() 



ggplot(data = df, mapping = aes(x = reorder(Name, -Number), y = Number)) + 
        geom_col() 