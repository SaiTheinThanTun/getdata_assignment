getdata_assignment
==================

A repo for project assignment of Getting and Cleaning Data week 3, Data Scientist track

There are 3 files in this repo: run_analysis.R, CodeBook.md, and creating_codebook.R

##run_analysis.R
This is an R script file that accomplishes the following (in the presence of UCI HAR Dataset in the working directory):
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

After running all the scripts in the file, the following is produced:
1.	HAR_clean.txt (a tidy data set with average values for each activity and each subject, which is uploaded in Coursera assignment page)
2.	merged (a dataframe in R with only the measurements on mean and SD)

##CodeBook.md
This is a code book markdown file for HAR_clean.txt dataset. It lists all the self-explanatory variable names with their respective width, minimum and maximum values.

##creating_codebook.R
This is another script I made to produce the content of CodeBook.md