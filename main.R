# ==========================================
# CREDIT CARD FRAUD DETECTION PROJECT
# MAIN FILE
# ==========================================

cat("=====================================\n")
cat("STARTING PROJECT\n")
cat("=====================================\n\n")

# Run all scripts one by one

source("scripts/01_import_data.R")

cat("\n-------------------------------------\n")

source("scripts/02_data_wrangling.R")

cat("\n-------------------------------------\n")

source("scripts/03_descriptive_statistics.R")

cat("\n-------------------------------------\n")

source("scripts/04_preprocessing.R")

cat("\n-------------------------------------\n")

source("scripts/05_visualization.R")

cat("\n-------------------------------------\n")

source("scripts/06_pca.R")

cat("\n-------------------------------------\n")

source("scripts/07_knn.R")

cat("\n-------------------------------------\n")

source("scripts/08_kmeans.R")

cat("\n-------------------------------------\n")

source("scripts/09_outlier_detection.R")

cat("\n-------------------------------------\n")

source("scripts/10_apriori.R")

cat("\n=====================================\n")
cat("PROJECT EXECUTED SUCCESSFULLY\n")
cat("=====================================\n")