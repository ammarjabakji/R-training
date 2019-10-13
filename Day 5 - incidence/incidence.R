#https://cran.r-project.org/web/packages/incidence/vignettes/overview.html

install.packages("incidence")

library(outbreaks)
library(tidyverse)
library(incidence)


dat <- ebola_sim$linelist$date_of_onset

glimpse(ebola_sim$linelist) %>% 
  View()
?ebola_sim


outbreak <- ebola_sim$linelist
class(outbreak)

outbreak %>%
  ggplot()+
  geom_col(aes(date_of_onset, generation ,fill=outcome))+
  xlab("Date") + ylab("Daily incidence")

incidence(outbreak$date_of_onset, interval = "1 week", groups = outbreak$gender ) %>%
  as_tibble() %>%
  View()

incidence(outbreak$date_of_onset, interval = "1 week") %>%
  as_tibble() %>%
  ggplot()+
  geom_col(aes(dates, counts ))+
  xlab("Date") + ylab("Daily incidence")

class(dat)
str(dat)
View(dat)

i <- incidence(dat)

str(i)
data <- as_tibble(i)
str(dat)
length(dat)
count(dat)
#> <incidence object>
#> [5888 cases from days 2014-04-07 to 2015-04-30]
#> 
#> $counts: matrix with 389 rows and 1 columns
#> $n: 5888 cases in total
#> $dates: 389 dates marking the left-side of bins
#> $interval: 1 day
#> $timespan: 389 days
#> $cumulative: FALSE
plot(i)

data %>% ggplot()+
  geom_col(aes(dates,counts))+
  xlab("Date") + ylab("Daily incidence")

# weekly, starting on Monday (ISO week, default)
i.7 <- incidence(dat, interval = "1 week")
data <- as_tibble(i.7)
plot(i.7)

data %>% ggplot()+
  geom_col(aes(dates,counts))+
  xlab("Date") + ylab("Daily incidence")


## monthly
i.month <- incidence(dat, interval = "1 month")
plot(i.month, border = "white")

data <- as_tibble(i.month)


data %>% ggplot()+
  geom_col(aes(dates,counts))+
  xlab("Date") + ylab("Daily incidence")

i.7.gender <- incidence(dat, interval = "1 week", groups = ebola_sim$linelist$gender)
i.7.gender
data <- as.data.frame(i.7.gender)


#> <incidence object>
#> [5888 cases from days 2014-04-07 to 2015-04-27]
#> [5888 cases from ISO weeks 2014-W15 to 2015-W18]
#> [2 groups: f, m]
#> 
#> $counts: matrix with 56 rows and 2 columns
#> $n: 5888 cases in total
#> $dates: 56 dates marking the left-side of bins
#> $interval: 1 week
#> $timespan: 386 days
#> $cumulative: FALSE
plot(i.7.gender, stack = TRUE, border = "grey")

data.tidy <- gather(data, Gender, Cases,-dates,-weeks, -isoweeks)

  data.tidy %>%
  ggplot()+
  geom_col(aes(dates,Cases,fill=Gender))+
  xlab("Date") + ylab("Daily incidence")
  
  
  
  
  
  
  i.7.hosp <- with(ebola_sim_clean$linelist, 
                   incidence(date_of_onset, interval = "week", groups = hospital))
  i.7.hosp
  #> <incidence object>
  #> [5829 cases from days 2014-04-07 to 2015-04-27]
  #> [5829 cases from ISO weeks 2014-W15 to 2015-W18]
  #> [6 groups: Connaught Hospital, Military Hospital, other, Princess Christian Maternity Hospital (PCMH), Rokupa Hospital, NA]
  #> 
  #> $counts: matrix with 56 rows and 6 columns
  #> $n: 5829 cases in total
  #> $dates: 56 dates marking the left-side of bins
  #> $interval: 1 week
  #> $timespan: 386 days
  #> $cumulative: FALSE
  head(get_counts(i.7.hosp))
  #>      Connaught Hospital Military Hospital other
  #> [1,]                  0                 1     0
  #> [2,]                  1                 0     0
  #> [3,]                  0                 0     3
  #> [4,]                  1                 0     0
  #> [5,]                  3                 5     1
  #> [6,]                  2                 4     5
  #>      Princess Christian Maternity Hospital (PCMH) Rokupa Hospital NA
  #> [1,]                                            0               0  0
  #> [2,]                                            0               0  0
  #> [3,]                                            0               0  2
  #> [4,]                                            1               1  1
  #> [5,]                                            1               1  1
  #> [6,]                                            1               1  4
  plot(i.7.hosp, stack=TRUE) + 
    theme(legend.position= "top") + 
    labs(fill="")
  
  

  data.tidy <- gather(as_tibble(i.7.hosp), Hospitals, Cases,-dates,-weeks, -isoweeks)
  
  data.tidy %>%
    ggplot()+
    geom_col(aes(dates,Cases,fill=Hospitals))+
    xlab("Date") + ylab("Daily incidence")
  
  
  
  i[100:250]
  #> <incidence object>
  #> [4103 cases from days 2014-07-15 to 2014-12-12]
  #> 
  #> $counts: matrix with 151 rows and 1 columns
  #> $n: 4103 cases in total
  #> $dates: 151 dates marking the left-side of bins
  #> $interval: 1 day
  #> $timespan: 151 days
  #> $cumulative: FALSE
  plot(i[100:250])
  
  
  # Modelling incidence
  # Incidence data, excluding zeros, 
  # can be modelled using log-linear regression of the form: log(y) = r x t + b
  # 
  # where y is the incidence, r is the growth rate, 
  # t is the number of days since a specific point in time (typically the start of the outbreak), 
  # and b is the intercept.
  # 
  # Such model can be fitted to any incidence object using fit.
  # Of course, a single log-linear model is not sufficient for 
  # modelling our epidemic curve, as there is clearly an growing and a decreasing phase.
  # As a start, we can calibrate a model on the first 20 weeks of the epidemic:
  # 
  dim(i.7)
  early.fit <- fit(i.7[1:20])
  early.fit
  plot(i.7[1:20])
  dim(i.7[1:20])
  
  plot(fit(i.7))
  
  plot(early.fit)
  
  incidence <- incidence(outbreak$date_of_onset, interval = "1 week")
  
  incidence <- fit(incidence[1:20]) 
  
  
  incidenceData <-  incidence$info$pred %>%
    as_tibble()
  
  
  glimpse(incidenceData)  
  
  
  incidenceData %>%
    ggplot()+
    geom_smooth(aes(dates, fit), lwd = 1) +
    geom_line(aes(dates, lwr),linetype="dashed") +
    geom_line(aes(dates, upr),linetype="dashed") +
    xlab("Date") + ylab("Predicted incidence")
  
  
  plot(i.7[1:20], fit = early.fit)
  

  