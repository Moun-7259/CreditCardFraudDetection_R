# =====================================================
# CREDIT CARD FRAUD DETECTION
# IMPORT DATA
# =====================================================

# Read the dataset

credit_data <- read.csv("data/creditcard.csv")

# Display success message

cat("=====================================\n")
cat("DATASET LOADED SUCCESSFULLY\n")
cat("=====================================\n\n")

# Display number of rows and columns

cat("Dataset Dimensions:\n")
print(dim(credit_data))

# Display column names

cat("\nColumn Names:\n")
print(colnames(credit_data))

# Display first 6 rows

cat("\nFirst 6 Rows:\n")
print(head(credit_data))

# Display structure

cat("\nDataset Structure:\n")
str(credit_data)

# Display summary statistics

cat("\nSummary Statistics:\n")
print(summary(credit_data))

cat("\nImport Completed Successfully!\n")