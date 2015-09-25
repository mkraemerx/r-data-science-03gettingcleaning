# Code book for Cleaning and Summarization of Smartphone Activity Data

The data set given in result.txt shows summaries of data created from the input data of "Human Activity Recognition Using Smartphones Data Set" which can be obtained at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . The data file used is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The idea behind it in simple words is to conclude from smartphone sensor data (like acceleration sensor and gyroscope) to human activities like walking, sitting, sleeping etc.

The data in the original set was organized into 3 different files with a) feature values (observations) of more than 500 distinct features b) the subject observed and c) the resulted action. Because the data was intended to be used for machine learning, the subjects were split into 2 groups for training and testing purposes, each having the three-file-structure on it's own. All of this data is taken by the given analysis script and is transformed into 1 "intermediate" data set. This intermediate data set contains for every observation all mean and std deviation features (86) from the original data, but not the other features. It contains additionally the activity the person was doing as well as the subject (the person).
From this detailed intermediate data set, the script groups all the data by activity and subject and gives for every group the mean of every of the contained features. This is shown in result.txt

### Columns in the result data set

The grouping variables
* activity: activity as cleartext (see activity_labels.txt for possible values)
* subject: observed subject, integer ranging 1-30
* act_id: numerical id of activity

Observed feature vectors. XYZ indicates that the vector is a 3 dimensional resulting in 3 variables (as -X -Y and -Z). The * character indicates, that there exist multiple variations of that value. In case of values starting with t there exist mean() and std() values. In case of values starting with f there exist mean(), std() and meanFreq() values. Examples are tBodyAcc-mean()-X and fBodyAcc-meanFreq()-Z.
* tBodyAcc-*-XYZ
* tGravityAcc-*-XYZ
* tBodyAccJerk-*-XYZ
* tBodyGyro-*-XYZ
* tBodyGyroJerk-*-XYZ
* tBodyAccMag-*
* tGravityAccMag-*
* tBodyAccJerkMag-*
* tBodyGyroMag-*
* tBodyGyroJerkMag-*
* fBodyAcc-*-XYZ
* fBodyAccJerk-*-XYZ
* fBodyGyro-*-XYZ
* fBodyAccMag-*
* fBodyAccJerkMag-*
* fBodyGyroMag-*
* fBodyGyroJerkMag-*
All these values are normalized in the range of -1 to 1 and unitless. Since the summarization is done by with mean and standard deviation, there is no change to this.

The angle values are angles between to vectors.
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(XYZ,gravityMean)
The angles are also normalized in the range of -1 to 1 and unitless. 

The complete list of variables of each feature vector is available in 'features.txt' in the original data set.