# Overview ----------------------------------------------------------------

# Assignment 1: Analysis of the protest data from Crowd Love
# For each question/prompt, write the necessary code to calculate the answer.
# For grading, it's important that you store your answers in the variable names
# listed with each question in `backtics`.
# For each prompt marked `Reflection`, please write a response
# in your `README.md` file.

# Part 1: Set up -----------------------------------------------------------

# In this section, you're loading the data and necessary packages.
# Load the `stringr` package, which you'll use later.
install.packages('stringr')
library(stringr)
library(dplyr)

# Load the data from https://countlove.org/data/data.csv
# into a variable called `protests`
protests <- read.csv(file = 'https://countlove.org/data/data.csv')
View(protests)

# How many protests are in the dataset? `num_protests`
# Number of protests = 38097
num_protests <- nrow(protests)
print(num_protests)

# How much information is available about each protest? `num_features`
# Unique pieces of information = 8
num_features <- ncol(protests)
print(num_features)

# Part 2: Attendees -------------------------------------------------------

# In this section, you're exploring the number of attendees.

# Extract the `Attendees` column into a variable called `num_attendees`
num_attendees <- protests$Attendees

# What is the lowest number of attendees? `min_attendees`
# (hint for this and other calculations: you'll need to consider missing values)
# Lowest number of attendees = 0
min_attendees <- min(na.omit(num_attendees))
print(min_attendees)

# What is the highest number of attendees? `max_attendees`
# Highest number of attendees = 725000
max_attendees <- max(na.omit(num_attendees))
print(max_attendees)

# What is the mean number of attendees? `mean_attendees`
# Mean number of attendees = 643.8831
mean_attendees <- mean(num_attendees, na.rm = TRUE)
print(mean_attendees)

# What is the median number of attendees? `median_attendees`
# Median number of attendees = 100
median_attendees <- median(num_attendees, na.rm = TRUE)
print(median_attendees)

# What is the difference between the mean and median number of attendees?
# `mean_median_diff`
# Difference between mean and median number of attendees = 543.8831
mean_median_diff <- mean_attendees - median_attendees
print(mean_median_diff)

# Reflection: What does the difference between the mean and the median
# tell you about the *distribution* of the data? (if you're unfamiliar with
# working with distibutions, feel free to ask your TA for clarification)

# To further assess the distribution of values, create a boxplot of the number
# of attendees using the `boxplot()` function.
# Store the plot in a variable called `attendees_distribution`
# (Note, we'll use much more refined plotting methods, and pay far
# more attention to detail later in the course)
attendees_distribution <- boxplot(num_attendees)

# Create another boxplot of the *log* of the number of attendees.
# Store the plot in a variable `log_attendees_distribution`.
# (note, you will see a warning in the console, which is expected)
log_attendees_distribution <- boxplot(log(num_attendees))

# Part 3: Locations -------------------------------------------------------

# In this section, you're exploring where protests happened.

# Extract the `Location` column into a variable called `locations`
locations <- protests$Location

# How many *unique* locations are in the dataset? `num_locations`
# Unique locations = 10037
num_locations <- length(unique(locations))
print(num_locations)

# How many protests occurred in Washington? `num_in_wa`
# (hint: use a function from the stringr package to detect the letters "WA")
# Protests occurred in Washington = 1375
num_in_wa <- sum(str_count(protests$Location, "WA"))
print(num_in_wa)

# What proportion of protests occurred in Washington? `prop_in_wa`
# Proportion of protests occurred in Washington = 0.1369931
prop_in_wa <- num_in_wa/num_locations
print(prop_in_wa)

# Reflection: Does the number of protests in Washington surprise you?
# Why or why not?

# Write a function `count_in_location()` that accepts (as a parameter)
# a `location` name, and returns the sentence (note: spacing and punctuation):
# "There were N protests in LOCATION.", where N is the number of
# protests that occured in that location, and LOCATION is the parameter that
# was provided into the function.
# Note, you should count the number of locations that *match* the parameter
# put into the function, so `Seattle` should be a match for "Seattle, WA"
count_in_location <- function(location) {
  N <- sum(str_count(protests$Location, location))
  return(paste0("There were ", N, " protests in ", location, "."))
}

# Use your function above to describe the number of protests in "Washington, DC"
# `dc_summary`
# There were 535 protests in Washington, DC.
dc_summary <- count_in_location("Washington, DC")
print(dc_summary)

# Use your function above to describe the number of protests in "Minneapolis"
# `minneapolis_summary`
# There were 210 protests in Minneapolis.
minneapolis_summary <- count_in_location("Minneapolis")
print(minneapolis_summary)

# Create a new vector `states` which is the last two characters of each
# value in the `locations` vector. Hint, you may want to again use the
# `stringr` package
locations <- protests$Location
states <- str_sub(locations, start = -2)

# Create a vector of the unique states in your dataset. `uniq_states`
uniq_states <- unique(toupper(states))

# Create a summary sentence for each state by passing your `uniq_states`
# variable and `count_in_location` variables to the `sapply()` function.
# Store your results in `state_summary`
# (don't miss how amazing this is! Very powerful to apply your function to an
# entire vector *at once* with `sapply()`)
state_summary <- sapply(uniq_states, count_in_location)

# Create a summary table by passing your `states` variable to the `table()`
# function, and storing the result in a variable `state_table`.
state_table <- table(states)

# Optional: use the View() function to more easily read the table
View(state_table)

# Reflection: Looking at the `state_table` variable, what data quality issues
# do you notice, and how would you use that to change your analysis (no need
# to actually change your analysis)?

# What was the maximum number of protests in a state? `max_in_state`
# (hint: use your `state_table` variable)
# Maximum number of protests in a state = 4439
max_in_state <- max(state_table)
print(max_in_state)

# Part 4: Dates -----------------------------------------------------------

# In this section, you're exploring *when* protests happened.

# Extract the `Date` column into a variable called `dates` by passing the
# column to the `as.Date()` function (this will process the values as dates,
# which are *luckily* already in an optimal format for parsing)
dates <- as.Date(protests$Date)

# What is the most recent date in the dataset? `most_recent`
# Most recent date = 2021-01-31
most_recent <- max(dates)
print(most_recent)

# What is the earliest date in the dataset? `earliest`
# Most recent date = 2017-01-15
earliest <- min(dates)
print(earliest)

# What is the length of the timespan of the dataset? `time_span`
# hint: R can do math with dates pretty well by default!
# Length of timespand of the dataset = Time difference of 1477 days
timespan <- most_recent - earliest
print(timespan)

# Create a vector of the dates that are in 2020 `in_2020`
in_2020 = dates[dates >= "2020-01-01" & dates <= "2020-12-31"]

# Create a vector of the dates that are in 2019. `in_2019`
in_2019 = dates[dates >= "2019-01-01" & dates <= "2019-12-31"]

# What is the ratio of the number of protests in 2020 comparted to 2019?
# `ratio_2020_2019`
# Rato of 2020 compared to 2019 = 2.33369
ratio_2020_2019 <- length(in_2020)/length(in_2019)
print(ratio_2020_2019)

# Reflection: Does the change in the number of protests from 2019 to 2020
# surprise you? Why or why not?

# Write a function `count_on_date()` that accecpts as a parameter a `date`,
# and returns the sentence:
# "There were N protests on DATE.", where N is the number of protests on that
# date, and DATE is the date provided
count_on_date <- function(date) {
  N <- sum(str_count(protests$Date, date))
  return(paste0("There were ", N, " protests on ", date, "."))
}

# Using your function you just wrote, how many protests were there on
# May 24th, 2020? `num_may_24`
# There were 8 protests on 2020-05-24.
num_may_24 <- count_on_date("2020-05-24")
print(num_may_24)

# Using your function you just wrote, how many protests were there on
# May 31th, 2020? `num_on_may_31`
# There were 487 protests on 2020-05-31.
num_may_31 <- count_on_date("2020-05-31")
print(num_may_31)

# For more on this timeline, see:
# https://www.nytimes.com/article/george-floyd-protests-timeline.html

# How many protests occured each month in 2020? `by_month_table`
# Hint: use the `months()` function, your `in_2020` dates, and the `table()`
# Function. If you like, you can do this in multiple different steps.
by_month_table <- table(months(in_2020))
View(by_month_table)

# As a comparison, let's assess the change between July 2019 and July 2020.
# What is the *difference* in the number of protests between July 2020 and
# July 2019? You'll want to do this in multiple steps as you see fit, though
# your answer should be stored in the variable `change_july_protests`.
# Difference in protests = 1271
change_july_protests <- sum(str_count(in_2020, "07-")) -
  sum(str_count(in_2019, "07-"))
print(change_july_protests)

# Reflection: do a bit of research. Find at least *two specific policies* that
# have been changed as a result of protests in 2020. These may be at the
# city, state, or University level. Please provide a basic summary, as well as a
# link to each article.


# Part 5: Protest Purpose -------------------------------------------------

# In this section, you're exploring *why* protests happened
# Extract the `Event..legacy..see.tags.` column into a variable called `purpose`
purpose <- protests$Event..legacy..see.tags.

# How many different purposes are listed in the dataset? `num_purposes`
# Unique purposes = 895
num_purposes <- length(unique(purpose))
print(num_purposes)

# That's quite a few -- if you look at -- View() -- the vector, you'll notice
# a common pattern for each purpose. It's listed as:
# SOME_PURPOSE (additional_detail)
# To get a higher level summary, create a variable `high_level_purpse` by
# extracting *everything before the first parenthesis* in each value
# in the vector. For example, from "Civil Rights (Black Women's March)"
# you would extract "Civil Rights". You'll also have to *remove the space*
# before the first parenthasis.
# Hint: this will take a little bit of googling // trial and error. Be patient!

high_level_purpse <- gsub(" \\(.*", "", purpose) 

# How many "high level" purposes have you identified? `num_high_level`
# 13 high level purposes
num_high_level <- length(unique(high_level_purpse))
print(num_high_level)

# Create a table that counts the number of protests for each high level purpose
# `high_level_table`
high_level_table <- table(high_level_purpse)

# Reflection: Take a look (`View()`) your `high_level_table` variable. What
# picture does this paint of the U.S.?
View(high_level_table)

# Part 6: Independent Exploration -----------------------------------------

# As a last step, you should write your own function that allows you to
# quickly ask questions of the dataset. For example, in the above sections,
# you wrote functions to ask the same question about different months, or
# locations. If you need any guidance here, feel free to ask!

# Extracts the 'Total.Articles' column into a variable called 'total_articles'
total_articles <- protests$Total.Articles

# Write a function `count_articles` that accepts as a parameter, `ARTICLES`,
# and returns the sentence:
# "A total of ARTICLES articles were used for a unique protest N times", where
# ARTICLES is the number of articles used for an individual protest and N is the
# amount of times a unique protest has used that specific number of articles.
count_articles <- function(ARTICLES) {
  N <- sum(str_count(protests$Total.Articles, ARTICLES))
  return(paste0("A total of ", ARTICLES, 
                " articles were used for a unique protest ", N, " times."))
}

# Determines the number of times a unique protest used 2 articles
# and stores it into the variable 'article_total_2'
# A total of 2 articles were used for a protest 7447 times.
article_total_2 <- count_articles("2")
print(article_total_2)

# Determines the number of times a unique protest used 35 articles
# and stores it into the variable 'article_total_35'
# A total of 35 articles were used for a protest 7 times.
article_total_35 <- count_articles("35")
print(article_total_35)