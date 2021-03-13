install.packages("randomForest")
library(randomForest)

print(getwd())
#setwd("C:/Users/vinee/Google Drive/DAE/Spring 2020/SYST568/Assignment 4/titanic")

## Read the CSV Files
## Factors are set to FALSE
ttrain <- read.csv(file="train.csv", stringsAsFactors = FALSE, header = TRUE)
View(ttrain)
head(ttrain)
tail(ttrain)

ttest <- read.csv(file="test.csv", stringsAsFactors = FALSE, header = TRUE)
View(ttest)
head(ttest)
tail(ttest)


## Finding the missing values in both the datasets
median(ttrain$Age)
median(ttrain$Age, na.rm=TRUE)
median(ttest$Age, na.rm=TRUE)

##Data Cleaning
## Combining both Train and Test Datasets to save time
## Creating a new column to understand the difference between the rows as Test data and Train Data

ttrain$Trainset <- TRUE
ttest$Trainset <- FALSE

head(ttrain)
head(ttest)

ncol(ttrain)
ncol(ttest)

## Read column names
names(ttrain)
names(ttest)

## Create Survived column in Test dataset with NA value.
ttest$Survived <- NA

## Read Test dataset columns
ncol(ttest)
names(ttest)

## Combine two Datasets
tfull <- rbind(ttrain,ttest)

head(tfull)
tail(tfull)

## Check the difference between two datasets
table(tfull$Trainset)

## Checking the missing values
table(tfull$Embarked)

## Fill the missing values of "Embarked"
tfull[tfull$Embarked=='', "Embarked"] <- 'S'

## Checking the missing values after filling it
table(tfull$Embarked)

## Checking the missing values
is.na(tfull$Age)

## Finding the empty values in Age column 
table(is.na(tfull$Age))

tfull[is.na(tfull$Age), "Age"]

## Global Medain of Age
median(tfull$Age, na.rm = TRUE)

Age.median <- median(tfull$Age, na.rm = TRUE)

median(tfull$Age, na.rm = TRUE)

## Replace Age colum missing values with Median
tfull[is.na(tfull$Age), "Age"] <- Age.median

table(is.na(tfull$Age))

median(tfull$Age)

## Finding Missingvales in Fare column
table(is.na(tfull$Fare))


Fare.median <- median(tfull$Fare, na.rm = TRUE)

median(tfull$Fare, na.rm = TRUE)

## Replace Fare colum missing values with Median
tfull[is.na(tfull$Fare), "Fare"] <- Fare.median

table(is.na(tfull$Fare))
table(is.na(tfull$Pclass))
table(is.na(tfull$Age))
table(is.na(tfull$Sex))
table(is.na(tfull$SibSp))
table(is.na(tfull$Parch))

median(tfull$Fare)
median(tfull$Pclass)
median(tfull$Age)
median(tfull$Sex)
median(tfull$SibSp)
median(tfull$Parch)

## Changing categorial structure to Factors
str(tfull)
tfull$Pclass <- as.factor(tfull$Pclass)
tfull$Sex <- as.factor(tfull$Sex)
tfull$Embarked <- as.factor(tfull$Embarked)
tfull$Age <- as.numeric(tfull$Age)
tfull$Fare <- as.factor(tfull$Fare)
tfull$Parch <- as.factor(tfull$Parch)
tfull$SibSp <- as.factor(tfull$SibSp)

str(tfull)

## All the Missing values in required columns are filled in
## SPlit full dataset to Train and Test Datasets back
ttrain <- tfull[tfull$Trainset==TRUE,]
str(ttrain)
head(ttrain)
tail(ttrain)
ncol(ttrain)
View(ttrain)

ttest <- tfull[tfull$Trainset==FALSE,]
str(ttest)
head(ttest)
tail(ttest)
ncol(ttest)

## Changing Survived data structure in training set
ttrain$Survived <- as.factor(ttrain$Survived)

## Prediction equation formula building
survived.equation <- "Survived ~ Pclass + Age + Sex + SibSp + Fare + Parch + Embarked"

## Formual of the Equation
Survived.Fml<- as.factor(survived.equation)

rf_model <- randomForest(formula = Survived ~ Pclass + Age + Sex + SibSp + Parch + Embarked, data = ttrain[,-c(1,4,9,10,11,13)], ntree = 500, mtry = 3, nodesize = 0.01 * nrow(ttest))
rf_model

## Importance of each variable - 
varImpPlot(rf_model)

fit2 <- predict(rf_model,newdata = ttrain)
fit2
#confusionMatrix(fit2, ttest$Survived)

## Features Equation
features.equation <- "Pclass + Age + Sex + SibSp + Fare + Parch + Embarked"

## Prediction running
Survived <- predict(rf_model, newdata = ttest)
Survived

## Writing to CSV
PassengerId <- ttest$PassengerId
result.df <- as.data.frame(PassengerId)
result.df$Survived <- Survived

head(result.df)
tail(result.df)

##Writing CSV
write.csv(result.df, file = "Survival Prediction.csv", row.names = FALSE)

#SVM
library(kernlab)

svm.model <- ksvm(Survived ~ Pclass + Age + Sex + SibSp + Parch + Embarked, data = ttrain[,-c(1,4,9,10,11,13)])

## Saving Model as String
model <- "ksvm(Survived ~ Pclass + Age + Sex + SibSp + Parch + Embarked, data = ttrain[,-c(1,4,9,10,11,13)])"

ttrain$survived_pred <- predict(svm.model, ttrain, type = "response")

ttest$survived <- predict(svm.model, ttest, type = "response")

## Writing to CSV
PassengerId <- ttest$PassengerId
ttest.df <- as.data.frame(PassengerId)
ttest.df$Survived <- Survived

head(ttest.df)
tail(ttest.df)


write.csv(ttest.df, file = "svm-model-05.csv", row.names = FALSE)


