---
title: "CodeBook.md"
author: "Kris Torrington"
date: "31 July 2018"
output: html_document
---
# Codebook for Getting and Cleaning Data Project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

This code book summarizes the resulting data fields in tidy_data.txt.

## Data Source

Data downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##The Data
The "X_train.txt", "y_train.txt" and "subject_train.txt" files all contain information about training data.

The "X_test.txt", "y_test.txt" and "subjuect_test.txt" files contain information about testing data.

The "features.txt" file contain the names of all the measurements.

### Identifiers

subject - The ID of the test subject
activity - The type of activity performed when the corresponding measurements were taken

### Activity Labels

WALKING (value 1): subject was walking during the test

WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test

WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test

SITTING (value 4): subject was sitting during the test

STANDING (value 5): subject was standing during the test

LAYING (value 6): subject was laying down during the test

## Trasnformation of data - Step by Step
Set the working directory

Use the "download.file()" together with "unzip()"" function to download the zip file from website to my compute.

Use the "read.table()" function to load "X_train.txt", "y_train", "subject_train". "X_test", "y_test", "subject_test" into R.

Use the "rbind()" and "cbind()" functions to merge all of the train and test data sets together.

Use the "read.table()"" function to load "features.txt" into R.

Use the "grep()" function to find the indexes with "mean()" and "sd()".

Select all of the relevant columns and then set the columns name using the selected features name.

Use the "read.table()" function to load the "activity_labels.txt" file into R.

Use the "factor()" function with arguments "levels = " and "labels = " to replace the numbers to activity names.

Using "gsub()" function to make the column names easier to read

Creates a tidy data set ("tidy_data.txt") in the working directory Using "group_by()" and "summarise_each()" functions in the "dplyr" package to calculate all means for each of the relevent variables.
