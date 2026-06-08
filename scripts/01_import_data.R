# Load Dataset

data <- read.csv("data/creditcard.csv")

cat("Dataset Loaded Successfully\n\n")

cat("Dataset Dimensions:\n")
print(dim(data))

cat("\nFirst 6 Rows:\n")
print(head(data))