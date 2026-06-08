# Read Dataset
data <- read.csv("data/creditcard.csv")

cat("===== PREPROCESSING =====\n\n")

# Check Missing Values
cat("Missing Values:\n")
print(colSums(is.na(data)))

# Normalization Function
normalize <- function(x)
{
  (x - min(x)) /
  (max(x) - min(x))
}

# Normalize Amount Column
data$Amount_Normalized <- normalize(data$Amount)

cat("\nOriginal Amount:\n")
print(head(data$Amount))

cat("\nNormalized Amount:\n")
print(head(data$Amount_Normalized))