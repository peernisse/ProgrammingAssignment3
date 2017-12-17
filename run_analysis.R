library(stringr)
library(data.table)
library(tidyverse)


#GET DATA--------------------------------
#Download and unzip the data (just once)
# fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl,destfile = "rawData.zip")
# unzip("rawData.zip")


#CREATE PRIMARY DATASET-------------------------------

#Understand what files are present and get paths
files<-list.files("./UCI HAR Dataset",recursive = TRUE, full.names = TRUE)
testFiles<-files[grepl("test",files)]
trainFiles<-files[grepl("train",files)]
#Read in data
testSubj<-read.table("./UCI HAR Dataset/test/subject_test.txt")
trainSubj<-read.table("./UCI HAR Dataset/train/subject_train.txt")

xTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
activitiesTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")

xTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
activitiesTest<-read.table("./UCI HAR Dataset/test/y_test.txt")

activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

#Name data columns from features table
names(xTest)<-features$V2
names(xTrain)<-features$V2

#Categorize and merge the activities
#Merge ids to activity names
testActivities<-merge(activitiesTest,activities,by="V1")
names(testActivities)<-c("activityID","activity")
#testActivities$modelGroup<-"Test" #add category column

trainActivities<-merge(activitiesTrain,activities,by="V1")
names(trainActivities)<-c("activityID","activity")

#Add the activities to the data
xTest<-cbind(testActivities,xTest)
xTrain<-cbind(trainActivities,xTrain)

#cleanup
rm(activitiesTest,activitiesTrain,testActivities,trainActivities,activities,features)

#Create grouping variable for test and train data
xTest$modelGroup<-"Test"
xTrain$modelGroup<-"Train"

#add descriptive header to the subjects DFs
names(testSubj)<-"subject"
names(trainSubj)<-"subject"

#Add the subject columns to the data
xTest<-cbind(testSubj,xTest)
xTrain<-cbind(trainSubj,xTrain)

#Combine test abd train data
modelData<-rbind(xTest,xTrain)

#Reorder columns
modelData<-modelData[,c(565,1,3,4:564)]

#Limit to mean and std
cols<-names(modelData)
root<-cols[1:4]
colsMean<-cols[grepl("mean()",cols)]
colsStd<-cols[grepl("std()",cols)]
filtCols<-c(root,colsMean,colsStd)
filtCols<-filtCols[!grepl("meanFreq",filtCols)]#get rid of hangover meanFreq() columns

#Subset columns of data based on the reduced column list
modelDatanew<-modelData[,filtCols]

#cleanup
rm(testSubj,trainSubj,xTest,xTrain,cols,colsMean,colsStd,filtCols,root,files,testFiles,trainFiles)

#Create summary dataset---------------------------------
#Gather the data to long format
modelDataLong<-gather(modelDatanew,Parameter, Value,4:70)

#Use dcast to make a pivot table with averages for each variable
modelSumm<-dcast(modelDataLong,subject+activity ~ Parameter,fun=mean,value.var="Value") %>% 
        arrange(subject,activity)

#Make the column names better
names<-names(modelSumm)
names<-paste("Average of",names)
names<-names[3:69]
names(modelSumm)<-c("Subject","Activity",names)

#Write table, not sure if this required for the assignment
write.table(modelSumm,"tidyModelDataSummary.txt",row.names = FALSE)



