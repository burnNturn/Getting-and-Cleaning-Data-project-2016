require(plyr)


#Create relative file paths

uci_dir <- "UCI HAR Dataset"
features_file <- file.path(uci_dir, "/features.txt")
activity_labels_file <- file.path(uci_dir, "/activity_labels.txt")

train_x_file <- file.path(uci_dir, "/train/x_train.txt")
train_y_file <- file.path(uci_dir, "/train/y_train.txt")
subject_train_file <- file.path(uci_dir, "train/subject_train.txt")

test_x_file <- file.path(uci_dir, "/test/x_test.txt")
test_y_file <- file.path(uci_dir, "/test/y_test.txt")
subject_test_file <- file.path(uci_dir, "/test/subject_test.txt")

    
# Loads raw data

features <- read.table(features_file, sep = " ", stringsAsFactors = FALSE)
activity_labels <- read.table(activity_labels_file, col.names = c("activityid", "activity"))

train_x <- read.table(train_x_file)
train_y <- read.table(train_y_file)
subject_train <- read.table(subject_train_file)

test_x <- read.table(test_x_file)
test_y <- read.table(test_y_file)
subject_test <- read.table(subject_test_file)
    
# add the subject and activity columns to each set of data

train_activites <- activity_labels[train_y[ ,1], ]
train_df <- data.frame(cbind(subject_train, train_activites, train_x))

test_activites <- activity_labels[test_y[ ,1], ]
test_df <- data.frame(cbind(subject_test, test_activites,  test_x))
    

# Merge the training and test sets into one data set

raw_df <- rbind(train_df, test_df)
names(raw_df) <- c("subject", "activityid", "activityname", features[, 2])



# Extracts the measurements on the mean and std for each measurement

mean_std_df <- raw_df[ , grepl("mean\\()|std\\()|subject|activityid|activityname", names(raw_df))]


# Clean up the variable names

names(mean_std_df) <- gsub("-|\\()|", "", names(mean_std_df))
names(mean_std_df) <- gsub("^t", "TimeDomain", names(mean_std_df))
names(mean_std_df) <- gsub("^f", "FrequencyDomain", names(mean_std_df))
names(mean_std_df) <- gsub("[Aa]cc", "Accelerometer", names(mean_std_df))
names(mean_std_df) <- gsub("[Gg]yro", "Gyrometer", names(mean_std_df))
names(mean_std_df) <- gsub("[Mm]ag", "Magnitude", names(mean_std_df))
names(mean_std_df) <- gsub("[Mm]ean", "Mean", names(mean_std_df))
names(mean_std_df) <- gsub("[Ss]td", "Std", names(mean_std_df))
names(mean_std_df) <- gsub("x$", "X", names(mean_std_df))
names(mean_std_df) <- gsub("y$", "Y", names(mean_std_df))
names(mean_std_df) <- gsub("z$", "Z", names(mean_std_df))


# Creates second, seperate tidy data set for the average of each variable 
# grouped by each subject and each activity

avg_by_sub_act_df<-ddply(mean_std_df, c("subject", "activityname"), numcolwise(mean))



# ouputs both data frames to seperate csv files

write.table(mean_std_df, "data_mean_std.txt", row.names = FALSE)
write.table(avg_by_sub_act_df, "avg_by_sub_act.txt", row.names = FALSE)