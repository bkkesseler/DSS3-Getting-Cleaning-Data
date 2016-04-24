# Readme for "Getting & Cleaning Data, Data Science Specialization Course 3, Final Project"

This is the repository for the final project of the Data Science Specialization Course 3 - Getting & Cleaning Data

---
There is only one script needed to complete this analysis, __RUN_ANALYSIS.R__.

__RUN_ANALYSIS.R__ expects the zip file from this site:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

to be located in the current working directory. It can be unzipped or not, the code is dynamic around that point.

---
The __RUN_ANALYSIS.R__ script will:
* process the zip file if needed
* merge the contained files to bring subject_id to the feature data
* combine the test and training sets
* add activity_type 
* keep only the mean and standard deviation values of the requested variables
* while changing the variable names to be descriptive.

The __RUN_ANALYSIS.R__ code will also create a summary data file, with the average of each variable across each subject-activity type subgroup.

---
The result will be two text files:
* __tidied_data_dss3_gcd.txt__ original data, tidied and formatted
* __summary_data_dss3_gcd.txt__ summary of __tidied_data_dss3_gcd.txt__ at the subject-activity type level, using average to summarize.