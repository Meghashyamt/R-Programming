install.packages("e1071")
install.packages("caret")
install.packages("doSNOW")
install.packages("ipred")
install.packages("xgboost")
install.packages("lattice")
install.packages("ggplot2")
library(caret)
library(doSNOW)

print(getwd())
#setwd("C:/Users/vinee/Google Drive/DAE/Spring 2020/SYST568/Assignment 4/titanic")

## Read the CSV Files
## Factors are set to FALSE
ttrain <- read.csv(file="train.csv", stringsAsFactors = FALSE, header = TRUE)
View(ttrain)
head(ttrain)
tail(ttrain)
dim(ttrain)
ttest <- read.csv(file="test.csv", stringsAsFactors = FALSE, header = TRUE)
View(ttest)
head(ttest)
tail(ttest)
dim(ttest)

## Checking the structure of the datasets to understand the difference between two datasets. "Survived" is missing in test dataset
str(ttrain)
str(ttest)

## Checking the missing values
table(ttrain$Embarked)

## Fill the missing values of "Embarked"
ttrain[ttrain$Embarked=='', "Embarked"] <- 'S'

## Checking the missing values after filling it
table(ttrain$Embarked)

## Checking the missing values
is.na(ttrain$Age)


## Finding the empty values in Age column 
summary(ttrain$Age)
table(is.na(ttrain$Age))

## Add a new column to know the Age is missing
ttrain$IsAgemissing <- ifelse(is.na(ttrain$Age), "Y", "N")
View(ttrain)

## Add a new feature total travellers - Traveller+Sibling+Spouce+Parent+Children
ttrain$Totaltravellers <- 1 + ttrain$SibSp + ttrain$Parch
View(ttrain)

## Setting factors
ttrain$Survived <- as.factor(ttrain$Survived)
ttrain$Pclass <- as.factor(ttrain$Pclass)
ttrain$Sex <- as.factor(ttrain$Sex)
ttrain$Embarked <- as.factor(ttrain$Embarked)
ttrain$IsAgemissing <- as.factor(ttrain$IsAgemissing)
head(ttrain)
## Creating a new subset of actual dataset with only required features
features <- c("PassengerId", "Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", 
              "Fare", "Embarked", "IsAgemissing", "Totaltravellers")
ttrain <- ttrain[ , features]

str(ttrain)
ttrain[,]
## As we are using caret library, we are going to create a Dummy dataset 
## where we can see splitting one column to number of columns as its values.
library(caret)
dummy.vars <- dummyVars(~ ., data = ttrain[, ])
View(dummy.vars)
ttrain.dummy <- predict(dummy.vars, ttrain[, ])
View(ttrain.dummy)

## Impute the missing values automatically as we are using Caret bagImpute method.
pre.process <- preProcess(ttrain.dummy, method = "bagImpute")
imputed.train <- predict(pre.process, ttrain.dummy)
View(imputed.train)

##Insert the filled Age column in original train dataset
ttrain$Age <- imputed.train[, 6]
View(ttrain)

## SPlitting the data into 70/30% using CreateDataPartition method
set.seed(54321)
indexes <- createDataPartition(ttrain$Survived,
                               times = 1,
                               p = 0.7,
                               list = FALSE)
View(indexes)
titanic.ttrain <- ttrain[indexes,]
View(titanic.ttrain)
titanic.ttest <- ttrain[-indexes,]
View(titanic.ttest)
## Checking the proportions of the threee datasets - Original, Dummy and Test
prop.table(table(ttrain$Survived))
prop.table(table(titanic.ttrain$Survived))
prop.table(table(titanic.ttest$Survived))
dim(titanic.ttest)

## Building the Model using repeatedcv method
## Performing fold cross validation
## Use grid search for optimal model
control.ttrain <- trainControl(method = "repeatedcv",
                              number = 5,
                              repeats = 6,
                              search = "grid")

##Applying xgboost with the default hyperparameters
xg.grid <- expand.grid(eta = c(0.05, 0.075, 0.1),
                         nrounds = c(50, 75, 100),
                         max_depth = 6:8,
                         min_child_weight = c(2.0, 2.25, 2.5),
                         colsample_bytree = c(0.3, 0.4, 0.5),
                         gamma = 0,
                         subsample = 1)
View(xg.grid)

##Using doSNOW package as it is used up in both Windows and Mac easily.
cluster <- makeCluster(5, type = "SOCK")

registerDoSNOW(cluster)

##xgboost model on train dataset

caret.cv <- train(Survived ~ ., 
                  data = titanic.ttrain,
                  method = "xgbTree",
                  #tuneGrid = xg.grid,
                  trControl = control.ttrain)
stopCluster(cluster)

## Caret Results
caret.cv

## Predicting the testing data
Prediction <- predict(caret.cv, titanic.ttest)

confusionMatrix(Prediction, titanic.ttest$Survived)

##Writing to CSV
PassengerId <- titanic.ttest$PassengerId
ttest.df <- as.data.frame(PassengerId)
View(ttest.df)
dim(ttest.df)
ttest.df$Survived <- as.data.frame(Prediction)

head(ttest.df)
tail(ttest.df)

write.csv(ttest.df, file = "XGBOOST.csv", row.names = FALSE)

## SVM
caret.svm <- train(Survived ~ ., 
                    data = titanic.ttrain,
                    method = "svmLinear",
                    ##tuneGrid = xg.grid, 
                    trControl = control.ttrain)
stopCluster(cluster)

## Predicting the testing data
Prediction.svm <- predict(caret.svm, titanic.ttest)
View(Prediction.svm)

confusionMatrix(Prediction.svm, titanic.ttest$Survived)
View(titanic.ttest)
##Writing to CSV
PassengerId <- titanic.ttest$PassengerId
ttest.df <- as.data.frame(PassengerId)
View(ttest.df)
dim(ttest.df)
ttest.df$Survived <- as.data.frame(Prediction.svm)

View(ttest.df)

head(ttest.df)
tail(ttest.df)

library(readxl)
write.table(ttest.df, "SVM.xlsx", row.names = FALSE)
read_xlsx("SVM.xlsx")
