#  Reading Data

getwd()

# CSV FILES
# R converts missing to "NA"
# Don't have to specify delimiters for missing data
# because CSV means "comma separated values"
# "header = T" means the first line is a header
# This first one will not work because of the backslashes
sn.csv <- read.csv("C:\Users\Barton Poulson\Desktop\social_network.csv", header = T)
# Need to either double up the backslashes...
sn.csv <- read.csv("C:\\Users\\Barton Poulson\\Desktop\\social_network.csv", header = T)
# Or replace with forward slashes
sn.csv <- read.csv("C:/Users/Barton Poulson/Desktop/social_network.csv", header = T)

sn.csv <- read.csv("social_network.csv", header = T)

names(sn.csv)
str(sn.csv)

ls()  # List objects