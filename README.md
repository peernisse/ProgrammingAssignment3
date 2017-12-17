# ProgrammingAssignment3
## Coursera Module 3 Final Assignment

# OBJECTIVES

## Write a script to wrangle the wearable computing model data into a tidy dataset.

*Steps*

   Merge the training and the test sets to create one data set.
   
   Extracts only the measurements on the mean and standard deviation for each measurement.
   
   Uses descriptive activity names to name the activities in the data set
   
   Appropriately labels the data set with descriptive variable names.

*Result*
The script imports the training and test data as well as the information of subjects and activities. It then uses cbind and merge to get all this information into one dataframe.

Then the columns are culled to leave just the mean and standard deviation data fields.

2. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*Steps*

   Group the data by activity and subject. I presumed the test vs. training data was not part of this grouping.
   
   Gather the data into long format where the data variables are in a field call Parameter and the values are in a field called Value
   
   Use dcast to summarize the data with the data variables along the top and the mean value in the data table, grouped by subject and activity.







