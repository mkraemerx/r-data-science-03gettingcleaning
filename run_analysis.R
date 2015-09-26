#setwd("dev/r-data-science/03GettingCleaningData/assignment")
feature_names <- read.table("dataset/features.txt", header=FALSE)

# combine training and test data of the features
t_train <- read.table("dataset/train/X_train.txt", header=FALSE)
t_test <- read.table("dataset/test/X_test.txt", header=FALSE)
t_data <- rbind(t_train, t_test)
rm(t_train)
rm(t_test)
# name columns of the features
names(t_data) <- feature_names$V2

# subselect only columns with mean or standard deviation values
my_columns <- sort(c(grep("*mean*", feature_names$V2, ignore.case = TRUE), grep("*std*", feature_names$V2, ignore.case = TRUE)))
t_clean <- t_data[, my_columns]
rm(t_data)
rm(my_columns)

# add a column indicationg the test person (subject) for all rows
subject_train <- read.table("dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("dataset/test/subject_test.txt", header=FALSE)
t_clean$subject <- rbind(subject_train, subject_test)[,1]
rm(subject_train)
rm(subject_test)

# add a column indicating the resulting activity for all rows
act_train <- read.table("dataset/train/y_train.txt", header=FALSE)
act_test <- read.table("dataset/test/y_test.txt", header=FALSE)
t_clean$act_id <- rbind(act_train, act_test)[,1]
rm(act_train)
rm(act_test)

# merge the activity id with the clear text name
act_names <- read.table("dataset/activity_labels.txt", header=FALSE)
names(act_names) <- c("id", "activity")
c_data <- merge(t_clean, act_names, by.x="act_id", by.y="id")

# summarize the data
sum_data <- group_by(c_data, activity, subject) %>% summarise_each(funs(mean))
write.table(sum_data, file="result.txt", row.name=FALSE)