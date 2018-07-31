---
title: "README"
author: "Kris Torrington"
date: "31 July 2018"
output: html_document
---
#Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Objectives
run_analysis.R performs the following:

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive activity names.

Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#How the "run_analysis.R" works
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