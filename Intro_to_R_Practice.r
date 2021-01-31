#### Iris Dataset ####

# Import data table
library(data.table)

# the Edgar Anderson Iris Data is pre-loaded
iris
dt <- data.table(iris) # convert to data table - helpful for big data
df <- data.frame(iris) # data frames are built-in to R


# --------------------------------------------------------------------------- #

# Show the first 3 rows of the data
df[1:3,]


# Show the first 10 rows if species = versicolor
#attempt 1
df[1:10,]$Species == 'versicolor'

#attempt 2
require(data.table)
versspecies <- df$species=='versicolor'
d <- data.table(iris)
d[, head(.SD, 10), by=versspecies]

#attempt 3
library(dplyr)
top_n(df, 10, Species=='versicolor')


# What is the standard deviation of petal length of each species?
aggregate(df$Petal.Length, by = list(df$Species), sd)


# What is the maximum petal width of each species?
aggregate(df$Petal.Length, by = list(df$Species), max)


# What is the average petal length of each species?
aggregate(df$Petal.Length, by = list(df$Species), mean)


# What is the average petal width to average sepal width ratio for each species?
aggregate(df$Petal.Width/df$Sepal.Width, by = list(df$Species), mean)


# Create a histogram of petal length. Include a title and x-label
hist(df$Petal.Length, col='gray', main = 'Histogram of Iris Petal Length', xlab = 'Petal Length')


# Create a box of petal width. Include a title and x-label
boxplot(df$Petal.Width, col='gray', main='Boxplot of Iris Petal Width', xlab = 'Petal Length', ylab = 'Petal Length')
