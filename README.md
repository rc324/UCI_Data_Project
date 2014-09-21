UCI_Data_Project
================
The repository contains a script called run_analysis.R which takes the raw data from UCI creates a tidy data set called
UCI_TidyData.
The script assumes that it is in the UCI HAT Dataset directory and that the Train and Test data file are in their respective directories as it is in the raw data download from the UCI website. 

The script performs the following 5 steps to create the Tiday Data

####1. Merges the training and the test sets to create one data set.
It creates a data frame which concatenates the subject, activity and features columns and then merges the training and test data sets to create a complete data set
####2. Extracts only the measurements on the mean and standard deviation for each measurement.
In this step, the columns the variables which report measurements on mean and standard deviation are subsetted and a new data frame is created
####3. Uses descriptive activity names to name the activities in the data set
The activity numbers in the activity column are replaced with descriptive names from the activity_labels.txt file
####4. Appropriately labels the data set with descriptive variable names. 
The column names are changed to descriptive names, the features.txt file is read and the name of the features used to subset the columns in step 2 is used to subset the features. 
####5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Finally the script writes out a file UCI_TidyData which has the average of each variable for each activity and each subject

