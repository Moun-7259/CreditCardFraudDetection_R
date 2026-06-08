# ==========================
# K-MEANS CLUSTERING
# ==========================

library(factoextra)

data <- read.csv("data/creditcard.csv")

# Select features
cluster_data <- data[, c("Time", "Amount")]

# Normalize
cluster_data <- scale(cluster_data)

# K-Means
set.seed(123)

kmeans_result <- kmeans(
  cluster_data,
  centers = 3,
  nstart = 20
)

print(kmeans_result)

# Save Cluster Plot
png(
  "output/kmeans_clusters.png",
  width = 1000,
  height = 600
)

fviz_cluster(
  kmeans_result,
  data = cluster_data
)

dev.off()

cat("K-Means cluster plot saved in output folder\n")