# Course Project - Getting and Cleaning Data

## How the function run_analysis.R works

This function makes use of the data.table package.  If not already installed, the user can install it by typing install.packages("data.table") at the R prompt.

In order to read these values properly, the function assumes that all data is located in a subdirectory called "UCI HAR Dataset" relative to where the file run_analysis.R is stored

The following files/names/contents are expected:

* "UCI HAR Dataset/train/X_train.txt" - being the acceleroometer readings for test subjects
* "UCI HAR Dataset/test/X_test.txt" - being the accelerometer readings for training subjects
* "UCI HAR Dataset/train/subject_train.txt" - ID numbers of subjects in the training set
* "UCI HAR Dataset/test/subject_test.txt" - ID numbers of the subjects in the test set
* "UCI HAR Dataset/train/y_train.txt" - The number indicating which activity was done in training
* "UCI HAR Dataset/test/y_test.txt" - The number indicating which activity was done in test 

This function opens and reads the Training and Test data sets provided by the course.  To each set, it adds (prepends) the number indicating the activity type and the ID number of the subject doing the activity.

Once each set is prepared, it then combines them into one data frame using the rbind() function.

Since the results are only concerned with the mean and standard deviation columns, the first two columns being Subject and Activity followed by the next 6 columns are extracted into the dataframe SubData to work with.

SubData is then given descriptive column names and the activities are changed from a number to a description of the activity.

For calculating the aggregate values (i.e. the average of each column for each activity and each person), the data frame is converted to a data table and the columns Activity and Subject are set as keys to this dataframe.

Calculating the aggregate statistics is then done by using built-in cababilities of data tables.

The final result is then converted back to a data frame and written to the file "run_analysis_results.txt" using the write.table() function as required by the project.

## Code Book of variables 

1. "Activity" is the name of the activity undertaken by subjects
2. "Subject" is the ID number of the subject doing the activity
3. "tBodyAcc_mean_X" is the average of the mean of X values recorded by the accelerometer while the subject was doing this activity.
4. "tBodyAcc_mean_Y" is the average of the mean of Y values recorded by the accelerometer while the subject was doing this activity.
5. "tBodyAcc_mean_Z" is the average of the mean of Z values recorded by the accelerometer while the subject was doing this activity.
6. "tBodyAcc_std_X" is the average of the standard deviation of X values recorded by the accelerometer while the subject was doing this activity.
7. "tBodyAcc_std_Y" is the average of the standard deviation of Y values recorded by the accelerometer while the subject was doing this activity.
8. "tBodyAcc_std_Z" is the average of the standard deviation of Z values recorded by the accelerometer while the subject was doing this activity.

 