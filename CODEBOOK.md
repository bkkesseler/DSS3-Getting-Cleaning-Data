# Codebook for "Getting & Cleaning Data, Data Science Specialization Course 3, Final Project"

================================================================================

## Data Source
Data originally from "Human Activity Recognition Using Smartphones Data Set," within the UCI Machine Learning Repository.

Project site here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data file downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For more information about this dataset contact: activityrecognition@smartlab.ws

================================================================================

## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

================================================================================

## Background

(the following is pulled directly from the data source readme, edited where needed to indicate variable name changes, but the majority of the text in this section is the work of the original research team)

### Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See the __Features__ section for more details. 

### For each record the following are provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 66-feature vector with time and frequency domain variables. 
* 'activity_type' - Its activity label, a factor variable including walking, walking_upstairs, walking_downstairs, sitting, standing, laying 
* An identifier of the subject who carried out the experiment.

### The revided and tidied dataset includes the following files:

* 'README.txt'

* 'CODEBOOK.md': This file, which documents the data source, the data structure, and the data itself.

* 'tidied_data_dss_gcd3.csv': Data in a CSV file, tidied, with one row per observation, as described in the Features section.

* 'summary_data_dss_gc3.csv': Data summarized per each subject and activity available, as described in the Features section.

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

================================================================================

## Features

### Feature Selection for the Main Data ('tidied_data_dss_gcd3.csv)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_body_acceleration_XYZ and time_gravity_acceleration_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_body_acceleration_jerk_XYZ and time_body_gyroscopic_jerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time_body_acceleration_magnitude, time_gravity_acceleration_magnitude, time_body_acceleration_jerk_magnitude, time_body_gyroscopic_magnitude, and time_body_gyroscopic_jerk_magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency_body_acceleration_XYZ, frequency_body_acceleration_jerk_XYZ, frequency_body_gyroscopic_XYZ, frequency_body_acceleration_jerk_magnitude, frequency_body_gyroscopic_magnitude, frequency_body_gyroscopic_jerk_magnitude. (Note the 'frequency' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* time_body_acceleration_XYZ
* time_gravity_acceleration_XYZ
* time_body_acceleration_jerk_XYZ
* time_body_gyroscopic_XYZ
* time_body_gyroscopic_jerk_XYZ
* time_body_acceleration_magnitude
* time_gravity_acceleration_magnitude
* time_body_acceleration_jerk_magnitude
* time_body_gyroscopic_magnitude
* time_body_gyroscopic_jerk_magnitude

* frequency_body_acceleration_XYZ
* frequency_body_acceleration_jerk_XYZ
* frequency_body_gyroscopic_XYZ
* frequency_body_acceleration_magnitude
* frequency_body_acceleration_jerk_magnitude
* frequency_body_gyroscopic_magnitude
* frequency_body_gyroscopic_jerk_magnitude

The set of variables that were estimated from these signals are: 

* _mean: Mean value
* _std_dev: Standard deviation

Notes: 
------
- Features are normalized and bounded within [-1,1].

### Feature Selection for the Summary Data ('summary_data_dss_gcd3.csv)
The summary data file averages each available feature, within each subject-activity type pairing.

No NAs were found, and had any been found, they would have been ignored.