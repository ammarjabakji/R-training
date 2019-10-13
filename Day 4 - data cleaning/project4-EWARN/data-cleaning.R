library(tidyverse)
library("readxl")


EWARN <- read_xlsx("EWARN.xlsx")

head(EWARN)
summary(EWARN)
names(EWARN)

EWARN <- EWARN %>% 
  select(Year, Month, Governorate, District, Subdistrict, Community,"Sum of 0 - 4 years ذكر-ABD","Sum of 0 - 4 years أنثى-ABD", "Sum of ≥ 5 years ذكر-ABD", "Sum of ≥ 5 years أنثى-ABD") %>% 
  filter(Year == "2019")

ewarn.tidy <- gather(EWARN, ABD, SUM,"Sum of 0 - 4 years ذكر-ABD","Sum of 0 - 4 years أنثى-ABD", "Sum of ≥ 5 years ذكر-ABD", "Sum of ≥ 5 years أنثى-ABD", -Year, -Month, -Governorate, -District, -Subdistrict, -Community)
ewarn.tidy <- distinct(ewarn.tidy, .keep_all= TRUE)

summary(ewarn.tidy)


ewarn.missing <- ewarn.tidy  %>% 
  filter( is.na(SUM))


ewarn.complete <- ewarn.tidy  %>% 
  filter( complete.cases(SUM))

ewarn.complete2 <- ewarn.tidy  %>% 
  filter( !is.na(SUM))

# ewarn.tidy <- ewarn.tidy  %>% 
#   mutate(obs=replace_na(SUM, 0))

str(ewarn.tidy)
summary(ewarn.tidy)

ewarn.tidy  %>% 
  filter(Month == "Mar")  %>% 
    group_by(Governorate) %>%
      summarize(Sum = sum(SUM)) 

ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  group_by(Governorate) %>%
     summarize(Sum = sum(SUM)) 


ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
    ggplot()  +
    geom_col(aes(Governorate, SUM))
  

ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
    group_by(Governorate) %>%
      summarize( total = n()) 


ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
    ggplot()  +
      geom_bar(aes(Governorate))



ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
    ggplot()  +
      geom_bar(aes(Governorate, fill = factor(SUM)))


ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  ggplot()  +
  geom_bar(aes(Governorate, fill = ABD))

ewarn.tidy  %>% 
  filter(Month == "Mar" )  %>% 
  ggplot()  +
  geom_bar(aes(Governorate, fill = ABD))

ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  ggplot()  +
  geom_bar(aes(Governorate, fill = ABD),position = "dodge")


ewarn.tidy  %>% 
  filter(Month == "Mar")  %>% 
    ggplot()  +
       geom_bar(aes(Governorate, fill = factor(SUM)))


ewarn.tidy  %>% 
  filter(Month == "Mar"  & Governorate == "Aleppo")  %>% 
    ggplot()  +
      geom_bar(aes(ABD, fill = factor(SUM))) +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
          ggtitle("ABD report in Aleppo") +
          xlab("ABD report") + ylab("Number of observations") +
          theme(plot.title = element_text(hjust = 0.5))

unique(ewarn.tidy$Governorate)



ewarn.tidy  %>% 
  filter(Month == "Mar"  & Governorate == "Al-Hasakeh")  %>% 
  ggplot()  +
  geom_bar(aes(ABD, fill = factor(SUM))) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("ABD report in Aleppo") +
  xlab("ABD report") + ylab("Number of observations") +
  theme(plot.title = element_text(hjust = 0.5))

ewarn.tidy  %>% 
  filter(Month == "Mar"  & Governorate == "Al-Hasakeh")  %>% 
  ggplot()  +
  geom_bar(aes(ABD, fill = factor(SUM)), position = "dodge") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("ABD report in Aleppo") +
  xlab("ABD report") + ylab("Number of observations") +
  theme(plot.title = element_text(hjust = 0.5))


ewarn.tidy  %>% 
  filter(Month == "Jan" & Governorate == "Aleppo")  %>% 
      ggplot()  +
        geom_bar(aes(ABD))+
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
          ggtitle("ABD report in Aleppo") +
            xlab("ABD report") + ylab("Number of observations") +
              theme(plot.title = element_text(hjust = 0.5))