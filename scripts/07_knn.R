# =====================================================
# CREDIT CARD FRAUD DETECTION USING KNN
# =====================================================

# Load required libraries
library(class)
library(caret)

# ----------------------------
# Load Dataset
# ----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("Dataset Loaded Successfully!\n")
cat("Number of Rows :", nrow(credit_data), "\n")
cat("Number of Columns :", ncol(credit_data), "\n\n")

# ----------------------------
# Take a Sample (5000 records)
# ----------------------------

set.seed(123)

sample_data <- credit_data[sample(nrow(credit_data), 5000), ]

# ----------------------------
# Convert Class to Factor
# ----------------------------

sample_data$Class <- as.factor(sample_data$Class)

# ----------------------------
# Select Features
# (Exclude only Class column)
# ----------------------------

x <- sample_data[, names(sample_data) != "Class"]

# Target Variable

y <- sample_data$Class

# ----------------------------
# Normalize Data
# ----------------------------

normalize <- function(z) {
  (z - min(z)) / (max(z) - min(z))
}

x <- as.data.frame(lapply(x, normalize))

# ----------------------------
# Split Train and Test Data
# ----------------------------

set.seed(123)

train_index <- createDataPartition(
  y,
  p = 0.70,
  list = FALSE
)

train_x <- x[train_index, ]
test_x <- x[-train_index, ]

train_y <- y[train_index]
test_y <- y[-train_index]

# ----------------------------
# Apply KNN Algorithm
# ----------------------------

predictions <- knn(
  train = train_x,
  test = test_x,
  cl = train_y,
  k = 5
)

# ----------------------------
# Display Results
# ----------------------------

result <- confusionMatrix(
  predictions,
  test_y
)

cat("\n=====================================\n")
cat("KNN MODEL RESULTS\n")
cat("=====================================\n\n")

print(result)

cat("\nOverall Accuracy : ",
    round(result$overall["Accuracy"] * 100, 2),
    "%\n")

cat("\nFinished Successfully!\n")