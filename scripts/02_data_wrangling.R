# =====================================================
# CREDIT CARD FRAUD DETECTION
# DATA WRANGLING
# =====================================================

# Load required library
library(dplyr)

# -----------------------------
# Read Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("DATA WRANGLING\n")
cat("=====================================\n\n")

# -----------------------------
# Original Dataset Size
# -----------------------------

cat("Original Dataset Dimensions:\n")
print(dim(credit_data))

# -----------------------------
# Check Missing Values
# -----------------------------

cat("\nMissing Values in Each Column:\n")
print(colSums(is.na(credit_data)))

# -----------------------------
# Select Required Columns
# -----------------------------

selected_data <- credit_data %>%
  select(Time, Amount, Class)

cat("\nSelected Columns Preview:\n")
print(head(selected_data))

# -----------------------------
# Filter High Amount Transactions
# -----------------------------

high_amount <- credit_data %>%
  filter(Amount > 1000)

cat("\nNumber of Transactions Above 1000:\n")
print(nrow(high_amount))

# -----------------------------
# Create New Column
# -----------------------------

credit_data <- credit_data %>%
  mutate(
    TransactionType = ifelse(
      Class == 1,
      "Fraud",
      "Normal"
    )
  )

cat("\nNew Column Added Successfully:\n")
print(head(
  credit_data[, c("Amount", "Class", "TransactionType")]
))

# -----------------------------
# Remove Duplicate Records
# -----------------------------

credit_data <- distinct(credit_data)

cat("\nDataset Size After Removing Duplicates:\n")
print(dim(credit_data))

cat("\nData Wrangling Completed Successfully!\n")