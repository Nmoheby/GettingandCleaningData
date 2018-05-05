library(dplyr)
#---------------------------
# read train data
pathdata = file.path("./")
X_train <- read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
Y_train <- read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
Sub_train <- read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)

# read test data
X_test <- read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
Y_test <- read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
Sub_test <- read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)

# read data description
variable_names <- read.table(file.path(pathdata, "features.txt"),header = FALSE)

# read activity labels
activity_labels <- read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

#---------------------------
#Merges the training and the test 
colnames(X_train) = variable_names[,2]
colnames(Y_train) = "activityId"
colnames(Sub_train) = "subjectId"

colnames(X_test) = variable_names[,2]
colnames(Y_test) = "activityId"
colnames(Sub_test) = "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

mrg_train = cbind(Y_train, Sub_train, X_train)
mrg_test = cbind(Y_test, Sub_test, X_test)

rgdata = rbind(mrg_train, mrg_test)


#---------------------------
#subsets only the measurements on the mean and standard deviation for each measurement.
colNames = colnames(mrgdata)
mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
mrgdata_Mn_St <- mrgdata[ , mean_and_std == TRUE]

#---------------------------
#use activity names to name the activities in the data set
mrgdata_act_name = merge(activity_labels,mrgdata_Mn_St)
mrgdata_act_name<-select (mrgdata_act_name,-activityId)

#---------------------------
#creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyTable <- aggregate(. ~subjectId + activityType, mrgdata_act_name, mean)

#Saving the new data
write.table(TidyTable, "TidyTable.txt", row.name=FALSE)