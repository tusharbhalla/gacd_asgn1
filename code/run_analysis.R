
## Load necessary packages
require(data.table)


## Read original data
subject_test = read.table(file="./data/subject_test.txt", header=FALSE, sep = " ")

subject_train = read.table(file="./data/subject_train.txt", header=FALSE, sep = " ")

X_train = read.table(file="./data/X_train.txt", header=FALSE)

y_train = read.table(file="./data/y_train.txt", header=FALSE)

X_test = read.table(file="./data/X_test.txt", header=FALSE)

y_test = read.table(file="./data/y_test.txt", header=FALSE)

activity_labels = read.table(file="./data/activity_labels.txt", header=FALSE)

features = read.table(file="./data/features.txt",header=FALSE)


## Convert data-frames into data tables
sub_train_dt = data.table(subject_train)
sub_test_dt = data.table(subject_test)
X_train_dt = data.table(X_train)
X_test_dt = data.table(X_test)
y_train_dt = data.table(y_train)
y_test_dt = data.table(y_test)
features_dt = data.table(features)

### Section - 1
## Describe activity labels
act_lab = as.character(activity_labels$V2)
y_train_dt$V1 = as.factor(y_train_dt$V1)
y_test_dt$V1 = as.factor(y_test_dt$V1)
levels(y_train_dt$V1) = act_lab   ##Q3 - Answer
levels(y_test_dt$V1) = act_lab    ##Q3 - Answer

### Section - 2
## Merge Test and train columnwise
train_dt = cbind(sub_train_dt, X_train_dt, y_train_dt)
test_dt = cbind(sub_test_dt, X_test_dt, y_test_dt)

## Merge Test and Train together row wise
base_1_dt = rbind(train_dt, test_dt)    ##Q1 - Answer

### Section - 3
## Identify indexes with mean and std from features_dt
features_dt[,is_mean_std:=grepl("mean\\(\\)|std\\(\\)", V2)]
mean_std_idx = which(features_dt$is_mean_std)

## Subset columns of X_train_dt and X_test_dt based on the idx
X_train_sub = X_train_dt[,mean_std_idx, with=FALSE]
X_test_sub = X_test_dt[,mean_std_idx, with=FALSE]

## Retrieve feature names based on idx
feat_names = as.character(features_dt[mean_std_idx, V2, which=FALSE])


## Assign relevant column names
names(X_train_sub) = as.character(feat_names)  #Q4 - Answer
names(X_test_sub) = as.character(feat_names)   #Q4 - Answer

## Merge Test and train 
train_dt_sub = cbind(sub_train_dt, X_train_sub, y_train_dt)
test_dt_sub = cbind(sub_test_dt, X_test_sub, y_test_dt)

## Create combines data for train and test
base_2_dt = rbind(train_dt_sub, test_dt_sub)    ##Q2 - Answer
names(base_2_dt)[1] = "Subject_id" ##Q4 - Answer
names(base_2_dt)[length(names(base_2_dt))] = "Activity" ##Q4 - Answer

#   Section 4 -
## Find mean for each column based on subject and activity
base_3_dt = base_2_dt[, lapply(.SD, mean), by=list(Subject_id, Activity)]  

## Write the data frame to a disk
write.table(base_3_dt, file="./output/tidy_output.txt", sep=" ")  ##Q5 - Answer