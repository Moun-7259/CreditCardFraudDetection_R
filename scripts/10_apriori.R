# =====================================================
# CREDIT CARD FRAUD DETECTION
# APRIORI ALGORITHM
# =====================================================

# Load required library
library(arules)

# -----------------------------
# Load Dataset
# -----------------------------

credit_data <- read.csv("data/creditcard.csv")

cat("=====================================\n")
cat("APRIORI ALGORITHM\n")
cat("=====================================\n\n")

# -----------------------------
# Take a Sample
# -----------------------------

set.seed(123)

sample_data <- credit_data[sample(nrow(credit_data), 1000), ]

# -----------------------------
# Convert Amount into Categories
# -----------------------------

sample_data$Amount_Category <- ifelse(
  sample_data$Amount > median(sample_data$Amount),
  "HighAmount",
  "LowAmount"
)

# -----------------------------
# Convert Class into Labels
# -----------------------------

sample_data$Transaction_Type <- ifelse(
  sample_data$Class == 1,
  "Fraud",
  "Normal"
)

# -----------------------------
# Create Transaction Data
# -----------------------------

transaction_list <- apply(
  sample_data[, c("Amount_Category", "Transaction_Type")],
  1,
  function(x) as.character(x)
)

transactions <- as(
  transaction_list,
  "transactions"
)

# -----------------------------
# Apply Apriori Algorithm
# -----------------------------

rules <- apriori(
  transactions,
  parameter = list(
    supp = 0.10,
    conf = 0.50
  )
)

cat("Association Rules Generated:\n\n")

inspect(rules)

# -----------------------------
# Save Rules to File
# -----------------------------

capture.output(
  inspect(rules),
  file = "output/apriori_rules.txt"
)

cat("\nAssociation rules saved successfully.\n")
cat("Location: output/apriori_rules.txt\n")

cat("\nApriori Algorithm Completed Successfully!\n")