# Read Dataset
data <- read.csv("data/creditcard.csv")

cat("===== DESCRIPTIVE STATISTICS =====\n\n")

# Summary
cat("Summary of Amount:\n")
print(summary(data$Amount))

# Mean
cat("\nMean Amount:\n")
print(mean(data$Amount))

# Median
cat("\nMedian Amount:\n")
print(median(data$Amount))

# Standard Deviation
cat("\nStandard Deviation:\n")
print(sd(data$Amount))

# Minimum
cat("\nMinimum Amount:\n")
print(min(data$Amount))

# Maximum
cat("\nMaximum Amount:\n")
print(max(data$Amount))