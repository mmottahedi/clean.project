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

# split by activity
data = a
dat1 <- split(data, data$labels)
dat.act <- data.frame()

# get the mean for each activity
for (i in 1:6){

       dat.act  <- rbind(dat.act,t(as.data.frame(apply(dat1[[i]],2,mean))))
}
row.names(dat.act <- 1:6


# split by subject
dat2 <- split(data, data$subject)
dat.sj <- data.frame()

# get the mean for each activity
for (i in 1:6){

        dat.sj <-  rbind(dat.sj,t(as.data.frame(apply(dat2[[i]],2,mean))))
}
row.names(dat.sj) <- 1:6

dat = rbind()

# activity (number to string)
act <-  as.vector(activity$V2)
for (i in seq(dim(activity)[1])){
        data$labels[ data$labels == i ] = act[i]
}


for (i in seq(dim(activity)[1])){
        dat$labels[ dat$labels == i ] = act[i]
}



mean.indx <- grep("mean",names(dat))
std.indx <- grep("std", names(dat))
indx <- unlist(list(mean.indx,std.indx))
indx <- append(indx,1,0)

df.1 <- data[,indx]
df.2 <- dat[,indx]

