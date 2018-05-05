# Getting-and-Cleaning-Data-Week-4-Assignment

This assignment is for week 4 of Getting and Cleaning Data Coursera course.

First, download and unzip the data file into your R working directory.
Second, download the R source code into your R working directory.
Finally, execute R source code to generate tidy data file.

## Data description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Code explaination
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

## New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

Merges the training and the test sets to create one data set. Use command cbind/rbind to combine training and test set
Extracts only the measurements on the mean and standard deviation for each measurement. Use grepl command to get column indexes for variable name contains "mean()" or "std()"
Uses descriptive activity names to name the activities in the data set Convert activity labels to characters using merge.

Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns and creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command aggregate