# **Programming Assignment Week 4** 
## Peer review project 
* This repository contains the course project for the _Getting and Cleaning Data_ course, on _Cousera_ *
The R script named "run_analysis.R" does the following:
1. Check if dataset already exists in workind directory, if not it downloads and unzips it.
2. Merge the training and the test sets to create one data set.
  1. Read files form the traingin and test data sets.
  2. Assing column names.
  3. Merge both sets in one.
3. Extract only the measurements on the mean and standard deviation for each measurement.
  1. Read column names.
  2. Create vector for ID, mean and standard deviation.
  3. Make subset of mean and standard deviation from the merged dataset of train and test. 
4. Merge mean and standard deviation subset with activity names to use descriptive activity names and variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
* The output corresponds to the second tidy data set. It is shown in the file named "TidySetTwo.txt"

