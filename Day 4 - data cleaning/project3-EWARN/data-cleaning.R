library(tidyverse)
library("readxl")
library(stringr)


EWARN <- read_xlsx("EWARN.xlsx")


head(EWARN)
summary(EWARN)
names(EWARN)

EWARN2019ABD <- EWARN %>% 
  select(Year, Month,Week, Governorate, District, Subdistrict, Community,"Sum of 0 - 4 years ذكر-ABD","Sum of 0 - 4 years أنثى-ABD", "Sum of ≥ 5 years ذكر-ABD", "Sum of ≥ 5 years أنثى-ABD") %>% 
  filter(Year == "2019")

EWARN2019ABD <- EWARN %>% 
  select(Year:Community,contains("ABD")) %>% 
  filter(Year == "2019")


ewarn.tidy <- gather(EWARN2019ABD, ABD, SUM,"Sum of 0 - 4 years ذكر-ABD","Sum of 0 - 4 years أنثى-ABD", "Sum of ≥ 5 years ذكر-ABD", "Sum of ≥ 5 years أنثى-ABD", -Year, -Month,-Week, -Governorate, -District, -Subdistrict, -Community)

ewarn.tidy <- gather(EWARN2019ABD, ABD, SUM,contains("ABD"), -(Year:Community))


ewarn.tidy <- distinct(ewarn.tidy)

summary(ewarn.tidy)


ewarn.missing <- ewarn.tidy  %>% 
  filter( is.na(SUM))


ewarn.complete <- ewarn.tidy  %>% 
  filter( complete.cases(SUM))

ewarn.complete2 <- ewarn.tidy  %>% 
  filter( !is.na(SUM))

# replaced Na
ewarn.nato0 <- ewarn.tidy  %>%
  mutate(obs=replace_na(SUM, 0))

str(ewarn.tidy)
summary(ewarn.tidy)

ewarn.tidy  %>% 
  filter(Month == "Mar")  %>% 
    group_by(Governorate) %>%
      summarize(Sum = sum(SUM)) 

ewarn.complete  %>% 
  filter(Month == "Mar")  %>% 
  group_by(Governorate) %>%
  summarize(Sum = sum(SUM)) 

ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  group_by(Governorate) %>%
     summarize(Sum = sum(SUM)) 


ewarn.tidy  %>% 
  filter(  !is.na(SUM) & Week==1)  %>% 
    ggplot()  +
    geom_col(aes(Governorate, SUM))
  

ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM) )  %>% 
    group_by(Governorate) %>%
      summarize( total = n()) 


ewarn.tidy  %>% 
  filter( !is.na(SUM))  %>% 
    ggplot()  +
      geom_bar(aes(Governorate)) +
    facet_wrap(~ Month)
  


##
 
ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  group_by(Governorate) %>% 
  summarise(n = n()) %>% 
  mutate(prop = n/sum(n))  %>% 
  ggplot()  +
  geom_col(aes(Governorate,prop),fill='steelblue') + geom_text(aes(x = Governorate, 
                                             y = prop + 0.05, label = round(prop, 2))) +
  coord_flip()

ewarn.tidy1  <-  
  ewarn.tidy %>%  mutate(gender=case_when(grepl("ذكر", ABD) ~ "male",
                                          grepl("نثى", ABD, ignore.case = TRUE) ~"female"))

ewarn.tidy1  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  ggplot()  +
  geom_col(aes(Governorate,ABD)) +
  facet_wrap(~gender)


ewarn.tidy1  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  ggplot()  +
  geom_col(aes(Governorate,SUM,fill=gender), position = "dodge")

ewarn.tidy1 %>% ggplot(aes(x="",y=ewarn.tidy1$SUM,fill=ewarn.tidy1$gender))+geom_bar(width = 1, stat = "identity")+ coord_polar("x", start=0)

ewarn.tidy1  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
    ggplot()  +
      geom_bar(aes(Governorate, fill = gender))


ewarn.tidy  %>% 
  filter(Month == "Mar" )  %>% 
  ggplot()  +
  geom_bar(aes(SUM, fill = Governorate))

ewarn.tidy  %>% 
  filter(Month == "Mar" & !is.na(SUM))  %>% 
  ggplot()  +
  geom_bar(aes(SUM, fill = Governorate), position = "dodge")



# Create line graph to discribe the data



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