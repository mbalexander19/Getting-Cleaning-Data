#1. load libraries
library(reshape2)

#2. get data
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

if(!file.exists('./dlData')){
  dir.create('./dlData')
  download.file(url = fileUrl, destfile = './dlData/dlData.zip')
}

if(!file.exists('./extractedData')){
  dir.create('./extractedData')
  unzip('./dlData/dlData.zip', exdir = './extractedData')
}

#3. import data

#a. import test data
x_test <- read.table('./extractedData/UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./extractedData/UCI HAR Dataset/test/Y_test.txt')
subj_test <- read.table('./extractedData/UCI HAR Dataset/test/subject_test.txt')

#b. import train data
x_train <- read.table('./extractedData/UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./extractedData/UCI HAR Dataset/train/Y_train.txt')
subj_train <- read.table('./extractedData/UCI HAR Dataset/train/subject_train.txt')

#c. import labels
features <- read.table('./extractedData/UCI HAR Dataset/features.txt')
act_labels <- read.table('./extractedData/UCI HAR Dataset/activity_labels.txt')

#4. merge train and test data
x_merged <- rbind(x_test, x_train)
y_merged <- rbind(y_test, y_train)
subj_merged <- rbind(subj_test, subj_train)


#5. find mean and std columns
mean_std_columns <- grep("-(mean|std)", features[,2])
mean_std_column_names <- features[mean_std_columns, 2]

#6. use descriptive names
mean_std_column_names <- gsub('-mean', 'Mean', mean_std_column_names)
mean_std_column_names <- gsub('-std', 'StDev', mean_std_column_names)
mean_std_column_names <- gsub('\\(\\)', '', mean_std_column_names)
mean_std_column_names <- gsub('\\-', '', mean_std_column_names)

#7. filter data to only include means and stdev columns
x_merged <- x_merged[,mean_std_columns]

#8. merge all data into single table and label columns
merged_data <- cbind(subj_merged, y_merged, x_merged)
colnames(merged_data) <- c('Subject', 'Activity', mean_std_column_names)

#9. split on subject and activity factors
merged_data$Subject <- as.factor(merged_data$Subject)
merged_data$Activity <- factor(merged_data$Activity, levels = act_labels[,1], labels = act_labels[,2])

#10. tidy data
molten_data <- melt(merged_data, id = c('Subject', 'Activity'))
tidy_data <- dcast(molten_data, Subject + Activity ~ variable, mean)

#11. write to file
write.table(tidy_data, file = './tidy_data.txt', row.names = FALSE)
