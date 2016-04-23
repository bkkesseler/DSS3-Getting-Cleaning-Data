## DSS3-Getting-Cleaning-Data
## This is the final project for the Data Science Specialization Course 3 - 
## Getting & Cleaning Data

## Instructions:
## The purpose of this project is to demonstrate your ability to collect, work 
## with, and clean a data set. The goal is to prepare tidy data that can be 
## used for later analysis. You will be graded by your peers on a series of 
## yes/no questions related to the project. You will be required to submit: 
##   1) a tidy data set as described below, 
##   2) a link to a Github repository with your script for performing the 
##      analysis, and 
##   3) a code book that describes the variables, the data, and any 
##      transformations or work that you performed to clean up the data called 
##      CodeBook.md. You should also include a README.md in the repo with your 
##      scripts. This README explains how all of the scripts work and how they 
##      are connected.

## One of the most exciting areas in all of data science right now is wearable 
## computing - see for example this article 
## ( http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ ).
## Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
## advanced algorithms to attract new users. The data linked to from the course 
## website represent data collected from the accelerometers from the Samsung 
## Galaxy S smartphone. A full description is available at the site where the 
## data was obtained:
##      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Here are the data for the project:
##      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## You should create one R script called run_analysis.R that does the following.
##   1) Merges the training and the test sets to create one data set.
##   2) Extracts only the measurements on the mean and standard deviation for 
##      each measurement.
##   3) Uses descriptive activity names to name the activities in the data set
##   4) Appropriately labels the data set with descriptive variable names.
##   5) From the data set in step 4, creates a second, independent tidy data set
##      with the average of each variable for each activity and each subject.

## Review criteria
##   1) The submitted data set is tidy.
##   2) The Github repo contains the required scripts.
##   3) GitHub contains a code book that modifies and updates the available 
##      codebooks with the data to indicate all the variables and summaries 
##      calculated, along with units, and any other relevant information.
##   4) The README that explains the analysis files is clear and understandable.
##   5) The work submitted for this project is the work of the student who 
##      submitted it.

#### Clean up the working directory
rm(list=ls())

#### Prepare Work Directory
## Check to see if the file is in the current working directory.
zipfile <- "getdata-projectfiles-UCI HAR Dataset.zip"
if ( length(grep(zipfile,list.files())) > 0 )
        {
        print('UCI HAR Dataset zip file found')
        } else
        {
        stop('UCI HAR Dataset zip file not in current working directory')        
        }

## Check to see if extracted zip directory is present, if so, skip unzip
if ( length(grep("UCI HAR Dataset",list.files())) == 0 )
        {
        print('unzipping UCI HAR Dataset file')
        unzip(zipfile)
        } else
        {
        print('zip file extract present, continuing')
        }

#### Read in the files common to both datasets
## Import features.txt, which contains the column headings for the main file
column_headings <- read.table('UCI HAR Dataset/features.txt', header = FALSE)

## Import activity_labels.txt, which contains a list of which activities align
## with which numerical activity code
activity_map <- read.table('UCI HAR Dataset/activity_labels.txt', header = FALSE)

#### Read in the files for the 'test' datasets
## Import subject_test.txt, which contains the subject_id for each observation
test_subjects <- read.table('UCI HAR Dataset/test/subject_test.txt', header = FALSE)

## Import X_test.txt, which contains the main observations
test_main_observations <- read.table('UCI HAR Dataset/test/X_test.txt', header = FALSE)

## Import Y_test.txt, which contains the activity corresponding to each
## observation
test_activity_id <- read.table('UCI HAR Dataset/test/y_test.txt', header = FALSE)

#### Read in the files for the 'train' datasets
## Import subject_train.txt, which contains the subject_id for each observation
train_subjects <- read.table('UCI HAR Dataset/train/subject_train.txt', header = FALSE)

## Import X_train.txt, which contains the main observations
train_main_observations <- read.table('UCI HAR Dataset/train/X_train.txt', header = FALSE)

## Import Y_train.txt, which contains the activity corresponding to each
## observation
train_activity_id <- read.table('UCI HAR Dataset/train/y_train.txt', header = FALSE)

#### Assign column names
colnames(activity_map) <- c('activity_id','activity_type')
colnames(test_subjects) <- "subject_id"

test_subjects$source <- rep('test',nrow(test_subjects)) # add source flag
colnames(test_main_observations) <- column_headings[,2] 
colnames(test_activity_id) <- "activity_id"
colnames(train_subjects) <- "subject_id"

train_subjects$source <- rep('train',nrow(train_subjects)) # add source flag
colnames(train_main_observations) <- column_headings[,2] 
colnames(train_activity_id) <- "activity_id"

#### Create the combined test and train files
## Create the combined test file
combined_test <- cbind(test_subjects,test_activity_id,test_main_observations)

## Create the combined train file
combined_train <- cbind(train_subjects,train_activity_id,train_main_observations)

#### Combine the test and train files
test_and_train <- rbind(combined_test,combined_train)

#### Subset the dataset
## Store the column headings
combined_column_names <- colnames(test_and_train)

## Extract only the mean and std column names, along with subject and activity
## types
test_and_train_subset <- test_and_train[
        (
        ## keeps subject_id
        grepl("subject..",combined_column_names)        
        ## keeps activity_id
        | grepl("activity..",combined_column_names)
        ## keeps anything with "mean" in the column name
        | grepl("-mean..",combined_column_names)
                ## excludes meanFreq columns
                & !grepl("-meanFreq..",combined_column_names)
        ## keeps anything with "std" in the column name
        | grepl("-std..",combined_column_names)
        )
        ]

#### Properly name the columns
## Add activity type to main data
source_data_tidy <- merge(test_and_train_subset, activity_map, 
                          by = 'activity_id', all.x = TRUE)

## Rename data columns
colnames(source_data_tidy) <- gsub("\\()","",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("^t","time_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("^f","frequency_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("BodyBody","body_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("Body","body_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("Gravity","gravity_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("Acc","acceleration_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("Gyro","gyroscope_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("Jerk","jerk_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("Mag","magnitude_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("BodyBody","body_",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-mean$","mean",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-mean-X","X_mean",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-mean-Y","Y_mean",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-mean-Z","Z_mean",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-std$","std_dev",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-std-X","X_std_dev",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-std-Y","Y_std_dev",colnames(source_data_tidy))
colnames(source_data_tidy) <- gsub("-std-Z","Z_std_dev",colnames(source_data_tidy))

## Clean the activity_type
source_data_tidy$activity_type <- tolower(source_data_tidy$activity_type)

## Refactorize activity_type
source_data_tidy$activity_type <- factor(source_data_tidy$activity_type)

## Drop unnecessary activity_id column and reorder columns
source_data_tidy <- source_data_tidy[,c(
        "subject_id"
        ,"activity_type"
        ,sort(colnames(source_data_tidy[,3:42]))
        ,sort(colnames(source_data_tidy[,43:68]))
        )
        ]

## Sort the data
source_data_tidy <- source_data_tidy[
        order(
                source_data_tidy$subject_id
                ,source_data_tidy$activity_type
                )
        ,]

#### Create the summary data set
## Summarize by subject_ud and activity_type, averaging each variable
summary_data_tidy <- aggregate(
        source_data_tidy[,3:68]
        , by = list(source_data_tidy$subject_id,source_data_tidy$activity_type)
        , FUN=mean
        , na.rm=TRUE
        )

## Rename grouped variables
colnames(summary_data_tidy) <- c(
        "subject_id"
        ,"activity_type"
        ,colnames(summary_data_tidy[3:68])
        )