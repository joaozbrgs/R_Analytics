library(dplyr)
library(caTools)
library(caret)
library(e1071)
library(naivebayes)
library(randomForest)
library(kernlab)

# Import data from CSV
df.main <- read.csv(
    fileEncoding = 'UTF-8',             # In some cases, use other encoding, like 'latin1'
    na.strings = c('NA', ''),           # Define empty string as NULL
    file = './datasets/diabetes.csv',   # Accessing the file
    sep = ',',                          # Defining the CSV separator
    dec = '.'                           # Defining the float separator
)

# Explore DataFrame - Treationg the dataset
print(dim(df.main))
print(str(df.main))
print(View(df.main))

# Check for NULL values
print(colSums(is.na(df.main)))

# Check proportion per category
print(table(df.main$Outcome))

# Convert 'Outcome' from 'int' to 'factor'
df.main$Outcome <- as.factor(df.main$Outcome)

# Now that the dataframe is ready:
print(str(df.main))
print(summary(df.main))

# Identifying Outliers and anomalies
boxplot(df.main)
boxplot(df.main$Insulin)
hist(df.main$Insulin)

# # Removing Outliers
df.filtered <- df.main %>% 
    filter(Insulin <= 250)
boxplot(df.filtered$Insulin)
hist(df.filtered$Insulin)

# Finding Outliers in the filtered dataframe
boxplot(df.filtered)

# Studying Each variable for distribution
hist(df.filtered$Pregnancies)
hist(df.filtered$BMI)
hist(df.filtered$Age)

# Studying Behaviour of variable 'Insulin'
print(summary(df.filtered$Insulin))
print(sd(df.filtered$Insulin))


# # CREATING PREDICTIVE MODELS


# Divide dada between TRAIN (70%) and TEST (30%)
# Study those functions from 'caTools' library
set.seed(123)
index = sample.split(df.filtered$Pregnancies, SplitRatio = .70)
print(index)

train = subset(df.filtered, index == TRUE)
test = subset(df.filtered, index == FALSE)

print(dim(df.filtered))
print(dim(train))
print(dim(test))

# # Preparing the model for training with 'caret' and 'e1071'
# Ps.: '?caret::train'

# 1st Attempt - Model KNN
model.1 <- train(
    Outcome ~., data = train, method = 'knn'
)

# Check Results
print(View(model.1))
print(model.1$results)
print(model.1$bestTune)

# 2nd Attempt - Expanded 'k'
model.2 <- train(
    Outcome ~., data = train, method = 'knn',
    tuneGrid = expand.grid(k = c(1:20))
)

# Check Results
print(View(model.2))
print(model.2$results)
print(model.2$bestTune)

# Visualize performance - line graph
print(plot(model.2))

# 3rd Attempt - Naive Bayes
model.3 <- train(
    Outcome ~., data = train, method = 'naive_bayes'
)

# Check Results
print(model.3$results)
print(model.3$bestTune)


# 4th Attempt - 'randomForest'
model.4 <- train(
    Outcome ~., data = train, method = 'rpart2'
)

# Check Results
print(model.4)

# Check importance of each variable in the model
print(varImp(model.4$finalModel))

# 5th Attempt - randomForest: removing irrelevant variables
model.5 <- train(
    Outcome ~., data = train[,c(-3, -5)], method = 'rpart2'
)

# Check Results
print(model.5)
print(plot(model.5$finalModel))
print(text(model.5$finalModel))

# 6th Attempt - Using 'kernlab'
model.6 <- train(
    Outcome ~., data = train, method = 'svmRadialSigma', 
    preProcess = c('center')
)
print(model.6$results)
print(model.6$bestTune)


# # MODEL EVALUATION
# '?predict'

# Testing the model
predictions <- predict(model.6, test)

# Check Results
print(predictions)

# Create a confusion matrix to verify the model's results
# '?caret::confusionMatrix'
print(confusionMatrix(predictions, test$Outcome))


# # PERFORMING THE PREDICTIONS

# Adding a dataframe with 1 register to simulate the model's application
n.data = data.frame(
  Pregnancies = c(3),           
  Glucose = c(111.50),
  BloodPressure = c(70),
  SkinThickness = c(20),          
  Insulin = c(47.49),
  BMI = c(30.80),       
  DiabetesPedigreeFunction = c(0.34),
  Age = c(28)                     
)

# print(n.data)

# # Using the model to make predictions - input new data
predictions.2 <- predict(model.6, n.data)
results <- ifelse(predictions.2 == 1, 'Positive', 'Negative')

# Check Results
print(paste('Result:', results))


# # RESULT VISUALIZATION

# Create a file with prediction results
# write.csv(predictions, 'result.csv')

# Read the csv file
result.csv <- read.csv(file = './datasets/result.csv')

# Rename column names
names(result.csv) <- c('Index', 'Predicted Value')

# Visualizing the DataFrame
print(View(result.csv))