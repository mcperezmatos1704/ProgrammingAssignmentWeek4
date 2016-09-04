if(file.exists("./data3")) {dir.create("./data3")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/humanactivity.zip")
unzip(zipfile="./data/humanactivity.zip", exdir="./data")
dataX_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
dataY_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
Data_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
Data_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
Datafeatures <- read.table('./data/UCI HAR Dataset/features.txt')
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
colnames(dataX_train) <- Datafeatures[,2]
colnames(dataY_train) <- "activityID"
colnames(Data_train) <- "subjectID"
colnames(testX) <- Datafeatures[,2]
colnames(testY) <- "activityID"
colnames(Data_test) <- "subjectID"
colnames(activityLabels) <- c('activityID', 'activityTYPE')
merge_train <- cbind(dataY_train, Data_train, dataX_train)
merge_test <- cbind(testY, Data_test, testX)
merge_all <- rbind(merge_train, merge_test)
colNames <- colnames(merge_all)
Mean_Std <- (grepl("activityID", colNames) |
  grepl("subjectID", colNames) | 
  grepl("mean..", colNames) |
  grepl("std..", colNames)
)
Mean_Std_DataSet <- merge_all[, Mean_Std == TRUE ]
Only_ActNames <- merge(Mean_Std_DataSet, activityLabels, 
                       by='activityID', 
                       all.x=TRUE)
TidySetTwo <- aggregate(. ~subjectID + activityID, Only_ActNames, mean)
TidySetTwo <- TidySetTwo[order(TidySetTwo["subjectID"], TidySetTwo["activityID"]),]
write.table(TidySetTwo, "TidySetTwo.txt", row.name=FALSE)
