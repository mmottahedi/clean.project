setwd("~/cwd/data.science/Cleaning/final.proj/UCI HAR Dataset/")
library(dplyr)

# read features names

feat.name <- read.table('features.txt')
activity <- read.table('activity_labels.txt')

#read Training data
xtrain <- read.table('train/X_train.txt',col.names = feat.name$V2)
ytrain <- read.table('train/y_train.txt',col.names = "labels")
subj.train <- read.table('train/subject_train.txt',col.names = "subject")
train <- cbind(ytrain,subj.train,xtrain)

#read  test data
xtest <- read.table('test/X_test.txt',col.names = feat.name$V2)
ytest <- read.table('test/y_test.txt',col.names = "labels")
subj.test <- read.table('test/subject_test.txt',col.names = "subject")
test <- cbind(ytest,subj.test,xtest)

# # merge test and train
data <- rbind(train,test)


mean.indx <- grep("mean",names(dat))
std.indx <- grep("std", names(dat))
indx <- unlist(list(mean.indx,std.indx))
indx <- append(indx,c(1,2),0)

df.1 <- data[,indx]


# group by subject and label

data1 <- group_by(df.1,labels,subject)

df.2 <- summarise_each(data1,funs(mean))


# activity (number to string)

act <-  as.vector(activity$V2)
for (i in seq(dim(activity)[1])){
        df.1$labels[ df.1$labels == i ] = act[i]
}


for (i in seq(dim(activity)[1])){
        df.2$labels[ df.2$labels == i ] = act[i]
}
