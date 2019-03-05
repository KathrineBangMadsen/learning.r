source(here::here("R/package-loading.R"))
1
# note to yourself (use # for comments)
# object assignment
weight_kilos <- 100
# vector
c("a", "b")
c(1, 2)
1:10
# dataframe
head(iris)
colnames(iris)
str(irsi)
str(iris)
summary(iris)

# Object names
DayOne
dayone
T <- FALSE
c <- 9
mean <- function(x)
  sum(x)

# Spacing
x[, 1]
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
function (x) {
}
function(x) {
}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x ^ 2 + y ^ 2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug)
  message("Y is negative")
# restyle code with Ctrl-Shift-A
# what in a function  - use ``
`+`

summing <- function(a, b) {
  add_numbers <- a + b
  return(add_numbers)
}
summing(2, 2)

library(tidyverse)

# data wrangling ----------------------------------------------------------


write_csv(iris, here::here("data/iris.csv"))
iris_data <- read_csv(here::here("data/iris.csv"))
iris_data
