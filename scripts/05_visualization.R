# =====================================================
# CREDIT CARD FRAUD DETECTION
# DATA VISUALIZATION
# =====================================================

# Load required library
library(ggplot2)

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("DATA VISUALIZATION\n")
cat("=====================================\n\n")

# -----------------------------
# Histogram of Amount
# -----------------------------

hist_plot <- ggplot(credit_data, aes(x = Amount)) +
  geom_histogram(bins = 50, fill = "steelblue", color = "black") +
  ggtitle("Histogram of Transaction Amount") +
  xlab("Transaction Amount") +
  ylab("Frequency")

ggsave(
  filename = "output/histogram.png",
  plot = hist_plot,
  width = 8,
  height = 5
)

cat("Histogram saved successfully.\n")

# -----------------------------
# Density Plot
# -----------------------------

density_plot <- ggplot(credit_data, aes(x = Amount)) +
  geom_density(fill = "lightgreen", alpha = 0.6) +
  ggtitle("Density Plot of Transaction Amount") +
  xlab("Transaction Amount") +
  ylab("Density")

ggsave(
  filename = "output/distribution.png",
  plot = density_plot,
  width = 8,
  height = 5
)

cat("Density plot saved successfully.\n")

# -----------------------------
# Fraud vs Normal Transactions
# -----------------------------

credit_data$Class <- factor(
  credit_data$Class,
  levels = c(0, 1),
  labels = c("Normal", "Fraud")
)

bar_plot <- ggplot(credit_data, aes(x = Class)) +
  geom_bar(fill = "orange", color = "black") +
  ggtitle("Fraud vs Normal Transactions") +
  xlab("Transaction Type") +
  ylab("Count")

ggsave(
  filename = "output/class_distribution.png",
  plot = bar_plot,
  width = 8,
  height = 5
)

cat("Class distribution graph saved successfully.\n")

cat("\nAll graphs have been saved in the 'output' folder.\n")