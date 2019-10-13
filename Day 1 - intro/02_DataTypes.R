# File:     02_DataTypes.R

# DATA TYPES ###############################################

# Numeric

n1 <- 15  # Double precision by default
n1
typeof(n1)
class(n1)

n2 <- 1.5
n2
typeof(n2)
class(n2)

n3 <- NA
typeof(n3)
is.na(n3)
# Character

c1 <- "c"
c1
typeof(c1)
class(c1)

c2 <- "a string of text"
c2
typeof(c2)
class(c2)

# Logical

l1 <- TRUE
l1
typeof(l1)
class(l1)

l2 <- F
l2
typeof(l2)
class(l2)

# DATA STRUCTURES ##########################################
# Data Structures are * Vectors * Lists * Matrices * Arrays * Data frame * FACTORS

## Vector ==================================================

v1 <- c(1, 2, 3, 4, 5)
v1
typeof(v1)
is.vector(v1)

v2 <- c("a", "b", "c")
v2
is.vector(v2)

v3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
v3
is.vector(v3)

## Matrix ==================================================

m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
m1

m2 <- matrix(c("a", "b", 
               "c", "d"), 
               nrow = 2,
               byrow = T)
m2
m2[1]
## Array ===================================================

# Give data, then dimensions (rows, columns, tables)
a1 <- array(c(1:24), c(4, 3, 2))
a1

## Data Frame ==============================================
?data.frame
x <- data.frame("SN" = 1:3, "Name" = c("A","B","C"))
str(x)   

# Can combine vectors of the same length
# data frame is like a spreadsheet
# Columns (aka: variables) are vectors
# Rows (aka: observations) are lists and must contain an equal number of columns

I.am.a.vector <- c(1,2,3,4,5,6)
I.am.also.a.vector <- c("twas","brillig","and","the","slithey","toves")
many.months <- month.abb[1:6] # e.g. jan, feb, mar, apr, may, jun

I.am.a.dataframe <- data.frame(I.am.a.vector,I.am.also.a.vector,many.months)
class(I.am.a.dataframe)
is.data.frame(I.am.a.dataframe)

# vectors need to have identical lengths (lengths aka "observations")
I.am.a.short.vector <- c(1:5)
#I.am.a.failure <- data.frame(I.am.a.vector,I.am.a.short.vector) #oops - different # of rows


vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

?cbind

df1 <- cbind(vNumeric, vCharacter, vLogical)
df1  # Coerces all values to most basic data type
class(df1)

df2 <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df2  # Makes a data frame with three different data types
class(df2)

#  vector from Monday to Friday
vector <- c(140, -50, 20, -120, 240)
vector


# MISSING VALUES (NA)
vector1 = c(13.5,15, 40, NA)
vector1
is.na(vector1)

## Name the vectors
names(vector) <- c("Mon","Tues","Wed","Thur","Fri")
vector

vector <- c("Mon"= 140,"Tues"=-50, "Wed"= 20, "Thur"= -120, "Fri"=240)
View(vector)
vector <- c(Mon= 140,Tues=-50, Wed= 20, Thur= -120, Fri=240)
vector


## First, just an example
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector
total_vector

## List ====================================================
?list
# special type of a vector that can sotre mixed types

o1 <- c(1, 2, 3)
o2 <- c("a", "b", "c", "d")
o3 <- c(T, F, T, T, F)
vector <- c(o1, o2, o3)
list1 <- list(o1, o2, o3)

str(vector)
str(list1)

list1

list2 <- list(o1, o2, o3, list1)  # Lists within lists!
list2

## Factors ====================================================

# Factors are lists of unique values, Stored as integers
I.am.a.vector <- c("blue","black","green","white","black","blue","blue") # color of cars passing my window
I.am.a.factor <- factor(I.am.a.vector)


I.am.a.vector # notice the repeat of blue and black
I.am.a.factor 
View(I.am.a.factor)
levels(I.am.a.factor) # no repeat! Efficient storage.

levels(I.am.a.factor) <- c("one","two","three","four")
I.am.a.factor 

table(I.am.a.factor) # count frequency of values. table is a collection of factors
nlevels(I.am.a.factor) # NUMBER of unique values
unique(I.am.a.factor)
barplot(table(I.am.a.factor)) # extra credit
levels(ordered(I.am.a.factor))

sum(table(factor(I.am.a.vector,exclude = "blue"))) # count all cars except blue cars

# COERCING TYPES Changing DataType ###########################################

## Automatic Coercion ======================================

# Goes to "least restrictive" data type

(coerce1 <- c(1, "b", TRUE))
typeof(coerce1)

## Coerce Numeric to Integer ===============================

(coerce2 <- 5)
typeof(coerce2)

(coerce3 <- as.integer(5))
typeof(coerce3)

## Coerce Character to Numeric =============================

(coerce4 <- c("1", "2", "3"))
typeof(coerce4)

(coerce5 <- as.numeric(c("1", "2", "3")))
typeof(coerce5)

## Coerce Matrix to Data Frame =============================

(coerce6 <- matrix(1:9, nrow= 3))
is.matrix(coerce6)

(coerce7 <- as.data.frame(matrix(1:9, nrow= 3)))
is.data.frame(coerce7)



