# 01_Introduction
# Installing R and Rstudio
# https://www.r-project.org/
# https://rstudio.com/products/rstudio/download/
# Taking a first look at the interface


# The hashtag is used to add comments
# THIS IS A LEVEL 1 HEADER #################################

## This Is a Level 2 Header ================================

### This is a level 3 header. ------------------------------

?mean
help(mean)

# Find help for a package.
help(package = 'dplyr')


# Show some demo graphs generated with R
 demo("graphics")

# BASIC COMMANDS ###########################################

2+2  # Basic math; press cmd/ctrl enter
 
# A division
(5 + 5)/2
# Exponentiation
2^5

1:100  # Prints numbers 1 to 100 across several lines
View(1:100)
print("Hello World!")  # Prints "Hello World" in console

# ASSIGNING VALUES #########################################

# Individual values
a <- 1            # Use <- and not =
2 -> b            # Can go other way, but silly
c <- d <- e <- 3  # Multiple assignments

# Multiple values

x <- 1:5  # Put the numbers 1-5 in the variable x
x  # Displays the values in x Print contents of x in Console

y <- c(6, 7, 8, 9, 10)  # Puts the numbers 6-10 in y (Vector)  c = Combine/concatenate
y
a = 5 # Use = possible but not recommended
a <- 1  # Use <- and 
2 -> a  # Can go other way, but silly
a <- b <- c <- 3  # Multiple assignments

# SEQUENCES ################################################

# Create sequential data
0:10     # 0 through 10
10:0     # 10 through 0
seq(10)  # 1 to 10
seq(30, 0, by = -3)  # Count down by 3

# MATH ################################################

# Surround command with parentheses to also print
(y <- c(5, 1, 0, 10)) 
mean(y)
max(y)
x + y       # Adds corresponding elements in x and y
x * 2       # Multiplies each element in x by 2
2^6         # Powers/exponents
sqrt(64)    # Squareroot
log(100)    # Natural log: base e (2.71828...)
log10(100)  # Base 10 log
seq(1, 10)

# CLEAN UP #################################################

rm(x)  # Remove an object from workspace
rm(a, b)  # Remove more than one
rm(list = ls())  # Clear entire workspace
?rm
airmiles

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L


getwd()
