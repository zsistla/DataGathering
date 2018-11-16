---

title: "Tidy Data Set Codebook"

author: "Amber Sistla"

date: "November 16, 2018"

output:

  html_document:

    keep_md: yes

---



## Project Description

This purpose of this project was to subset Samsung data collected from the accelerometers 
from the Samsung Galaxy S smartphone. A full description is available at the 
site where the data was originally obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data obtained for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The features selected for this tidy_data.txt database are all the 
mean and standard deviation features from the original data set that are then
grouped by subject and activity and averaged.


##Study design and data processing



###Collection of the raw data

The raw data was collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here is the collected data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####Files Included in the source data set

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

####Acknowledgement of source data

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

##Creating the tidy datafile
The units given are g's for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

###Guide to create/clean the tidy data file

1.	If the data does not already exist in the working directory, download the data.
2.	Merge the training and the test sets from to create one data set.
3.	Extract only the measurements on the mean and standard deviation for each measurement. 
4.	Use descriptive activity names to name the activities in the data set
5.	Appropriately label the data set with descriptive variable names. 
6.	From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  This is written to a file called tidyData.txt.  

Return value: returns a tidy data set of class data frame
To easily view the tidy data set, read the file in again and View it:
td <- read.table(destFile, header=TRUE)
View(td)

For more details, see the README.md file.


##Description of the variables in the tiny_data.txt file

The tidy data set containes 180 observations with 88 features each.

###Naming schema

These variables come from the accelerometer original data set gyroscope 3-axial 
raw signals TimeDomain_Acc_XYZDirection and TimeDomain_Gyro_XYZDirection. 
These time domain signals (prefix 'TimeDomain_' to denote time) were captured 
at a constant rate of 50 Hz. Then they were  filtered using a median filter 
and a 3rd order low pass Butterworth filter  with a corner frequency of 20 Hz 
to remove noise. Similarly, the acceleration signal was then separated into 
body and gravity acceleration signals (TimeDomain_BodyAcc_XYZ and 
TimeDomain_GravityAcc_XYZ) using another low pass Butterworth filter 
with a corner frequency 
of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (TimeDomain_BodyAccJerk_XYZDirection and 
TimeDomain_BodyGyroJerk_XYZDirection). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (TimeDomain_BodyAccMag, 
TimeDomain_GravityAccMag, TimeDomain_BodyAccJerkMag, 
TimeDomain_BodyGyroMag, TimeDomain_BodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing FrequencyDomain_BodyAcc_XYZDirection, FrequencyDomain_BodyAccJerk_XYZDirection, 
FrequencyDomain_BodyGyro_XYZDirection, FrequencyDomain_BodyAccJerkMag, 
FrequencyDomain_BodyGyroMag, FrequencyDomain_BodyGyroJerkMag. 
(Note the 'FrequencyDomain_' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZDirection' is used to denote 3-axial signals in the X, Y and Z directions.

The tidy data set gathered all the mean and standard deviation of variables that were 
estimated from these signals in the original dataset: 

Additionally, the tidy data set also used the original data set vectors that
were obtained by averaging the signals in a signal window 
sample. These are used on the angle() variable:

gravityMean
TimeDomain_BodyAccMean
TimeDomain_BodyAccJerkMean
TimeDomain_BodyGyroMean
TimeDomain_BodyGyroJerkMean

More information can be found in the source data readme.txt, features_info.txt,
and the original source data homepage: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Full List of Variables

| VARIABLE# | VARIABLE NAME                                   | VARIABLE CLASS                                                                                                                                               | UNIT OF   MEASUREMENT | NOTES                                                                                                            |
|-----------|-------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|------------------------------------------------------------------------------------------------------------------|
| 1         | Subject                                         |  int                                                                                                                                                         | NONE                  | Each row identifies   the subject who performed the activity for each window sample. Its range is   from 1 to 30 |
| 2         | Activity                                        |  Factor w/ 6 levels "LAYING"             "SITTING"            "STANDING"           "WALKING"              "WALKING_DOWNSTAIRS"            "WALKING_UPSTAIRS" | NONE                  | Indicates the   activity the subject was doing                                                                   |
| 3         | TimeDomain_BodyAcc_mean_XDirection              |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 4         | TimeDomain_BodyAcc_mean_YDirection              |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 5         | TimeDomain_BodyAcc_mean_ZDirection              |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 6         | TimeDomain_BodyAcc_std_XDirection               |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 7         | TimeDomain_BodyAcc_std_YDirection               |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 8         | TimeDomain_BodyAcc_std_ZDirection               |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 9         | TimeDomain_GravityAcc_mean_XDirection           |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 10        | TimeDomain_GravityAcc_mean_YDirection           |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 11        | TimeDomain_GravityAcc_mean_ZDirection           |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 12        | TimeDomain_GravityAcc_std_XDirection            |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 13        | TimeDomain_GravityAcc_std_YDirection            |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 14        | TimeDomain_GravityAcc_std_ZDirection            |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 15        | TimeDomain_BodyAccJerk_mean_XDirection          |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 16        | TimeDomain_BodyAccJerk_mean_YDirection          |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 17        | TimeDomain_BodyAccJerk_mean_ZDirection          |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 18        | TimeDomain_BodyAccJerk_std_XDirection           |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 19        | TimeDomain_BodyAccJerk_std_YDirection           |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 20        | TimeDomain_BodyAccJerk_std_ZDirection           |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 21        | TimeDomain_BodyGyro_mean_XDirection             |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 22        | TimeDomain_BodyGyro_mean_YDirection             |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 23        | TimeDomain_BodyGyro_mean_ZDirection             |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 24        | TimeDomain_BodyGyro_std_XDirection              |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 25        | TimeDomain_BodyGyro_std_YDirection              |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 26        | TimeDomain_BodyGyro_std_ZDirection              |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 27        | TimeDomain_BodyGyroJerk_mean_XDirection         |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 28        | TimeDomain_BodyGyroJerk_mean_YDirection         |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 29        | TimeDomain_BodyGyroJerk_mean_ZDirection         |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 30        | TimeDomain_BodyGyroJerk_std_XDirection          |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 31        | TimeDomain_BodyGyroJerk_std_YDirection          |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 32        | TimeDomain_BodyGyroJerk_std_ZDirection          |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 33        | TimeDomain_BodyAccMag_mean                      |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 34        | TimeDomain_BodyAccMag_std                       |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 35        | TimeDomain_GravityAccMag_mean                   |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 36        | TimeDomain_GravityAccMag_std                    |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 37        | TimeDomain_BodyAccJerkMag_mean                  |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 38        | TimeDomain_BodyAccJerkMag_std                   |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 39        | TimeDomain_BodyGyroMag_mean                     |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 40        | TimeDomain_BodyGyroMag_std                      |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 41        | TimeDomain_BodyGyroJerkMag_mean                 |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 42        | TimeDomain_BodyGyroJerkMag_std                  |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 43        | FrequencyDomain_BodyAcc_mean_XDirection         |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 44        | FrequencyDomain_BodyAcc_mean_YDirection         |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 45        | FrequencyDomain_BodyAcc_mean_ZDirection         |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 46        | FrequencyDomain_BodyAcc_std_XDirection          |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 47        | FrequencyDomain_BodyAcc_std_YDirection          |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 48        | FrequencyDomain_BodyAcc_std_ZDirection          |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 49        | FrequencyDomain_BodyAcc_meanFreq_XDirection     |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 50        | FrequencyDomain_BodyAcc_meanFreq_YDirection     |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 51        | FrequencyDomain_BodyAcc_meanFreq_ZDirection     |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 52        | FrequencyDomain_BodyAccJerk_mean_XDirection     |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 53        | FrequencyDomain_BodyAccJerk_mean_YDirection     |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 54        | FrequencyDomain_BodyAccJerk_mean_ZDirection     |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 55        | FrequencyDomain_BodyAccJerk_std_XDirection      |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 56        | FrequencyDomain_BodyAccJerk_std_YDirection      |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 57        | FrequencyDomain_BodyAccJerk_std_ZDirection      |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 58        | FrequencyDomain_BodyAccJerk_meanFreq_XDirection |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 59        | FrequencyDomain_BodyAccJerk_meanFreq_YDirection |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 60        | FrequencyDomain_BodyAccJerk_meanFreq_ZDirection |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 61        | FrequencyDomain_BodyGyro_mean_XDirection        |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 62        | FrequencyDomain_BodyGyro_mean_YDirection        |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 63        | FrequencyDomain_BodyGyro_mean_ZDirection        |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 64        | FrequencyDomain_BodyGyro_std_XDirection         |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 65        | FrequencyDomain_BodyGyro_std_YDirection         |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 66        | FrequencyDomain_BodyGyro_std_ZDirection         |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 67        | FrequencyDomain_BodyGyro_meanFreq_XDirection    |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 68        | FrequencyDomain_BodyGyro_meanFreq_YDirection    |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 69        | FrequencyDomain_BodyGyro_meanFreq_ZDirection    |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 70        | FrequencyDomain_BodyAccMag_mean                 |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 71        | FrequencyDomain_BodyAccMag_std                  |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 72        | FrequencyDomain_BodyAccMag_meanFreq             |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 73        | FrequencyDomain_BodyBodyAccJerkMag_mean         |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 74        | FrequencyDomain_BodyBodyAccJerkMag_std          |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 75        | FrequencyDomain_BodyBodyAccJerkMag_meanFreq     |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 76        | FrequencyDomain_BodyBodyGyroMag_mean            |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 77        | FrequencyDomain_BodyBodyGyroMag_std             |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 78        | FrequencyDomain_BodyBodyGyroMag_meanFreq        |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 79        | FrequencyDomain_BodyBodyGyroJerkMag_mean        |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 80        | FrequencyDomain_BodyBodyGyroJerkMag_std         |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 81        | FrequencyDomain_BodyBodyGyroJerkMag_meanFreq    |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 82        | angle_TimeDomain_BodyAccMean_gravity            |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 83        | angle_TimeDomain_BodyAccJerkMean__gravityMean   |  num                                                                                                                                                         | G-forces (g)/second   |                                                                                                                  |
| 84        | angle_TimeDomain_BodyGyroMean_gravityMean       |  num                                                                                                                                                         | radians/second        |                                                                                                                  |
| 85        | angle_TimeDomain_BodyGyroJerkMean_gravityMean   |  num                                                                                                                                                         | radians/secondSquared |                                                                                                                  |
| 86        | angle_XDirection_gravityMean                    |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 87        | angle_YDirection_gravityMean                    |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
| 88        | angle_ZDirection_gravityMean                    |  num                                                                                                                                                         | G-forces (g)          |                                                                                                                  |
|           |                                                 |                                                                                                                                                              |                       |                                                                                                                  |
|           |                                                 |                                                                                                                                                              |                       |                                                                                                                  |

##Sources
The raw data was collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here is the collected data set for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
###Acknowledgement
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
