#setwd("dev/r-data-science/03GettingCleaningData/assignment")
feature_names <- read.table("dataset/features.txt", header=FALSE)

t_train <- read.table("dataset/train/X_train.txt", header=FALSE)
t_test <- read.table("dataset/test/X_test.txt", header=FALSE)
t_data <- rbind(t_train, t_test)
rm(t_train)
rm(t_test)
names(t_data) <- feature_names$V2

my_columns <- sort(c(grep("*mean*", feature_names$V2, ignore.case = TRUE), grep("*std*", feature_names$V2, ignore.case = TRUE)))
t_clean <- t_data[, my_columns]
rm(t_data)
rm(my_columns)

subject_train <- read.table("dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("dataset/test/subject_test.txt", header=FALSE)
t_clean$subject <- rbind(subject_train, subject_test)[,1]
rm(subject_train)
rm(subject_test)

act_train <- read.table("dataset/train/y_train.txt", header=FALSE)
act_test <- read.table("dataset/test/y_test.txt", header=FALSE)
t_clean$act_id <- rbind(act_train, act_test)[,1]
rm(act_train)
rm(act_test)

act_names <- read.table("dataset/activity_labels.txt", header=FALSE)
names(act_names) <- c("id", "activity")
