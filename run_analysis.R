#STEP 1
#Read in the training  set data
TrainVector<-read.table("train/X_train.txt",header=FALSE, sep = "")
Train_y<-read.table("train/y_train.txt",header=FALSE, sep = "")
Train_subject<-read.table("train/subject_train.txt",header=FALSE, sep = "")

#Combining the various training set data by columns to get the complete training set
Train_set<-cbind(Train_subject,Train_y,TrainVector)

#Read the test data
TestVector<-read.table("test/X_test.txt",header=FALSE, sep = "")
Test_y<-read.table("test/y_test.txt",header=FALSE, sep = "")
Test_subject<-read.table("test/subject_test.txt",header=FALSE, sep = "")

#Combining the various test data by columns to get the complete test set
Test_set<-cbind(Test_subject,Test_y,TestVector)

#Combining both the sets for Step 1.
Combined_set<-rbind(Train_set,Test_set)

###################################################
#STEP 2
#read features file to get all the features variable names
featuresVector<-read.table("features.txt",header=FALSE,as.is=TRUE)

#Select the variables which are means or standard deviation values
MeanStd<-grep("-mean\\(|-std\\(",featuresVector[,2],ignore.case=TRUE)

#Increase MeanStd by 2 since the combined data frame has the subject and activity added in the first two columns
MeanStd<-MeanStd + 2

#select the first two(subject and activity) and the mean and standard columns from the combined set
MeanStdCombinedSet<-Combined_set[,c(1,2,MeanStd)]


##########################################
#STEP 3
#changing activity numbers to descriptive name
activity<-read.table("activity_labels.txt",header=FALSE,as.is=TRUE)
require(plyr)
MeanStdCombinedSet[,2]<-mapvalues(MeanStdCombinedSet[,2],from=activity[,1],to=activity[,2])

#other possibility
#MeanStdCombinedSet[,2]<-sub("1","WALKING",MeanStdCombinedSet[,2])
#MeanStdCombinedSet[,2]<-sub("2","WALKING_UPSTAIRS",MeanStdCombinedSet[,2])
#MeanStdCombinedSet[,2]<-sub("3","WALKING_DOWNSTAIRS",MeanStdCombinedSet[,2])
#....



##################################################
#STEP 4
#Making first 2 column names subject and activity and remaining from the features list. Subtracting 2 from MeanStd because it was incremented by 2 earlier
#to subset columns from the original combined set.
colnames(MeanStdCombinedSet)<-c("Subject","Activity",featuresVector[,2][MeanStd-2])


##########################################################
#Step 5
#Find Unique Combinations of Subject and Activity
SubjectActivityCombos <- unique(MeanStdCombinedSet[,c("Subject","Activity")])

#Create the Tidy Data frame
TidyData<-data.frame(matrix(ncol=ncol(MeanStdCombinedSet),nrow=0))

#For each Combo Subset the data set and then take column means
for (i in 1:nrow(SubjectActivityCombos)){
  temp<-subset(MeanStdCombinedSet,(Subject == SubjectActivityCombos[i,1]) & (Activity == SubjectActivityCombos[i,2]))
  temp_row<-cbind(SubjectActivityCombos[i,1],SubjectActivityCombos[i,2],t(colMeans(temp[,3:ncol(temp)])))
  TidyData<-rbind(TidyData,temp_row)
}
#Set the Column names of the Tidy Data.
colnames(TidyData)<-names(MeanStdCombinedSet)

#Write out the Tidy Data
write.table(TidyData,file="UCI_TidyData.txt",row.names=FALSE)