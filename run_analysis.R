##Script for Assignment Project, Getting and Cleaning Data:Week3, Coursera
#Reading necessary labels and variable names
al <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#Reading Test dataset
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="Activities") # 2947 rows
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="Subjects")  # 2947 rows          
x_test <- read.table("UCI HAR Dataset/test/x_test.txt") #561 columns 2947 rows
colnames(x_test) <- features[,2]
test <- cbind(sub_test,y_test,x_test)

#Reading Train dataset
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="Activities")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="Subjects")            
x_train <- read.table("UCI HAR Dataset/train/x_train.txt") 
colnames(x_train) <- features[,2]
train <- cbind(sub_train,y_train,x_train)

##1.  Merges the training and the test sets 
merged <- rbind(test,train)

##2.  Extracts only the measurements on the mean and standard deviation 
#for each measurement. Results in merged2
sel_col <- sort(c(grep("mean",colnames(merged)), grep("std",colnames(merged))))
merged2 <- merged[,c(1,2,sel_col)]

##3.  Uses descriptive activity names to name the activities in the data set
#Making factor variables for Activities
merged2$Activities <- as.factor(merged2$Activities)
levels(merged2$Activities) <- al[,2]
#merged2$Subjects <- as.factor(merged2$Subjects)

##4.  Appropriately labels the data set with descriptive variable names
colnames(merged2)[3:42] <- sub("t","Time signal for ",colnames(merged2)[3:42])
colnames(merged2)[43:81] <- sub("f","Frequency signal for ",colnames(merged2)[43:81])
colnames(merged2)[3:72] <- sub("Body","Body ",colnames(merged2)[3:72])
colnames(merged2)[73:81] <- sub("BodyBody","Body ",colnames(merged2)[73:81])
colnames(merged2)[3:81] <- sub("Acc","Acceleration ",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("Gravity","Gravity ",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("Gyro","Gyroscopy ",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("Mag","Magnitude ",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("Jerk","Jerk ",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("-mean\\()","Mean",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("-std\\()","SD",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("-meanFreq\\()","Mean Frequency",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("-X"," on X-axis",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("-Y"," on Y-axis",colnames(merged2)[3:81])
colnames(merged2)[3:81] <- sub("-Z"," on Z-axis",colnames(merged2)[3:81])

library(reshape2)

##5.  Creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject. 
merged2c <- colnames(merged2)
merged2melt <- melt(merged2, id=c("Subjects","Activities"), measure.vars=merged2c[3:81])
#Calculating Average measurement per subject per activity
HAR_clean <- dcast(merged2melt, Subjects + Activities ~ variable, mean)

#Writing the files to upload to coursera assignment
write.table(HAR_clean,"HAR_clean.txt",row.names=FALSE)



