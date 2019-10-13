# Calculating descriptives


# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)
summary(sn$Age)  # Summary for one variable
summary(sn)      # Summary for entire table (inc. categories)

# Tukey's five-number summary: minimum, lower-hinge
#     (i.e., first quartile), median, upper-hinge
#     (i.e., third quartile), maximum
# Doesn't print labels
fivenum(sn$Age)



table(sn$Site)  # Creates frequency table in alphabetical order
site.freq <- table(sn$Site)  # Saves table
site.freq  # Print table

site.freq <- site.freq[order(site.freq, decreasing = T)] # Sorts by frequency, saves table
site.freq  # Print table

prop.table(site.freq)  # Give proportions of total
prop <- round(prop.table(site.freq), 2)  # Give proportions w/2 decimal places
barplot(prop)

# Alternate descriptive statistics
# Gives n, mean, standard deviation, median, trimmed mean
#   (10% by default),median absolute deviation from median
#   (MAD), min, max, range, skew, kurtosis, and
#   standard error.
# Options for listwise deletion of missing data, methods of 
#   calculating median/skew/kurtosis, amount of trimming, etc.
# Note: Converts categories to sequential numbers and does
#   stats; can be useful in certain situations; marks with *
install.packages("psych")
library("psych")
describe(sn)
?describe