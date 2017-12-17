# ProgrammingAssignment3
### Coursera Module 3 Final Assignment

# OBJECTIVES

1. Write a script to wrangle the wearable computing model data into a tidy dataset.

*Steps*

Ultimtely I did it in this order:

   * **Appropriately labels the data set with descriptive variable names.** This mainly refers to the activities for which I used merge to get the names along the activity id numbers prior to doing cbind.

   * **Uses descriptive activity names to name the activities in the data set.** This was accomplished    iteratively using cbind for the data sets for activities and subjects. I made sure to add a column and heading name to these identifying what they are before the cbind.
   
   * **Merge the training and the test sets to create one data set.** This was accomplished second to last, after getting the rest of the info into the two training and test datasets first, as below. Since all the columns were the same, I used rbind to union the test and training sets.
   
   * **Extracts only the measurements on the mean and standard deviation for each measurement.** For this I pulled the column names into a vector and used grepl to ferret out the ones that had the words mean or std in them. There were some stragglers of "meanFreq()" which I also removed. Then I subset the data based on the modified vector of column names.

*Results*

The script imports the training and test data as well as the information of subjects and activities. It then uses cbind and merge to get all this information into one dataframe.

Then the columns are culled to leave just the mean and standard deviation data fields.

2. From the data set in step 1, create a second, independent tidy data set with the average of each variable for each activity and each subject.

*Steps*

   * **Use Gather the data into long format.** This gets the data where the data variables are in a field called Parameter and the values are in a field called Value

   * **Group the data by activity and subject.** I presumed the test vs. training data was not part of this grouping. This occured as part of the use of dcast. I used dcast to summarize the data with the data variables along the top and the mean value in the data table, grouped by subject and activity.
   
   * **Fix header names.** I wanted to add "Average of" to the header so we would know what we are looking at.

*Results*

The script takes the tidy dataset from step one and uses dplyr and data.table functions to achive the required summary. Each row contains the model data for one subject doing one activity, with the parameters across the top. I think this is better for doing analyses, though I could also use gather again to put the variable and the average values back into long format. Either way can be considered tidy.

The results are stored in the CSV file tidyModelDataSummary.csv

You can read this file into R via:

reviewData<-read.csv("tidyModelDataSummary.csv")

#VARIABLES USED

The final assignment product contains just the mean and standard deviation values for the varibles.

The following variable summary is from the original features_info.txt file:

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.*

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).*

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).* 

*These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

   tBodyAcc-XYZ
   
   tGravityAcc-XYZ
   
   tBodyAccJerk-XYZ
   
   tBodyGyro-XYZ
   
   tBodyGyroJerk-XYZ
   
   tBodyAccMag
   
   tGravityAccMag
   
   tBodyAccJerkMag
   
   tBodyGyroMag
   
   tBodyGyroJerkMag
   
   fBodyAcc-XYZ
   
   fBodyAccJerk-XYZ
   
   fBodyGyro-XYZ
   
   fBodyAccMag
   
   fBodyAccJerkMag
   
   fBodyGyroMag
   
   fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

   gravityMean
   
   tBodyAccMean
   
   tBodyAccJerkMean
   
   tBodyGyroMean
   
   tBodyGyroJerkMean

#REFERENCES

To contact me use peernisse@gmail.com

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.









