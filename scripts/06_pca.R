# =====================================================
# CREDIT CARD FRAUD DETECTION
# PRINCIPAL COMPONENT ANALYSIS (PCA)
# =====================================================

# Load required library
library(factoextra)

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("PRINCIPAL COMPONENT ANALYSIS (PCA)\n")
cat("=====================================\n\n")

# -----------------------------
# Remove Class column
# -----------------------------

pca_data <- credit_data[, !(names(credit_data) %in% "Class")]

cat("Number of Variables Used for PCA :",
    ncol(pca_data), "\n\n")

# -----------------------------
# Perform PCA
# -----------------------------

pca_result <- prcomp(
  pca_data,
  center = TRUE,
  scale. = TRUE
)

# -----------------------------
# Display PCA Summary
# -----------------------------

cat("PCA Summary:\n\n")
print(summary(pca_result))

# -----------------------------
# Display Standard Deviations
# -----------------------------

cat("\nStandard Deviations of Principal Components:\n")
print(pca_result$sdev)

# -----------------------------
# Display Rotation Matrix
# -----------------------------

cat("\nPrincipal Component Loadings:\n")
print(head(pca_result$rotation))

# -----------------------------
# Save Scree Plot
# -----------------------------

png(
  filename = "output/pca_scree_plot.png",
  width = 1000,
  height = 600
)

fviz_eig(
  pca_result,
  addlabels = TRUE,
  main = "PCA Scree Plot"
)

dev.off()

cat("\nPCA Scree Plot saved successfully.\n")
cat("\nOutput File: output/pca_scree_plot.png\n")
cat("\nPCA Completed Successfully!\n")