# =====================================================
# CREDIT CARD FRAUD DETECTION
# OUTLIER DETECTION USING IQR METHOD
# =====================================================

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("OUTLIER DETECTION\n")
cat("=====================================\n\n")

# -----------------------------
# Calculate Quartiles
# -----------------------------

Q1 <- quantile(credit_data$Amount, 0.25)
Q3 <- quantile(credit_data$Amount, 0.75)

IQR_value <- IQR(credit_data$Amount)

# -----------------------------
# Calculate Bounds
# -----------------------------

lower_bound <- Q1 - (1.5 * IQR_value)
upper_bound <- Q3 + (1.5 * IQR_value)

cat("First Quartile (Q1):", Q1, "\n")
cat("Third Quartile (Q3):", Q3, "\n")
cat("Interquartile Range (IQR):", IQR_value, "\n\n")

cat("Lower Bound:", lower_bound, "\n")
cat("Upper Bound:", upper_bound, "\n\n")

# -----------------------------
# Detect Outliers
# -----------------------------

outliers <- credit_data[
  credit_data$Amount < lower_bound |
  credit_data$Amount > upper_bound,
]

cat("Number of Outliers Found:\n")
print(nrow(outliers))

# -----------------------------
# Remove Outliers
# -----------------------------

clean_data <- credit_data[
  credit_data$Amount >= lower_bound &
  credit_data$Amount <= upper_bound,
]

cat("\nDataset Size Before Removing Outliers:\n")
print(dim(credit_data))

cat("\nDataset Size After Removing Outliers:\n")
print(dim(clean_data))

# -----------------------------
# Save Boxplot
# -----------------------------

png(
  filename = "output/outlier_boxplot.png",
  width = 1000,
  height = 600
)

boxplot(
  credit_data$Amount,
  main = "Outlier Detection Using Boxplot",
  ylab = "Transaction Amount",
  col = "lightblue"
)

dev.off()

cat("\nBoxplot saved successfully.\n")
cat("Location: output/outlier_boxplot.png\n")

cat("\nOutlier Detection Completed Successfully!\n")