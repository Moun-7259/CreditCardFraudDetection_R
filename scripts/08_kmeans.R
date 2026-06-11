# =====================================================
# CREDIT CARD FRAUD DETECTION USING K-MEANS CLUSTERING
# =====================================================

# Load required library
library(factoextra)

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("K-MEANS CLUSTERING\n")
cat("=====================================\n\n")

# -----------------------------
# Select Features for Clustering
# -----------------------------

cluster_data <- credit_data[, c("Time", "Amount")]

# -----------------------------
# Normalize the Data
# -----------------------------

cluster_data <- scale(cluster_data)

cat("Data Normalized Successfully.\n\n")

# -----------------------------
# Apply K-Means Algorithm
# -----------------------------

set.seed(123)

kmeans_result <- kmeans(
  x = cluster_data,
  centers = 3,
  nstart = 20
)

# -----------------------------
# Print Results
# -----------------------------

cat("Cluster Centers:\n")
print(kmeans_result$centers)

cat("\nNumber of Observations in Each Cluster:\n")
print(kmeans_result$size)

cat("\nTotal Within-Cluster Sum of Squares:\n")
print(kmeans_result$tot.withinss)

# -----------------------------
# Save Cluster Visualization
# -----------------------------

png(
  filename = "output/kmeans_clusters.png",
  width = 1000,
  height = 600
)

fviz_cluster(
  object = kmeans_result,
  data = cluster_data,
  geom = "point"
)

dev.off()

cat("\nCluster plot saved successfully.\n")
cat("Location: output/kmeans_clusters.png\n")
cat("\nK-Means Clustering Completed Successfully!\n")