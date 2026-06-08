# ==========================
# PRINCIPAL COMPONENT ANALYSIS
# ==========================

library(factoextra)

# Read Dataset
data <- read.csv("data/creditcard.csv")

# Remove target column
pca_data <- data[,1:30]

# Perform PCA
pca_result <- prcomp(
  pca_data,
  center = TRUE,
  scale. = TRUE
)

cat("===== PCA SUMMARY =====\n\n")

print(summary(pca_result))

# Save Scree Plot
png("output/pca_scree_plot.png",
    width = 1000,
    height = 600)

fviz_eig(
  pca_result,
  addlabels = TRUE
)

dev.off()

cat("\nPCA Scree Plot saved in output folder\n")