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

The script takes the tidy dataset from step one and uses dplyr and data.table functions to achive the required summary.





