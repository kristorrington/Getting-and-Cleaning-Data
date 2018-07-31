#0. Set the working directory

setwd("C:/Users/Kris")

#-------------------------------------------------------------------------------
# 1. Merge the training and the test sets to create one data set.

## 1.a: download the zip file from the website
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists('./data/projectData_getCleanData.zip')){
  download.file(fileUrl, destfile = "./data/projectData_getCleanData.zip")

## 1.b: unzip the .zip file into /data directory
listZip <- unzip("./data/projectData_getCleanData.zip", exdir = "./data")
}

## 1.c: load data into R

testX <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
trainX <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## 1.d: merge train and test data
allTrainData <- cbind(trainSubject, trainY, trainX)
allTestData <- cbind(testSubject, testY, testX)
allData <- rbind(allTrainData, allTestData)


# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

## 2.a: load the feature names into R
featureName <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]

## 2.b:  extract the mean and standard deviation of each variable
featureIndex <- grep(("mean\\(\\)|std\\(\\)"), featureName)
finalAllData <- allData[, c(1, 2, featureIndex+2)]
colnames(finalAllData) <- c("subject", "activity", featureName[featureIndex])

# 3. Uses descriptive activity names to name the activities in the data set

## 3.a: load activity data into R
activityName <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## 3.b: replace 1 to 6 with activity names
finalAllData$activity <- factor(finalAllData$activity, levels = activityName[,1], labels = activityName[,2])

#4. Labels the data set with descriptive variable names.

names(finalAllData) <- gsub("Acc", "Accelerometer", names(finalAllData))
names(finalAllData) <- gsub("Gyro", "Gyroscope", names(finalAllData))
names(finalAllData) <- gsub("Mag", "Magnitude", names(finalAllData))
names(finalAllData) <- gsub("\\()", "", names(finalAllData))
names(finalAllData) <- gsub("^t", "Time", names(finalAllData))
names(finalAllData) <- gsub("^f", "Frequency", names(finalAllData))
names(finalAllData) <- gsub("-mean", "_Mean_", names(finalAllData))
names(finalAllData) <- gsub("-std", "_StandardDeviation_", names(finalAllData))

#-------------------------------------------------------------------------------
# 5. Create a tidy data set ("tidy_data.txt") in the working directory with the average of each variable for every activity and subject.
library(dplyr) #load dplyr
groupData <- finalAllData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

write.table(groupData, "tidy_data.txt", row.names = FALSE)