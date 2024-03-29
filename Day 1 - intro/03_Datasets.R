
# Using R’s built-in datasets

# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
?datasets
library(help = "datasets")
# To load "datasets," the built-in R datasets package,
# either click on "datasets" in the package manager or
# type either of the following:
?library
library(datasets)
?require
require(datasets)

# To remove the datasets package
detach(package:datasets)

# To see a list of the available datasets
data()


# You can see the same list with clickable links
# to descriptions for each dataset at
browseURL("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html")

# For information on a specific dataset
?cars


# To load a dataset from the package into the Workspace
data(cars)  # Listed as "ts" for "time-series"

# To see the contents of the dataset
# (Don't actually need to load for this)
cars

# To see its "structure"
?str
str(cars)

# Or, in RStudio, click on the dataset in "Workspace,"
# which uses the "fix" function and makes it possible
# edit the dataset in a new window

# Now a dataset that has rows and columns
?iris
data(iris)  # Appears under "Data" in the Workspace

# See its structure
str(iris)

# See its data (or click on name in Workspace)
iris

rm(list = ls())  # Clean up