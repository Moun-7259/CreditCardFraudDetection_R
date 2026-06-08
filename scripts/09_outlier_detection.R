# ==========================
# OUTLIER DETECTION
# ==========================

data <- read.csv("data/creditcard.csv")

cat("===== OUTLIER DETECTION =====\n\n")

# Using Amount column

Q1 <- quantile(data$Amount, 0.25)
Q3 <- quantile(data$Amount, 0.75)

IQR_value <- IQR(data$Amount)

lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

cat("Lower Bound:", lower_bound, "\n")
cat("Upper Bound:", upper_bound, "\n")

# Detect Outliers
outliers <- data[
  data$Amount < lower_bound |
  data$Amount > upper_bound,
]

cat("\nNumber of Outliers:\n")
print(nrow(outliers))

# Remove Outliers
clean_data <- data[
  data$Amount >= lower_bound &
  data$Amount <= upper_bound,
]

cat("\nDataset Size After Removing Outliers:\n")
print(dim(clean_data))

# Save Boxplot
png(
  "output/outlier_boxplot.png",
  width = 1000,
  height = 600
)

boxplot(
  data$Amount,
  main = "Outlier Detection using Boxplot",
  ylab = "Amount"
)

dev.off()

cat("\nBoxplot saved in output folder\n")