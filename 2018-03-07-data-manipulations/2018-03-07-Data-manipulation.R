# R-Users at IAMO meeting on March 7, 2018.


# setups ------------------------------------------------------------------

# installed.packages("tidyverse")
library(tidyverse)
library(skimr)

# Data import -------------------------------------------------------------

# Why read_csv and not read.csv
fs <- read_csv("2018-03-07-data-manipulations/data/fs_practice.csv")
fs

fs_old <- read.csv("2018-03-07-data-manipulations/data/fs_practice.csv")
names(fs_old)

tpan <- read_csv("2018-03-07-data-manipulations/data/tidy_panel_data.csv", locale = locale(decimal_mark = ","))
tpan

# Check the data set
str(fs)
head(fs)
tail(fs)
glimpse(fs)
View(fs)

# skimr
skim(tpan)

# 
tpan %>% 
  group_by(year) %>% 
  skim

# Variables selection -----------------------------------------------------

### ### # distinct()
#Selects unique cass of some variables.
tpan %>% 
  distinct(year)

tpan %>% 
  distinct(id) %>% 
  pull()

### ### # select()
# Select some columns from the table
tpan %>% 
  select(id, year, y, n, k)

ctpan <- 
  tpan %>% 
  select(-y_1)

ctpan <- select(tpan, -y_1)

# What can we do with the fs dataset?

### ### # rename()
# Rename some cols in the fs dataset and combine steps together
cfs <- 
  fs %>% 
  rename(ar_c = `Area Code`) %>% 
  rename(el_c = `Element Code`,
         it_c = `Item Code`) %>% 
  select(-`Year Code`, - Flag)

# The same in the old-fasion - non pipeline style:
cfs <- rename(fs, ar_c = `Area Code`)
cfs <- rename(cfs, 
              el_c = `Element Code`,
              it_c = `Item Code`)
cfs <- select(cfs, -`Year Code`, - Flag)

# The same in the old style - NEVER DO THAT
fs_old <- as.data.frame(fs)
names(fs_old)[names(fs_old) == "Area Code" ] <- "ar_c"
names(fs_old)[names(fs_old) == "Element Code" ] <- "el_c"
names(fs_old)[names(fs_old) == "Item Code" ] <- "it_c"
fs_old <- fs_old[, !names(fs_old) %in% c("Year Code", "Flag")]
head(fs_old)

### ### # filter()

# == Use fs dataset to filter Year, Items, Elements
fs %>% 
  filter(Year == 2010)

# %in%
fs %>% 
  filter(Year == 2010)

# is.na()

# != or !%in%

# One and multiple filtering operations

### ### # sample()
### ### # slice()
### ### # top_n()


### ### # arrange()
# Ordering observations use tpan to see panel data better.
tpan %>% 
  arrange(id, year)

### ### # desc()

### ### # mutate()

# Convert millions to thousand
cfs %>% 
  filter(Unit == "millions") %>% 
  mutate(Value_2 = Value * 1000) %>% 
  mutate(Value = Value * 1000)

# Calculate real values of the y, n, k
tpan 

### ### # summarise()

ex <- tibble(group = rep(letters[1:5],5), var1 = rnorm(25), var2 = rnorm(25))

### ### # group_by()

# Exmple of group by arrangement and summary


# tidydata ----------------------------------------------------------------

# Tidy data example
DSR::table1

# Untidy example 1

# separate()
DSR::table3 %>% 
  separate(rate, c("cases", "population"), "/")

# When we need to combine variables together:
# unite()
DSR::table1 %>% 
  unite(rate, cases, population,  sep = "/")

# make data tidy by ensuring that each observation corresponds to one row
# spread
DSR::table2 %>% 
  spread(key, value)

# When we need to normalize data in the long format:
DSR::table1 %>% 
  gather(var, val, cases, population)

# Exmaple when we need to normalise and join
a <- 
  DSR::table4 %>% 
  gather(year, cases, 2:3) 

b <- 
  DSR::table5 %>% 
  gather(year, population, 2:3)

right_join(a, b, by = c("country", "year"))

# EXAMPLES ----------------------------------------------------------------

# export data for somebody!
DSR::population %>% 
  filter(year >= 2010, year <= 2015) %>% 
  spread(year, population) #%>% 
  # write_excel_csv("data_for_a_friend.csv")

# Calculate someting
cfs %>% 
  distinct(Element, Item)

# Check if the GDP is the sum of values added.
cfs

# Calculate share of agriculture in gdp
cfs

# Practical examples of using tidyverse for exploratory analysis
# install.packages("dslabs")
library("dslabs")

data("gapminder")
gapminder <- 
  gapminder %>% 
  tbl_df()

gapminder %>% 
  filter(year %in% c(1970, 2010)) %>% 
  ggplot() + 
  aes(fertility, life_expectancy, colour = continent, size = population / 1000000) + 
  geom_jitter() + 
  facet_grid(~year)







