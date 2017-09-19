##1.read all data and names them

sub_train <- read.table("./train/subject_train.txt")
sub_test <- read.table("./test/subject_test.txt")

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

names(sub_train)<- "SubjectID"
names(sub_test) <- "SubjectID"

# read  features.txt and add column names

feature_names <- read.table("features.txt")
names(x_train) <- feature_names$V2
names(x_test) <- feature_names$V2

names(y_train) <- "activity"
names(y_test) <- "activity"

# 2. merge all data
train <- cbind(sub_train,y_train,x_train)
test <- cbind(sub_test,y_test,x_test)

train_test <- rbind(train,test)


##3. find  which columns contain "mean()" or "std()"

mean_std_cols <- grepl("mean\\(\\)",names(train_test)) | grepl("mean\\(\\)",names(train_test))
##result
## FALSE FALSE  TRUE  TRUE  TRUE FALSE

mean_std_cols <- TRUE

train_test <- train_test[,mean_std_cols]

#4.names activity columns

train_test$activity <- factor(train_test$activity,labels = c("WALKING","WALKING UPSTAIRS","WALKING DOWNSTAIRS","SITTING","STANDING","LAYING"))

library(data.table)
melt_train_test <- melt(train_test,id=c("SubjectID","activity"))
##names(melt_train_test)
##[1] "SubjectID" "activity"  "variable"  "value"   

##5. Use "variable" to group "SubjectID" and "activity"
result <- dcast(melt_train_test, SubjectID+activity ~ variable, mean)

write.table(result, "result.txt",row.name=FALSE)



