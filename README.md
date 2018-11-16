# DataGathering
Data Gathering Week 4 Assignment

##R Version and Libraries
R version 3.5.1
stringr version 1.3.1
Hmisc version 4.1.1
dplyr 0.7.7

##Original Data Set
The raw data was collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here is the collected data set for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data set used was created by:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

###Original Data Set Files
Files Included in the source data set

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


##Functions
###run_analysis
        
        
####Performs tasks
#####1.	Checks to see if the original data set is in the working directory, if not it downloads it and unzips it.

#####2.     Uses file.path to format the file paths to work on various systems, then reads in all data from the following files:
        
        - 'features.txt': List of all features.

        - 'activity_labels.txt': Links the class labels with their activity name.

        - 'train/X_train.txt': Training set.

        - 'train/y_train.txt': Training labels.

        - 'test/X_test.txt': Test set.

        - 'test/y_test.txt': Test labels.

        - 'train/subject_train.txt': Each row identifies the subject who 
        performed the activity for each window
        
        - 'test/subject_test.txt': Each row identifies the subject who 
        performed the activity for each window 
        
        
#####3.     Merges the training and the test sets(X_test and X_train) to create one data set.
        Merge all linked datasets(test/train set, test/train label, 
        test/train subject) in the same order.  trainSet and testSet both have 561 columns.
        Merged together, all should have number of rows equal to 10299.
        Then combine the rows to add the features name (the train/test label) to
        the observations( the train/test set).

#####4.	Extracts only the measurements on the mean and standard deviation for each measurement. 
                Using grep, find all feature names with mean or std and use the info 
                to subset the original data and trim our merged data so the only
                column variables left are the ones dealing with mean/std
      
#####5.	Uses descriptive activity names to name the activities in the data set.
                Using activity.txt, put the names to the factor levels. Label the column "Activity" 
                and combine it with the trimmed data set.
#####6.	Appropriately labels the data set with descriptive variable names. 
                Clean up the feature names that we got from the original data set.
                - remove "()" using double escape \\(
                - replace  "(" with "_" when it is followed by data
                - replace ")" with "_" when it is followed by data
                - strip off any "_" at end of line
                - replace "." with "_"
                - replace "," with "_"
                - change "-" to "_"
                - change leading "t" to "TimeDomain_"
                - change leading "f" to "FrequencyDomain_"
                - postpend [XYZ] with "Direction"

#####7.        Add the subject column to the trimmed data and label it "Subject".

#####8.	From the trimmed data in step 7, creates a second, independent tidy data set.
                The new data set will have the average of each variable for each activity 
                and each subject.  The tidy data set is written to a file called tidy_data.txt.
                Group the data set by subject then activity and use summarise to
                find the mean and display it in a readable format.  Write the tidy 
                data set to a file called tidy_data.txt.

####Return value
Returns a tidy data set of class data frame
####Viewing the tidy data set.
To easily view the tidy data set, read the file in again and View it:
td <- read.table(destFile, header=TRUE)
View(td)