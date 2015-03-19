run_analysis <- function (){
  
  require(data.table)
  
  ## Merges the training and the test sets to create one data set.
  
  TrainPath <- "UCI HAR Dataset/train/X_train.txt"
  TestPath <- "UCI HAR Dataset/test/X_test.txt"
  TrainSubjects <- "UCI HAR Dataset/train/subject_train.txt"
  TestSubjects <- "UCI HAR Dataset/test/subject_test.txt"
  TrainActivities <- "UCI HAR Dataset/train/y_train.txt"
  TestActivities <- "UCI HAR Dataset/test/y_test.txt"  
  
  
  Testdf <- read.table(TestPath)
  TestSubj <- read.table(TestSubjects)
  TestActi <- read.table(TestActivities)
  AllTests <- data.frame(TestActi, TestSubj, Testdf)
  
  Traindf <- read.table(TrainPath)
  TrainSubj <- read.table(TrainSubjects)
  TrainActi <- read.table(TrainActivities)
  AllTrains <- data.frame(TrainActi, TrainSubj, Traindf)
  
  Alldf <- rbind(AllTests, AllTrains)
  
  
  ## Extracts only the measurements on the mean and standard deviation for each measurement. 
    
  SubData <- Alldf[, 1:8]
  
  ## Uses descriptive activity names to name the activities in the data set
  ## Appropriately labels the data set with descriptive variable names.
  
  names(SubData) <- c("Activity","Subject", "tBodyAcc_mean_X","tBodyAcc_mean_Y","tBodyAcc_mean_Z","tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z") 
  
  SubData$Activity[SubData$Activity==1] <- "WALKING"
  SubData$Activity[SubData$Activity==2] <- "WALKING_UPSTAIRS"
  SubData$Activity[SubData$Activity==3] <- "WALKING_DOWNSTAIRS"
  SubData$Activity[SubData$Activity==4] <- "SITTING"
  SubData$Activity[SubData$Activity==5] <- "STANDING"
  SubData$Activity[SubData$Activity==6] <- "LAYING"
  
 
  ## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  dt1 <- data.table(SubData)
  setkey(dt1, Activity, Subject) 
  ## df2 <- dt1[, list(tBodyAcc_mean_X=mean(tBodyAcc_mean_X), tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y), tBodyAcc_mean_Z=mean(tBodyAcc_mean_Z), tBodyAcc_std_X=mean(tBodyAcc_std_X)), by=list(Activity, Subject)]
  df2 <- dt1[, list(tBodyAcc_mean_X=mean(tBodyAcc_mean_X), tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y), tBodyAcc_mean_Z=mean(tBodyAcc_mean_Z), tBodyAcc_std_X=mean(tBodyAcc_std_X), tBodyAcc_std_Y=mean(tBodyAcc_std_Y), tBodyAcc_std_Z=mean(tBodyAcc_std_Z)), by=list(Activity, Subject)]
  df2 <- data.frame(df2)
  rm(dt1)

  write.table(df2, file = "run_analysis_results.txt", row.names = FALSE)
  
}