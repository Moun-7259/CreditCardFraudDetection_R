# =====================================================
# CREDIT CARD FRAUD DETECTION
# DATA PREPROCESSING
# =====================================================

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("DATA PREPROCESSING\n")
cat("=====================================\n\n")

# -----------------------------
# Check Dataset Dimensions
# -----------------------------

cat("Dataset Dimensions:\n")
print(dim(credit_data))

# -----------------------------
# Check Missing Values
# -----------------------------

cat("\nMissing Values in Each Column:\n")
print(colSums(is.na(credit_data)))

# -----------------------------
# Convert Class to Factor
# -----------------------------

credit_data$Class <- as.factor(credit_data$Class)

cat("\nClass Column Converted to Factor.\n")

# -----------------------------
# Normalization Function
# -----------------------------

normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

# -----------------------------
# Normalize Amount Column
# -----------------------------

credit_data$Amount_Normalized <- normalize(credit_data$Amount)

# -----------------------------
# Normalize Time Column
# -----------------------------

credit_data$Time_Normalized <- normalize(credit_data$Time)

# -----------------------------
# Display Results
# -----------------------------

cat("\nFirst 6 Original Amount Values:\n")
print(head(credit_data$Amount))

cat("\nFirst 6 Normalized Amount Values:\n")
print(head(credit_data$Amount_Normalized))

cat("\nFirst 6 Original Time Values:\n")
print(head(credit_data$Time))

cat("\nFirst 6 Normalized Time Values:\n")
print(head(credit_data$Time_Normalized))

cat("\nPreprocessing Completed Successfully!\n")