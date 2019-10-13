library("tidyverse")
library("readxl")


info <- read_excel("transit-data.xlsx")

info <- read_excel("transit-data.xlsx",
                   sheet = "info",
                   range = cell_cols("B:C"))

write_csv(info, path = "timeperiods.csv")

transport_data <- read_excel("transit-data.xlsx",
                             sheet = "transport data",
                             skip = 1)

names(transport_data)

write_csv(transport_data, path = "transport_data.csv")

