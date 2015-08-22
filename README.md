# Coursera.Getting.and.Cleaning.Data-Course-Project
This script does the following:

1. Merges the training and the test sets to create one data set: The experiment dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data, so, in this step we merge both data resulting in the original dataset.

2. Extracts only the measurements on the mean and standard deviation for each measurement: The signals captured in the experiment were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions: 
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
Then some parameters, like mean, standart deviation, max, min, etc were calculated. The script captures the mean and standart deviation from this variables.

3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names: each activity has a number associated. The script assigns to each number from the table the respective activity.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
