# Readme for "Getting & Cleaning Data, Data Science Specialization Course 3, Final Project"

This is the repository for the final project of the Data Science Specialization Course 3 - Getting & Cleaning Data

There is only one script needed to complete this analysis, 'RUN_ANALYSIS.R'.

'RUN_ANALYSIS.R' expects the zip file from this site:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

to be located in the current working directory. It can be unzipped or not, the code is dynamic around that point.

The 'RUN_ANALYSIS.R' script will process the zip file, merge the contained files as needed, combine the test and training sets, and keep only the mean and standard deviation values of the requested variables.

The 'RUN_ANALYSIS.R' code will also create a summary data file, with the average of each variable across each subject-activity type subgroup.

The result will be two CSV files, 'tidied_data_dss3_gcd.csv' and 'summary_data_dss3_gcd.csv'.