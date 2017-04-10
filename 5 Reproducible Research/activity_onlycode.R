setwd("C:/Users/sarah/uni/S6/Data Science Coursera/5 Reproducible Research/RepData_PeerAssessment1")


  ## Loading and preprocessing the data
activity <- read.csv("activity/activity.csv", header = T, na.strings = "NA")
head(activity)


## What is mean total number of steps taken per day?
steps_per_day <- sapply(split(activity$steps, activity$date), sum, na.rm=T)

library(ggplot2)
# print(qplot(steps_per_day, binwidth = 1000))


## What is the average daily activity pattern?
activity_pattern <- sapply(split(activity$steps, activity$interval), mean, na.rm=T)
activity_patternDF <- data.frame(interval = as.integer(names(activity_pattern)) , steps = activity_pattern)

# print(qplot(interval, steps, data=activity_patternDF, geom="path"))


## Imputing missing values

activity_imputed <- activity
for (i in 1:dim(activity_imputed)[1]) {
  if (is.na(activity_imputed[i,]$steps)) {
    activity_imputed[i,]$steps <- activity_pattern[as.character(activity_imputed[i,]$interval)]
  }
}

table(is.na(activity_imputed))

steps_per_day2 <- sapply(split(activity_imputed$steps, activity_imputed$date), sum, na.rm=T)

# print(qplot(steps_per_day2, binwidth = 1000))

## Are there differences in activity patterns between weekdays and weekends?
library(tidyr)

activity_imputed$date <- as.Date(activity_imputed$date)
activity_imputed$day <- weekdays(activity_imputed$date)
activity_imputed$day <- factor(ifelse(activity_imputed$day %in% c("Saturday", "Sunday"), "Weekend" , "Weekday"))

activity_pattern_imp <- sapply(split(activity_imputed$steps, list(activity_imputed$interval, activity_imputed$day)), mean, na.rm=T)
activity_pattern_imp <- data.frame(key = names(activity_pattern_imp), steps = activity_pattern_imp, row.names = NULL)
activity_pattern_imp <- separate(data = activity_pattern_imp , col = key, into = c("interval", "day"), sep = "\\.")
activity_pattern_imp$interval <- as.integer(activity_pattern_imp$interval)


print(qplot(interval, steps, data=activity_pattern_imp, geom="path", facets = day ~ .))