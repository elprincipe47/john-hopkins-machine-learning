library(caret)
library(ggplot2)
library(randomForest)

ter<- read.csv("C:\Users\elhassane\Desktop\pml-training.csv")

test <-read.csv(file = "C:\Users\elhassane\Desktop\pml-testing.csv")
training = training[,colSums(is.na(training))==0]
dim(ter)
dim(test)
inTr <-creadeDataPartition(y=ter$classe,p=0.65,list=FALSE)
forTrain <-ter[inTr,]
forTest <-ter[-inTr,]
noZero <-nearZeroVar(forTrain, saveMetrics=TRUE)
forTrain <-forTrain[!noZero]
#random forest
set.seed(150)
modelForse <-train(classe~.,data=forTrain,method="rf")
predictf <-predict(modelForse,newdata=forTest)
confusionMatrix(predictf,forTest$classe)
#boosting
predictBO <-train(classe~.,data=forTrain,method="gbm")
confusionMatrix(predictBO,forTest$classe)




