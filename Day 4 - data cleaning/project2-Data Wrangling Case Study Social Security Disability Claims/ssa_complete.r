# Data Wrangling in R
# Social Security Disability Case Study

# Load the tidyverse
library(tidyverse)
library(lubridate)
library(stringr)

# Read in the coal dataset
ssa <- read_csv("http://594442.youcanlearnit.net/ssadisability.csv")

# Take a look at how this was imported
glimpse(ssa)

# Make the dataset long
ssa_long <- gather(ssa, month, applications, -Fiscal_Year)

# And what do we get?
print(ssa_long, n=20)

# Split the month and application type
ssa_long <- separate(ssa_long, month, c("month", "application_method"), sep="_") 

# What does that look like?
print(ssa_long, n=20)

# What values do we have for months?
unique(ssa_long$month)

summary(ssa_long)

# Convert month to standard abbreviations (remove everything except the first 3 letters of month)
ssa_long$month <- substr(ssa_long$month,1,3)
ssa_long$month 
# What values do we now have for months and years?
unique(ssa_long$month)
unique(ssa_long$Fiscal_Year)

# Convert Fiscal_Year from alphanumeric strings to actual years
ssa_long$Fiscal_Year <- str_replace(ssa_long$Fiscal_Year, "FY", "20")

# What values do we now have for months?
unique(ssa_long$Fiscal_Year)

# Build a date string using the first day of the month
paste('01', ssa_long$month, ssa_long$Fiscal_Year)

ssa_long$Date <- dmy(paste("01", ssa_long$month, ssa$Fiscal_Year))

class(ssa_long$Date)
# What do those look like?
unique(ssa_long$Date)


# Let's look at where we are
summary(ssa_long)

# Remove Fiscal_Year and month columns
ssa_long$Fiscal_Year <- NULL
ssa_long$month <- NULL

# Convert application_method to a factor
ssa_long$application_method <- as.factor(ssa_long$application_method)

# How does that look
summary(ssa_long)

# Widen the final dataset
ssa <- spread(ssa_long, application_method, applications)

# And take a look
print(ssa,n=20)

# Add a column for the percentage of applications that were online
ssa$online_percentage <- ssa$Internet/ssa$Total*100

# Plot the results
ggplot(data=ssa, mapping=aes(x=Date,y=online_percentage)) +
  geom_point()+
  geom_smooth()
