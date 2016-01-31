# run_analysis.R CodeBook

This is a run_analysis.R codebook and it describes the variables, the data and any transformations or work that is performed to clean up the data.

# data source
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy Ssmartphone. 
A full description is available at the site where the data was obtained:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

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
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units '    g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for t    he Y and Z axis.
 - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
 - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are     radians/second.

# The Code Details

1. Reads test and train sets data, subject(identifier) data, and activity label data from the following file

    "./UCIHARDataset/test/X_test.txt"
    "./UCIHARDataset/test/subject_test.txt"
    "./UCIHARDataset/test/y_test.txt"

    "./UCIHARDataset/train/X_train.txt"
    "./UCIHARDataset/train/subject_train.txt"
    "./UCIHARDataset/train/y_train.txt"

2. Assigns column names subjectId test and activity id for test and training data

3. Reads second column of features.txt from the following file i.e. column names for all test and train set data
   
    "./UCIHARDataset/features.txt"

4. Reads activity lables from the following file to get the activity
    "./UCIHARDataset/activity_labels.txt"
    
5. Append subject and activity and set the column names subjectId and activityId for both test and training data

6. Creates one single data merging test and train data

7. Find mean() or std() column positions from features and create data sets with only those columns keeping activity and subject.

8. Replace activity id by activity label form the activity_lables.txt

9. Create tidy_data set with the average of each variable for each activity and each subject

10. Writes data into a file ./UCIHARDataset/ucihardataset_identifier_avg_tidy_data.txt with row.names=FALSE


**Final tidy data looks like this**

 > subjectId       activityLabel tBodyAcc-mean()-X tBodyAcc-mean()-Y  .... ......  .....   ......
 >   (int)              (fctr)             (dbl)             (dbl)
      
 >   1         1              LAYING         0.2215982      -0.040513953
 >   2         1             SITTING         0.2612376      -0.001308288
 >   3         1            STANDING         0.2789176      -0.016137590
 >   4         1             WALKING         0.2773308      -0.017383819
 >   5         1  WALKING_DOWNSTAIRS         0.2891883      -0.009918505
 >   6         1    WALKING_UPSTAIRS         0.2554617      -0.023953149


#Structure of tidy_data

Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame': 180 obs. of  68 variables:
 $ subjectId                  : int  1 1 1 1 1 1 2 2 2 2 ...
 $ activityLabel              : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ xxxx-mean()-X          : num  0.222 0.261 0.279 0.277 0.289 ...
 $ xxxxt-std()-X           : num  -0.928 -0.977 -0.996 -0.284 0.03 ...

Note: All mean and std columns are num

# Program Execution
  Read README.MD 

#Data License:
 Use of this dataset in publications must be acknowledged by referencing the following publication [1]

 [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
