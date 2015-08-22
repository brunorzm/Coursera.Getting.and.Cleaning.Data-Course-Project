#loading all the variables that are necessary:

setwd("C:/Cursos/Data Specialization/Getting and Cleanning Data/Course Project/UCI HAR Dataset")
activity_labels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")
##from the test data
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
##From the training data
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# x_train/test contains all the mass of data from the measurements
# y_train/test contains the sequence of activities
# subject_train/test contains the sequence of subjects associated with x and y



#merge lists of subjects (train and test)
subj <- rbind(subject_test,subject_train)

#merge mass of data (train and test)
dados <- rbind(x_test,x_train)

#merge lists of activities
atividades <- rbind(y_test, y_train)



#here we will find the values in the 'features' data that contains the words 'mean' or 'std in its the second column 
#then, the position of found words will be returned. 'colofinterest' is a vector that will be setted with these positions
colofinterest <- grep(".*mean.*|.*std.*", features[,2])
#We can use these positions to subset the mass of data. So, we have only the mass of data associated with the columns above 
dataofinterest <- dados[,colofinterest]

#Above, we used positions (numbers) to subset the columns that we want
#Here we will use these positions to set names to the columns using the text in the features data 
names(dataofinterest) <- features[colofinterest,2] #assigning the names
names(dataofinterest) <- gsub("-mean", "Mean", names(dataofinterest)) #find and replace
names(dataofinterest) <- gsub("-std", "Std", names(dataofinterest)) #find and replace
names(dataofinterest) <- gsub('[-()]', '', names(dataofinterest)) #find and replace

#merge subjects, actvities and data of interest
dataok <- cbind(subj, atividades, dataofinterest)
names(dataok)[1:2] <- c("Subject", "Activity") #assign names to the first two columns

#Assign the labels to the activities
dataok$Activity <- factor(dataok$Activity, levels = activity_labels[,1], labels = activity_labels[,2])
#turns subject as factors
dataok$Subject <- as.factor(dataok$Subject)


library(plyr)
#here we are creating a data set with the mean for each subject and each activity
finaldata <- ddply(dataok, .(Subject, Activity), function(x) colMeans(x[,3:81]))
#write the final data.
write.table(finaldata, "tidydataset.txt", row.name = FALSE)
