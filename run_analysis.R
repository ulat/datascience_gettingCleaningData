# importing the source txt-files into variables
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# combing the sourcefiles to one big rawData file
testData <- cbind(subject_test, x_test, y_test)
trainData <- cbind(subject_train, x_train, y_train)
rawData <- rbind(testData, trainData)

# adding the factor names
colNames <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)
colNames <- colNames[,2]
colNames <- c("subject", colNames, "activity")
colnames(rawData) <- colNames

# reading the activities and adding factor names
activities <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=F)
colnames(activities) <- c("activity", "activity_descr")

# merge rawData file and activity files together
rawData <- merge(rawData, activities)

# extracting the columns that contain mean() or std()
# escaping the paranthesis
meanCols <- grep("mean\\(\\)", names(rawData), ignore.case=TRUE) 
stdCols <- grep("std\\(\\)", names(rawData), ignore.case=TRUE)
meanAndStdCols <- c(meanCols, stdCols)
# adding the activities, activity descriptions and subjects to the cols
meanAndStdActivityCols <- c(1, 564, 2, meanAndStdCols)

# extracting only those factors with mean and std including activity, activity description and subject id
simplifiedData <- rawData[ , meanAndStdActivityCols]

# extracting the id and the measure vars for the melt down
idVars = c("activity", "subject", "activity_descr")
measureVars = setdiff(colnames(simplifiedData), idVars)
meltedSimplifiedData  <- melt(simplifiedData, id=idVars, measure.vars=measureVars)
# recast the melted data, calculating the means
tidyData <- dcast(meltedSimplifiedData, activity_descr + subject ~ variable, mean)

# creating new textfile containing the tidydata
write.table(tidyData, "tidydata.txt")
