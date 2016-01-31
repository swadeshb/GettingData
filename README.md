#Getting and Cleaning Data Course Project - Readme
#Program: run_analysis.R

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This R script does the following

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#To get the tidy data set with the average of each variable for each activity and each subject do following

1. Download the data from the below url
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the downloaded file in your working directory and it creates a directory UCIHARDataset
3. Download the run_analysis.R from the git to your working directory, not inside UCIHARDataset
4. The run_analysis.R assumes that all files are in ./UCIHARDataset
5. The run_analysis.R assumes that data.table and dplyr package is already installed. If its not installed, install using install.packages command. Example:
         install.packages("data.table")
         install.packages("dplyr")
6. Run run_analysus.R using below command
        source("run_analysis.R")
7. The run_analysis.R script creates the following tidy data file set 
    ../UCIHARDataset/identifier_avg_tidy_data.txt
