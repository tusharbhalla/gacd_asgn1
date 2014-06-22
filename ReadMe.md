## Getting and Cleaning Data - Assignment 1

This repository contains all the files required to run the analysis as specified in the Assignment 1

### Directory Structure - 

---- Working Directory
      |_ code
	  |_ data
	  |_ output
	  |_ Codebook.md
	  |_ ReadMe.md
	  


### Directory contents - 	  

1. code directory contains the R code file, run_analysis.R
2. data directory contains all the data files used for the analysis
3. output directory contains the outputs written by the program
4. Working directory contains all above subdirectories and Codebook.md and ReadMe.md files


### How to execute the analysis -

1. Fork the repository - 
2. Make sure working directory is set at the directory such that code, data and output are immediate subdirectories of a working directory
3. Entire analysis can be run by running the run_analysis.R script  	  
4. run_analysis.R reads all the data from data directory, performs the calculations and writes output to output directory


### Analysis Explained - 

1. Script begins with importing the necessary packages (if required)
2. It then reads all the data files that will be useful for analysis later on
3. To benefit from speed and efficiency of data table, script uses data tables for analysis. Hence, all data frames are converted into data tables
4. Section 1 of a script then assigns activity labels as factors to y_train and y_test dataset, this takes care of having descriptive names to activities
5. Section 2 of a script is used to construct one single unified data set, it first combines all the relevant train and test data columnwise. Finally,
   train and test data is combined by rowwise merge
6. Section 3 deals with extracting only mean and standard deviation relevant measures out of a data set. At this point, script also creates another data set
   merging the test and train data columnwise first and then rowwise. Result is similar data set with subset of features compared to that of dataset obtained
   Section 2. Section 3 also contains code to assign descriptive names to a data table column
7. Finally, Section 4 deals with finding a mean of each column by each subject and activity. The resultant data set is then written in the output sub directoty     
   under current working directory