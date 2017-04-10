library(data.table)  
library(dplyr)

# working directory has to be set to the folder that contains the "UCI HAR Dataset" folder

# read in all data files
xtest <- fread("UCI HAR Dataset/test/X_test.txt")
ytest <- fread("UCI HAR Dataset/test/y_test.txt")
stest <- fread("UCI HAR Dataset/test/subject_test.txt")
xtrain <- fread("UCI HAR Dataset/train/X_train.txt")
ytrain <- fread("UCI HAR Dataset/train/y_train.txt")
strain <- fread("UCI HAR Dataset/train/subject_train.txt")
features <- fread("UCI HAR Dataset/features.txt")
activities <- fread("UCI HAR Dataset/activity_labels.txt")

# combine train and test set
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
s <- rbind(strain, stest)

# activity labels should be lowercase
activities$V2 <- tolower(activities$V2)

# label the activities with descriptive strings instead of numbers 1-6
names(y) <- "yn"
y <- mutate(y, activity = activities$V2[yn])

# assign column names to x and subset to keep only mean and std columns
names(x) <- features$V2
selection <- grep("mean\\(\\)|std\\(\\)", names(x))
x <- x[, ..selection]

# cbind subject IDs, activity descriptors and data
tidy <- cbind(subjectid = s$V1, activity = y$activity, x)

# make column names as verbose as possible
names(tidy) <- gsub("-", "", names(tidy))
names(tidy) <- gsub("Acc", "Acceleration", names(tidy))
names(tidy) <- gsub("std\\(\\)", "StandardDeviation", names(tidy))
names(tidy) <- gsub("mean\\(\\)", "Mean", names(tidy))
names(tidy) <- gsub("Mag", "Magnitude", names(tidy))
names(tidy) <- gsub("^t", "Time", names(tidy))
names(tidy) <- gsub("^f", "Frequency", names(tidy))
names(tidy) <- gsub("BodyBody", "Body", names(tidy))

# optional: save this data set to working directory
# write.csv(tidy, "UCI_HAR_Dataset_clean.csv", row.names = FALSE)

# create a second data set with the average values for each subject and activity
tidy.x <- subset(tidy, select = c(-subjectid, -activity))
tidy.s <- subset(tidy, select = c(subjectid, activity))
avg <- aggregate(tidy.x, tidy.s, mean)
names(avg) <- gsub("^T", "meanT", names(avg))
names(avg) <- gsub("^F", "meanF", names(avg))

# save dataset
write.table(avg, "UCI_HAR_Dataset_averages.txt", row.names = FALSE)

# remove unnecessary variables from workspace
rm(activities, features, s, stest, strain, x, xtest, xtrain, y, ytest, ytrain, selection, tidy.x, tidy.s)