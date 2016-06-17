##Code Book
---------
###Raw Data
---------
The Raw data for these data sets were obtained from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html) under the data set [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/index.html)

####Collection
From original project:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

>For each record it is provided:
======================================

>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
>- Triaxial Angular velocity from the gyroscope. 
>- A 561-feature vector with time and frequency domain variables. 
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.

####Signals

From original project:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>tBodyAcc-XYZ
>tGravityAcc-XYZ
>tBodyAccJerk-XYZ
>tBodyGyro-XYZ
>tBodyGyroJerk-XYZ
>tBodyAccMag
>tGravityAccMag
>tBodyAccJerkMag
>tBodyGyroMag
>tBodyGyroJerkMag
>fBodyAcc-XYZ
>fBodyAccJerk-XYZ
>fBodyGyro-XYZ
>fBodyAccMag
>fBodyAccJerkMag
>fBodyGyroMag
>fBodyGyroJerkMag

>The set of variables that were estimated from these signals are: 

>mean(): Mean value
>std(): Standard deviation
>mad(): Median absolute deviation 
>max(): Largest value in array
>min(): Smallest value in array
>sma(): Signal magnitude area
>energy(): Energy measure. Sum of the squares divided by the number of values. 
>iqr(): Interquartile range 
>entropy(): Signal entropy
>arCoeff(): Autorregresion coefficients with Burg order equal to 4
>correlation(): correlation coefficient between two signals
>maxInds(): index of the frequency component with largest magnitude
>meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>skewness(): skewness of the frequency domain signal 
>kurtosis(): kurtosis of the frequency domain signal 
>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>angle(): Angle between to vectors.

>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the >angle() variable:

>gravityMean
>tBodyAccMean
>tBodyAccJerkMean
>tBodyGyroMean
>tBodyGyroJerkMean


###Data Transformation
--------------------------
The raw data was processed using the run_analysis.R script to create both tiday data sets (data_mean_std.csv and avg_by_sub_act.csv).

####Merge training and test raw data sets
1. For both data sets (training and test):
*subject (subject_*.txt) and measurements (x_*.txt) files were merged
*activity IDs (y_*.txt) were added along with their respective activity name (using activity_labels.txt)

2. The new, constructed data tables for training and test were merged

3. Measurement variables were all named (using features.txt)

####Extract Mean and Standard Deviation variables
Only measurements that calculated mean or standard deviation were extracted from the combined data set.

###Clean up the variable names
All variable names (column names) were cleaned up and made to be more descriptive to be easier to read and understand.

###Average of measurements grouped by activity and subject 
A second tidy data set was created , containing the average of each mean and standard deviation measurement for each subject and activity pair (30 subjects and 6 activities amounts to 180 observations). This data set consist of 69 variable/columns:

*subject (The identifier of the subject that performed the activities while wearing the smartphone): an integer 1-30

*activityname (The activity the subject was performing while the measurements were observed): WALKING, WALKING_UPSTAIRS, WALING_DOWNSTAIRS, SITTING, STANDING, LAYING

*activityid (An integer 1-6 also used to identify each activity): WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4, STANDING=5, LAYING=6

*66 variables each with an average for either the mean or standard deviation of a type of measurement 


*TimeDomainBodyAccelerometerMagnitude
*TimeDomainGravityAccelerometerMagnitude
*TimeDomainBodyAccelerometerJerkMagnitude
*TimeDomainBodyGyrometerMagnitude
*TimeDomainBodyGyrometerJerkMagnitude
*FrequencyDomainBodyAccelerometerMagnitude
*FrequencyDomainBodyBodyAccelerometerJerkMagnitude
*FrequencyDomainBodyBodyGyrometerMagnitude
*FrequencyDomainBodyBodyGyrometerJerkMagnitude

With each of these having 3 seperate measurments for each the X, Y, or Z axis
*TimeDomainBodyAccelerometer
*TimeDomainGravityAccelerometer
*TimeDomainBodyAccelerometerJerk
*TimeDomainBodyGyrometer
*TimeDomainBodyGyrometerJerk
*FrequencyDomainBodyAccelerometer
*FrequencyDomainBodyAccelerometerJerk
*FrequencyDomainBodyGyrometer

All names are augmented with Mean or Std(standard deviation) 

###Data sets output to txt files
Both data sets were outputed to txt files
*data_mean_std.txt-tidy data set merged and cleaned up from original raw data set and extracted standard deviation and mean
*avg_by_sub_act.txt- tidy data set that averaged each mean and standard deviation measurement in relation to each subject and activity pair