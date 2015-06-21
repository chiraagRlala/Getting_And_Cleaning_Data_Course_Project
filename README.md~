# Getting and Cleaning Data Course Project

## Raw Data

Raw data for the project can be obtained from the URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
This URL has been provided on the course website.
A compressed zip folder gets downloaded which is required to be unzipped.
After decompressing you get a directory `UCI HAR Dataset` that contains all the raw data. 

## run_analysis.R

This R script converts the raw data into tidy data (as required in the project) through the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## How to run the script

1. Set `UCI HAR Dataset` directory to be the working directory in R console (or RStudio).
2. From `features.txt` file, manually extract only the relevant measurements - in this case only the mean and standard deviation for each measurement - and save it in `subfeatures.txt` file.
3. Save `run_analysis.R` in this working directory and source it in R console (or Rstudio).
4. After running, you will see the intended tidy data saved in the `answer_tidy_dataset.txt` file in the working directory.

## Creating `subfeatures.txt` (Extracting means and standard deviation of measurements)

`features.txt` is a file in `UCI HAR Dataset` that stores the names of each variable of the raw dataset. Because we are interested only in specific variables (namely the mean and standard deviations only for each measurement) hence we create a file storing names of only those relevant variables. There are 11 measurement types x 3 dimensions = 33 measurements. Hence 33 means of the measurement and 33 standard deviations of the measurements. These 66 variable names are manually extracted from `features.txt` and stored in `subfeatures.txt`

## How run_analysis.R works

1. Loads the Train and Test data using read.table() function
2. Merges the Train and Test data using rbind() function
3. Column binds the ids (Subject and Activity) to the raw data to get a single data frame
4. Selects the relevant columns indicated in `subfeatures.txt` file using the select() function from dplyr library thus reducing dimension of raw data
5. Loads the activity labels from `activity_labels.txt` (in `UCI HAR Dataset`) and replaces the numbers in Activity column by the character labels
6. Changes column names of the data frame to descriptive names of the variables obtained from `subfeatures.txt`
7. Group the data frame by ids (Subject and Activity, the first and second column) using group_by() function of dplyr library
8. Summarise means of each variable using summarise_each() function
9. The tidy data thus created is then stored in `answer_tidy_dataset.txt` in the working directory using write.table() function

## Tidy Data

The resulting tidy dataset is in this repository `answer_tidy_dataset.txt`. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset. The dataset satisfies all the principles of tidy data.