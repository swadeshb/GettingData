#The below R script called run_analysis.R does the following.

# If data.table and dplyr library is not available, install using the below command.
# install.packages("data.table")
# install.packages("dplyr")

#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

library(data.table)
library(dplyr)

# Read test sets data

test_set <- read.table("./UCIHARDataset/test/X_test.txt")
test_subject <- read.table("./UCIHARDataset/test/subject_test.txt")
test_label <- read.table("./UCIHARDataset/test/y_test.txt")

# assign column names subject test and activity id for test data

names(test_subject) <- c("subjectId")
names(test_label) <- c("activityId")

# Read training data

train_set <- read.table("./UCIHARDataset/train/X_train.txt")
train_subject <- read.table("./UCIHARDataset/train/subject_train.txt")
train_label <- read.table("./UCIHARDataset/train/y_train.txt")

# assign column names subject test and activity id for training data

names(train_label) <- c("activityId")
names(train_subject) <- c("subjectId")

# Read features.txt i.e. column names for all data in x_test and x_train

features <- read.table("./UCIHARDataset/features.txt")[,2]

# read activity_lables.txt i.e. lookup table for activity

activity_labels <- read.table("./UCIHARDataset/activity_labels.txt")

# Set the column names for x_test , x_train, and activity_labels 

names(test_set) <- features
names(train_set) <- features
names(activity_labels) <- c("activityId","activityLabel")

# Append subject and activity and set the column names subjectId and activityId for both test and training data

test <- cbind(test_label, cbind(test_subject, test_set))

train <- cbind(train_label, cbind(train_subject, train_set))

# merge test and train data

data <- rbind(test, train)

# grep mean() or std() column position from features 

matched_columns <- grep("mean\\(\\)|std\\(\\)", features)

# create new data set with activityId, subjectId and matched columns i.e.mean() or std()

data <- data[,c(1,2,matched_columns+2)]

# append the label from activity_labels
data <- merge(data, activity_labels, by="activityId")

#Remove activity Id column from data frame

data$activityId <- NULL

# create tidy_data set with the average of each variable for each activity and each subject

tidy_data <- data %>%
  group_by(subjectId, activityLabel) %>%
  summarise_each(funs(mean))
  
# write data into a file ./UCIHARDataset/ucihardataset_identifier_avg_tidy_data.txt

write.table(tidy_data, file = "./UCIHARDataset/identifier_avg_tidy_data.txt", row.name=FALSE)
