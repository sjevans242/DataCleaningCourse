library(readr)
library(dplyr)
library(plyr)
library(tidyr)

## opens features file for use as column headers
features <- read.csv("features.txt", header = FALSE, sep = " ")
## create vector of only the names
features_names <- features$V2

## change to test data directory
setwd("test")

## read data in with fixed column width of 16 character for 561 columns
testdata <- read_fwf("X_test.txt", fwf_widths(rep((16),each=561)))
colnames(testdata) <- features_names
## read in subjects and activity type data
test_subjects <- read.csv("subject_test.txt", header = FALSE, col.names = "subjects")
test_activity <- read.csv("y_test.txt", header = FALSE, col.names = "activity")
## merge columns for test data
testdata <- bind_cols(test_subjects, test_activity, testdata)

## change to train directory
setwd("../train")

## repeat process for train data set
traindata <- read_fwf("X_train.txt", fwf_widths(rep((16),each=561)))
colnames(traindata) <- features_names
train_subjects <- read.csv("subject_train.txt", header = FALSE, col.names = "subjects")
train_activity <- read.csv("y_train.txt", header = FALSE, col.names = "activity")
traindata <- bind_cols(train_subjects, train_activity, traindata)

## return to working directory
setwd("..")

## combine testdata and traindata
alldata <- bind_rows(testdata, traindata)
## extract only columns with means
mean_data <- select(alldata, contains("mean"), -contains("Freq"), -contains("angle"))
## DONT NEED mean_data <- select(mean_data, -contains("Freq"))
## DONT NEED mean_data <- select(mean_data, -contains("angle"))
## extract only columns with stds
std_data <- select(alldata, contains("std"))
## recombine means and stds with subject and activity identifyers
selectdata <- bind_cols(alldata[,1:2], mean_data, std_data)

## replace activity codes with descriptions
selectdata$activity[selectdata$activity==1] <- "walking"
selectdata$activity[selectdata$activity==2] <- "walking_upstairs"
selectdata$activity[selectdata$activity==3] <- "walking_downstairs"
selectdata$activity[selectdata$activity==4] <- "sitting"
selectdata$activity[selectdata$activity==5] <- "standing"
selectdata$activity[selectdata$activity==6] <- "laying"

## create a vector with clean names for column headers
cleannames <- gsub("\\-","",names(selectdata))
cleannames <- gsub("\\(\\)","",cleannames)

## put clean names back into data frame
names(selectdata) <- cleannames
## create name vector for columns with to be summarized
## DONT NEED meannames <- cleannames[3:35]

## convert subject and activity levels to factors
selectdata$activity <- as.factor(selectdata$activity)
selectdata$subjects <- as.factor(selectdata$subjects)

## get means grouped by subject and activity for numerical columns only
tidydata = aggregate(selectdata[3:68], 
                by=list(activity = selectdata$activity, 
                subject=selectdata$subject), 
                mean)

write.table(tidydata, "tidydata.csv", row.names = FALSE)