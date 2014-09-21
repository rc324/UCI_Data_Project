###Getting and Cleaning Data Project Code Book.
The UCI_TidyData.txt file contains the Tidy data set for UCI HAR experiment. The data set has 180 rows and 68 columns (variables) seperated by space. Each row corresponds to a unique subject and activity
####Variable descriptions
* Column 1 is the Subject variable which is a numeric that has a range of 1 to 30 and represents the 30 subjects which were part of the experiement
* Column 2 is activity which is a descirptive character variable which represents the activity performed by the subjects. There are 6 types of activities
* Column 3-68 are numerics and represent the avearge of all the measured mean and std deviations of the feature variables for each activity and subject. The feature varialbes are listed as follows.


tBodyAcc-XYZ<br>
tGravityAcc-XYZ<br>
tBodyAccJerk-XYZ<br>
tBodyGyro-XYZ<br>
tBodyGyroJerk-XYZ<br>
tBodyAccMag<br>
tGravityAccMag<br>
tBodyAccJerkMag<br>
tBodyGyroMag<br>
tBodyGyroJerkMag<br>
fBodyAcc-XYZ<br>
fBodyAccJerk-XYZ<br>
fBodyGyro-XYZ<br>
fBodyAccMag<br>
fBodyAccJerkMag<br>
fBodyGyroMag<br>
fBodyGyroJerkMag<br>
 
 The X,Y or Z are used to denote the axial signals in the X, Y an Z directions. The t prefix is for time domain signals and f is for frequency domain. 
