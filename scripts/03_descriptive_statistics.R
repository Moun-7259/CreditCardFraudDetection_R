# =====================================================
# CREDIT CARD FRAUD DETECTION
# DESCRIPTIVE STATISTICS
# =====================================================

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("DESCRIPTIVE STATISTICS\n")
cat("=====================================\n\n")

# -----------------------------
# Dataset Information
# -----------------------------

cat("Number of Rows : ", nrow(credit_data), "\n")
cat("Number of Columns : ", ncol(credit_data), "\n\n")

# -----------------------------
# Summary Statistics
# -----------------------------

cat("Summary of Amount Column:\n")
print(summary(credit_data$Amount))

# -----------------------------
# Mean
# -----------------------------

cat("\nMean Amount:\n")
print(mean(credit_data$Amount))

# -----------------------------
# Median
# -----------------------------

cat("\nMedian Amount:\n")
print(median(credit_data$Amount))

# -----------------------------
# Standard Deviation
# -----------------------------

cat("\nStandard Deviation:\n")
print(sd(credit_data$Amount))

# -----------------------------
# Minimum Value
# -----------------------------

cat("\nMinimum Amount:\n")
print(min(credit_data$Amount))

# -----------------------------
# Maximum Value
# -----------------------------

cat("\nMaximum Amount:\n")
print(max(credit_data$Amount))

# -----------------------------
# Variance
# -----------------------------

cat("\nVariance:\n")
print(var(credit_data$Amount))

# -----------------------------
# Fraud vs Normal Transactions
# -----------------------------

cat("\nClass Distribution:\n")
print(table(credit_data$Class))

cat("\nDescriptive Statistics Completed Successfully!\n")