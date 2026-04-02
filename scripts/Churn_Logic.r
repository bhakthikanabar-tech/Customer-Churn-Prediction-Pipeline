library(tidyverse)
library(caret)
my_data <- read_excel("C:\Users\dhanv\OneDrive\Desktop\teleco.xlsx")
head(my_data)
my_data$MonthlyCharges <- as.numeric(my_data$MonthlyCharges)
my_data <- na.omit(my_data)
summary(my_data$MonthlyCharges)
hist(my_data$MonthlyCharges, col="skyblue", main="Distribution of Charges")
# Convert Churn to 0 (No) and 1 (Yes)
my_data$Churn_Numeric <- ifelse(my_data$Churn == "Yes", 1, 0)
table(my_data$Churn, my_data$Churn_Numeric)
my_model <- glm(Churn_Numeric ~ MonthlyCharges + tenure, data = my_data, family = "binomial")
summary(my_model)

# We use type = "response" to get a probability between 0 and 1
my_data$predict_prob <- predict(my_model, newdata = my_data, type = "response")
# This should show a list of decimals like 0.145, 0.672, etc.
head(my_data$predict_prob)

my_data$predict_churn <- ifelse(my_data$predict_prob > 0.5, 1, 0)
table(my_data$predict_churn)

# Confusion Matrix: Actual vs Predicted
table(Actual = my_data$Churn_Numeric, Predicted = my_data$predict_churn)

confusion_matrix <- table(Actual = my_data$Churn_Numeric, Predicted = my_data$predict_churn)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Model Accuracy:", round(accuracy * 100, 2), "%"))

# Save the final dataset for Tableau
write.csv(my_data, "Final_Churn_Results.csv", row.names = FALSE)
