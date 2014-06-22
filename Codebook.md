## Getting and Cleaning Data - Assignment 1

### Source -

Use following link to obtain the original data -

[Data Source] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip])

### Data Used -

1. The Train and Test data has been used for the analysis
2. X_test, y_test, X_train, y_train datasets. These datasets contain information on various features for an activity and a subject
3. subject_test, subject_train, features, activity_labels. These datasets contain information on subject ids for train and test, features and activities

### Variables - 

#### Guideline for interpreting variables:

1. Variables prefixed with t - Represent Time domain signals
2. Variable prefixed with f - Represent Frequency domain signals
3. Variables suffixed with -XYZ - Represent 3-axial signals in X, Y, Z direction
4. mean - Mean value
5. std - Standard deviation
6. mad - Median absolute deviation 
7. max - Largest value in array
8. min - Smallest value in array
9. sma - Signal magnitude area
10. energy - Energy measure. Sum of the squares divided by the number of values. 
11. iqr - Interquartile range 
12. entropy - Signal entropy
13. arCoeff - Autorregresion coefficients with Burg order equal to 4
14. correlation - correlation coefficient between two signals
15. maxInds - index of the frequency component with largest magnitude
16. meanFreq - Weighted average of the frequency components to obtain a mean frequency
17. skewness - skewness of the frequency domain signal 
18. kurtosis - kurtosis of the frequency domain signal 
19. bandsEnergy - Energy of a frequency interval within the 64 bins of the FFT of each window.
20. angle - Angle between two vectors.

#### Names of variables (Only variables with Mean and Standard Deviation measures are relevant) -

#### Mean relevant variables -

- tBodyAccmeanX 
- tBodyAccmeanY 
- tBodyAccmeanZ 
- tGravityAccmeanX 
- tGravityAccmeanY 
- tGravityAccmeanZ 
- tBodyAccJerkmeanX 
- tBodyAccJerkmeanY 
- tBodyAccJerkmeanZ 
- tBodyGyromeanX 
- tBodyGyromeanY 
- tBodyGyromeanZ 
- tBodyGyroJerkmeanX 
- tBodyGyroJerkmeanY 
- tBodyGyroJerkmeanZ 
- tBodyAccMagmean 
- tGravityAccMagmean 
- tBodyAccJerkMagmean 
- tBodyGyroMagmean 
- tBodyGyroJerkMagmean 
- fBodyAccmeanX 
- fBodyAccmeanY 
- fBodyAccmeanZ 
- fBodyAccmeanFreqX 
- fBodyAccmeanFreqY 
- fBodyAccmeanFreqZ 
- fBodyAccJerkmeanX 
- fBodyAccJerkmeanY 
- fBodyAccJerkmeanZ 
- fBodyAccJerkmeanFreqX 
- fBodyAccJerkmeanFreqY 
- fBodyAccJerkmeanFreqZ 
- fBodyGyromeanX 
- fBodyGyromeanY 
- fBodyGyromeanZ 
- fBodyGyromeanFreqX 
- fBodyGyromeanFreqY 
- fBodyGyromeanFreqZ 
- fBodyAccMagmean 
- fBodyAccMagmeanFreq 
- fBodyBodyAccJerkMagmean 
- fBodyBodyAccJerkMagmeanFreq 
- fBodyBodyGyroMagmean 
- fBodyBodyGyroMagmeanFreq 
- fBodyBodyGyroJerkMagmean 
- fBodyBodyGyroJerkMagmeanFreq 
- angletBodyAccMeangravity 
- angletBodyAccJerkMeangravityMean 
- angletBodyGyroMeangravityMean 
- angletBodyGyroJerkMeangravityMean 
- angleXgravityMean 
- angleYgravityMean 
- angleZgravityMean 

### std relevant Variables -

- tBodyAccstdX 
- tBodyAccstdY 
- tBodyAccstdZ 
- tGravityAccstdX 
- tGravityAccstdY 
- tGravityAccstdZ 
- tBodyAccJerkstdX 
- tBodyAccJerkstdY 
- tBodyAccJerkstdZ 
- tBodyGyrostdX 
- tBodyGyrostdY 
- tBodyGyrostdZ 
- tBodyGyroJerkstdX 
- tBodyGyroJerkstdY 
- tBodyGyroJerkstdZ 
- tBodyAccMagstd 
- tGravityAccMagstd 
- tBodyAccJerkMagstd 
- tBodyGyroMagstd 
- tBodyGyroJerkMagstd 
- fBodyAccstdX 
- fBodyAccstdY 
- fBodyAccstdZ 
- fBodyAccJerkstdX 
- fBodyAccJerkstdY 
- fBodyAccJerkstdZ 
- fBodyGyrostdX 
- fBodyGyrostdY 
- fBodyGyrostdZ 
- fBodyAccMagstd 
- fBodyBodyAccJerkMagstd 
- fBodyBodyGyroMagstd 
- fBodyBodyGyroJerkMagstd


### Transformation - 

1. Data sets specified above are read using read.csv function. Data was downloaded from the source as specified above
2. To get benefited out of efficiency and speed of a data table, all data frames are converted into data table using data.table()
3. To create a single data set for all the data, following steps are performed -
   3.1 Train data set is formed by combining training relevant sets columnwise (i.e. X_train, subject_train, y_train) [yields 7352 By 563 data set]
   3.2 Test data set is formed by combining test relevant sets columnwise (i.e. X_test, subject_test, y_test) [yields 2947 By 563 data set]
   3.3 A single unified data set is formed by combining data sets created in step 3.1 and 3.2 [yields 10299 By 563 data set]
4. To extract only the measurements on mean and standard deviations, script first obtain the indexes of such features from feature vector and then subsets only
   those columns from Train and Test dataset 
5. To assign descriptive activity names, script creates a character vector of activity descriptions and assigns it as a levels to y_train and y_test data 
   sets
6. Feature names are assigned as column headers to a data set created as a result of Step 4 above
7. Finally, second independent tidy data set with the average of each variable by activity and subject has been created and saved to a disk [yields 180 By 68 data set]
8. The data set written in Step 7 above is tidy for following reasons -
   8.1 Each row represents a single observation. That is, observation based on Activity and Subject
   8.2 Each column represents value of a single variable
   8.3 Entire dataset represents a single context (or experimental unit), in this case Human Activity Recognition using Smartphones experiment data set

NOTE: I found last part (Question 5) of the assignment ambiguous. It wasnt much clear to me whether average is to be calculated for ALL features of original
data set or mean and standard deviation relevant features extracted as a part of Step 4 above. Hence, I applied the calculation on subset of data set, that is
data set which has mean and standard deviation relevant features. Essentially, the commands used will stay same in either cases. Only thing that would change is 
number of selected columns.