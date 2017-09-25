library(reshape)
library(data.table)

##read all data 
sub_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

sub_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")


feature_names <- read.table("features.txt")
activity_labels <- read.table("./activity_labels.txt")

#  merge the test and trian subject datasets
subject<-rbind(sub_train,sub_test)
names(subject)<-"Subject"

# merge the test and trian labels

label <- rbind(y_test,y_train)
label <- merge(label,activity_labels,by=1)[,2]

data <- rbind(x_test, x_train)
colnames(data) <- feature_names[, 2]

data <- cbind(subject, label, data)

# Create a subset containing only the mean and std variables
search_data <- grep("-mean|-std", colnames(data))
mean_std <- data[,c(1,2,search_data)]


# calculate  means, grouped by subject/label
melted = melt(mean_std, id = c("Subject", "label"))
means = dcast(melted , Subject + label ~ variable, mean)

# Save the result
write.table(means, file="tidy.txt")

