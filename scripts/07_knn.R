# ==========================
# KNN FRAUD DETECTION
# ==========================

library(class)
library(caret)

# Read Dataset
data <- read.csv("data/creditcard.csv")

# Use smaller sample for faster execution
set.seed(123)

sample_data <- data[sample(nrow(data), 5000), ]

# Features
x <- sample_data[, c("Time", "Amount")]

# Target
y <- as.factor(sample_data$Class)

# Normalize Features
normalize <- function(x)
{
  (x - min(x)) / (max(x) - min(x))
}

x <- as.data.frame(lapply(x, normalize))

# Split Data
train_index <- createDataPartition(
  y,
  p = 0.7,
  list = FALSE
)

train_x <- x[train_index, ]
test_x <- x[-train_index, ]

train_y <- y[train_index]
test_y <- y[-train_index]

# KNN Model
pred <- knn(
  train = train_x,
  test = test_x,
  cl = train_y,
  k = 5
)

# Confusion Matrix
result <- confusionMatrix(
  pred,
  test_y
)

print(result)