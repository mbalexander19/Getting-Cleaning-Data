---
title: "Codebook"
author: "mbalexander19"
date: "4/4/2021"
output: html_document
---

## Data Modification

This analysis uses the Human Activity Recognition Using Smartphones Dataset. The data comes from a static version used for Coursera, available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

In the process of analysis, I performed the following steps to modify the data:

* Merged each of X, Y (activity descriptor), and Subject data for the test and training into three tables (one for each type of data).
* Extracted only the columns measuring a mean or standard deviation.
* Changed the column names to remove punctuation.
* Merged the X (means and standard deviations only), Y (activity), and Subject tables into a single dataframe.
* Using the reshape2 library, melted the dataset and recast to take the mean of each measurement for each combination of subject and activity.

## Descriptions

### Identifiers
The Subject and Activity columns (1 and 2) are identifiers.

* Subject: An arbitrary numerical identification number unique to each study participant. There are 30 total subjects.
* Activity: A description of the activity measured. There are 6 total activities:
  + Walking
  + Walking Up Stairs
  + Walking Down Stairs
  + Sitting
  + Standing
  + Laying
  
### Measurements

The measurements used are the means and standard deviations of the raw data (not used directly in this analysis). The measurements used are:

* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStDevX
* tBodyAccStDevY
* tBodyAccStDevZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStDevX
* tGravityAccStDevY
* tGravityAccStDevZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStDevX
* tBodyAccJerkStDevY
* tBodyAccJerkStDevZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStDevX
* tBodyGyroStDevY
* tBodyGyroStDevZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStDevX
* tBodyGyroJerkStDevY
* tBodyGyroJerkStDevZ
* tBodyAccMagMean
* tBodyAccMagStDev
* tGravityAccMagMean
* tGravityAccMagStDev
* tBodyAccJerkMagMean
* tBodyAccJerkMagStDev
* tBodyGyroMagMean
* tBodyGyroMagStDev
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStDev
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStDevX
* fBodyAccStDevY
* fBodyAccStDevZ
* fBodyAccMeanFreqX
* fBodyAccMeanFreqY
* fBodyAccMeanFreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStDevX
* fBodyAccJerkStDevY
* fBodyAccJerkStDevZ
* fBodyAccJerkMeanFreqX
* fBodyAccJerkMeanFreqY
* fBodyAccJerkMeanFreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStDevX
* fBodyGyroStDevY
* fBodyGyroStDevZ
* fBodyGyroMeanFreqX
* fBodyGyroMeanFreqY
* fBodyGyroMeanFreqZ
* fBodyAccMagMean
* fBodyAccMagStDev
* fBodyAccMagMeanFreq
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStDev
* fBodyBodyAccJerkMagMeanFreq
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStDev
* fBodyBodyGyroMagMeanFreq
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStDev
* fBodyBodyGyroJerkMagMeanFreq