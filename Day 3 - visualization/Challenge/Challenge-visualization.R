# Data Visualization with ggplot
# Scatterplots


library(tidyverse)



college <- read_csv('http://672258.youcanlearnit.net/college.csv')

head(college)
tails(college)
summary(college)
glimpse(college)

college <- college %>%
  mutate(loan_default_rate=as.numeric(loan_default_rate))

summary(college)

# 1) create correlation test for the varialbes from admission_rate  to loan_default_rate 

# 2) create plot for the varialbes from admission_rate  to loan_default_rate 

# 3) Create a scatterplot where x = tuition and y = sat_avg using ggplot

# 4) differentiate public vs. private schools (Control) by shape

# 5) differentiate public vs. private schools (Control) by color

# 6) differentiate undergrads by size

# 7) convert the  tuition vs. SAT  scores scatterplot to a line graph

# 8) add geom_point to the same chart

# 9) replace the line plot with smooth plot

# 10) add alpha to the  geom_point to make it transparent

# 11) Create a bargraph to illustrate  How many schools are in each region

# 12) # Break it out by public vs. private usig fill 

#13) Create a bargraph to illustrate the average tuition by region
#HINT: use group_by and summarize before creating the chart

#14) Create histogram for undergrads filed with 10 bins

#15) Create boxplot between tuition vs. institutional control
