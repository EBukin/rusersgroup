

# How to learn ------------------------------------------------------------

?matrix # documentation for function named 'matrix'
??data # All documentation files related to 'data'
help.search("Generalized linear models") ## equivalent to ??, but handles strings
help(matrix)

# The swirl package
install.packages("swirl")
library(swirl)
swirl()

# http://cran.r-project.org/doc/manuals/r-release/R-intro.html

# Data types --------------------------------------------------------------

# numeric 
1
1L # numeric - integer number
A <- 1
B <- 2
C <- A + B
C
3 == C

### ### ### ### ### ### ###
# Fun with numeric numbers #
### ### ### ### ### ### ###
0.1
0.3 / 3
a <- 0.1
b <- 0.3 / 3

a
b

a == b
a - b

# character
"a"
"ABC"
"AB BC CD"
s <- "AB BC CD"

# Logical
TRUE
FALSE
tt <- TRUE
ff <- FALSE

ttt <- T
fff <- FALSE

ttt == tt
fff == ff
ttt != tt
fff != ff

# There are other data tipes such as factors (will ommit for now)

# Data structures ---------------------------------------------------------

# Vector
help(c)
# c()

simpleVector <- c(1, 2, 3, 4) # simple
namedVector <- c(a = 1, b = 2, c = 3, d = 4, e = 5) # named
namedVector <- setNames(1:5, letters[1:5]) # Same in another way

# Named vector of characters and other thins
namedVecChar <- 
  c("a" = "first letter", 
    "b" = "second letter", 
    "c" = "third letter")
logVector <- c(TRUE, FALSE, T)

# What can we do with the vector?
# Subset part 1
namedVector[1]
namedVector[3:4]

# Get names
names(simpleVector)
names(namedVector)

# Get structure
str(simpleVector)
str(namedVector)

# Compare vectors
namedVector == 1
namedVector == 1
namedVecChar == "third letter"

# Subset part 2
namedVecChar[logVector]
namedVecChar[namedVecChar == "second letter"]

### ### ### ###
namedVecChar[namedVecChar == "second"] # What would be the result here?
### ### ### ###

# Vectorised operations:
simpleVector
simpleVector + 3
simpleVector / 2
simpleVector + simpleVector

simpleVector / c(2,4)
simpleVector + c(1,2,3)

sum(simpleVector)
mean(simpleVector)

# matrix ------------------------------------------------------------------

help(matrix)

matrix(data = c(1:10), ncol = 1)
matrix(data = c(1:10), ncol = 2)
matrix(data = c(1:10), nrow = 2)

X <- matrix(data = c(rep(1,10), rnorm(20)), ncol = 3)

# what can we do with matrixes?

# See structure
str(X)

# Access one element
X[1, 3]

# Access one 
X[1, ] # ROW
X[,2] # column

## Delete a 
X[-5, ] #row
X[, -2] #column

## Add a row, col
rbind(X, c(1, 3, 3))
cbind(X, 1:10)

# Calculate new col/row
Y <- as.matrix(0.25 * X[,1] + 2.2 * X[,2] - 0.65 * X[,3] + rnorm(10, 0, 0.5))

# data.frame ---------------------------------------------------------------

df <- as.data.frame(cbind(Y,X))

# example of a LM with such data
fit <- lm(V1 ~ V3 + V4, data = df)
fit

# lists -------------------------------------------------------------------

help(list)

# Structure
str(fit)

# Accessing lists' elements
fit$coefficients
fit$residuals
fit$call

# Creating lists and other operations for self studying
namedList <- 
  list(a = c(1:10),
       b = letters,
       func_c = function(x){print("hello")})



# Installing and importing packages ---------------------------------------

# Install a package
installed.packages() # - to see installed packages

?install.packages
install.packages("tidyverse")

# Load a package
?library
library("NAME_OF_THE_PACKAGE")
library("tidyverse")

# Importing data into R ---------------------------------------------------

# Step 1. Check the Working directory
getwd()

# Step 2. Set a working directory if the one you have is the worng one
setwd()

# Step 3. Load packages

# we need `tibble`, `readr` and `readxl` packages
library(tibble)
library(readr)
library(readxl)

# Step 4. Load data

# We load data with read_csv
untidy_fao_data <- 
  read_csv("2018-02-21-first-meeting-introduction/FAOSTAT_example_data.csv")

# We load data with read_xlsx
untidy_wb_data <- 
  read_xlsx("2018-02-21-first-meeting-introduction/WB_pov_data.xlsx")

# Step 5. Understand data

# Execute object name
untidy_fao_data
untidy_wb_data

# glimps
glimpse(untidy_wb_data)
glimpse(untidy_fao_data)

# View
View()
View(untidy_wb_data)
View(untidy_fao_data)


# Tidy data ---------------------------------------------------------------








