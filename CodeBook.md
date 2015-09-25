# Code book for Cleaning and Summarization of Smartphone Activity Data

The data set given in result.txt shows summaries of data created from the input data of "Human Activity Recognition Using Smartphones Data Set" which can be obtained at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . The data file used is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The idea behind it in simple words is to conclude from smartphone sensor data (like acceleration sensor and gyroscope) to human activities like walking, sitting, sleeping etc.

The data in the original set was organized into different files with feature values (observations), separate file giving the subject and another file giving the resulted action. Because the data was intended to be used for machine learning, the subjects were split into 2 groups for training and testing purposes. All of this data is taken by the given analysis script and is transformed into 1 data set. This intermediate data set contains for every observation all mean and std deviation features (86) from the original data, but not the other features. It contains additionally the activity the person was doing as well as the subject (the person).
From this detailed intermediate data set, the script groups all the data by activity and subject and gives for every group the mean of every of the contained features. This is shown in result.txt

### Columns in the result data set
