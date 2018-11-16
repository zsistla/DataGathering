

#
#run_analysis function
#Input parameters : none
# Performs the following operations:
#Setup:  
#       1. reads in all the data
#       2. combines the labels and the data into one table
#Assignment:
# 1.	Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive variable names. 
# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#return value: returns a tidy data set of class data frame


run_analysis <- function () {

        library(Hmisc)
        library(stringr)
        library(dplyr)
        # getRversion()
        # [1] '3.5.1'
        # > packageVersion("stringr")
        # [1] '1.3.1'
        # > packageVersion("Hmisc")
        # [1] '4.1.1'
        # > packageVersion("dplyr")
        # [1] '0.7.7'
        
        dataSetUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        directory <- "UCI HAR Dataset"
        
        # Get file and unzip if it isn't there
        
        if(!file.exists(directory)){
                download.file(dataSetUrl, "tempZip.zip", mode = "wb")
                unzip("tempZip.zip", files = NULL, exdir=".")
                
        }
        
        
        #use file.path to format the file paths to work on various systems
        trainSetPath = file.path("UCI HAR Dataset", "train", "X_train.txt")
        testSetPath = file.path("UCI HAR Dataset", "test", "X_test.txt")
        trainLabelPath = file.path("UCI HAR Dataset", "train", "y_train.txt")
        testLabelPath = file.path("UCI HAR Dataset", "test", "y_test.txt")
        trainSubjectPath = file.path("UCI HAR Dataset", "train", "subject_train.txt")
        testSubjectPath = file.path("UCI HAR Dataset", "test", "subject_test.txt")
        activityPath = file.path("UCI HAR Dataset", "activity_labels.txt")
        featuresInfoPath = file.path("UCI HAR Dataset", "features_info.txt")
        featuresPath = file.path("UCI HAR Dataset", "features.txt")
        
        #read in all the data
        trainSet = read.table(trainSetPath)
        testSet = read.table(testSetPath)
        trainLabel = read.table(trainLabelPath)
        testLabel = read.table(testLabelPath)
        trainSubject = read.table(trainSubjectPath)
        testSubject = read.table(testSubjectPath)
        activity = read.table(activityPath)
        features = read.table(featuresPath)
        
        # 1.	Merges the training and the test sets to create one data set.
        #trainSet and testSet both have 561 columns
        #merge them all linked datasets(test/train set, test/train label, 
        #test/train subject) in the same order.
        #(- A 561-feature vector with time and frequency domain variables. )
        #so combine the rows then add the features name to them all
        mergedData <- rbind(testSet, trainSet)
        colnames(mergedData)<-features[,2]
        mergedLabels <- rbind(testLabel, trainLabel)
        mergedSubject <- rbind(testSubject, trainSubject)
        
               
        # 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
        meanAndStdFeatures <- features[(grep("mean|std",features$V2, ignore.case=TRUE)),]
        meanAndStdFeatures <- (grep("mean|std",features$V2, ignore.case=TRUE))
        #trim our merged data so the only column variables left are the ones dealing with mean/std
        meanAndStdData <- mergedData[, meanAndStdFeatures]
 
        # 3.	Uses descriptive activity names to name the activities in the data set
        mergedLabels <- mutate(mergedLabels, "Activity" = activity[V1,2])
        meanAndStdData <- cbind(mergedLabels$Activity, meanAndStdData)
        #give an appropriate name
        names(meanAndStdData)[1] <- "Activity"
        
        
        # 4.	Appropriately labels the data set with variable names
        #the given variable names from features.txt was already taken care of 
        #added in the merging step with:        
        #colnames(mergedData)<-features[,2]
        #now clean up what is there
        cleanNames <- names(meanAndStdData)
        #remove "()" using double escape \\(
        cleanNames <-gsub("\\(\\)","",cleanNames) #removes all ()
        cleanNames <-gsub("\\(","_",cleanNames) #replaces ( with _ when it is followed by data
        cleanNames <-gsub("\\)","_",cleanNames)#replaces ) with _ when it is followed by data
        cleanNames <-gsub("_$","",cleanNames)# strips off any _ at end of line
        
        #replace "." with "_"
        cleanNames <-gsub("\\.","_",cleanNames)
        #replace "," with "_"
        cleanNames <-gsub(",","_",cleanNames)
        #change "-" to "_"
        cleanNames <-gsub("-","_",cleanNames)
        
        #change leading "t" to "TimeDomain_"
        cleanNames <- gsub("t([A-Z])", "TimeDomain_\\1",cleanNames)
        #change leading "f" to "FrequencyDomain_"
        cleanNames <- gsub("f([A-Z])", "FrequencyDomain_\\1",cleanNames)
        #postpend [XYZ] with "Direction"
        cleanNames <- gsub("([XYZ])", "\\1Direction",cleanNames)
        
        names(meanAndStdData) <- cleanNames
        
        
        # 5.	From the data set in step 4, creates a second, independent tidy 
        #data set with the average of each variable for each activity and each subject.
        
        #add subject info to the merged data set
        #first, give the subject vector a meaningful column name
        names(mergedSubject) <- c("Subject")
        meanAndStdData <- cbind(mergedSubject, meanAndStdData)
        
        groupedData <- group_by(meanAndStdData, Subject, Activity)
        tidyData <- summarise_all(groupedData,"mean")
        write.table( tidyData, "tidy_data.txt", row.name = FALSE)
        tidyData
        
        
}