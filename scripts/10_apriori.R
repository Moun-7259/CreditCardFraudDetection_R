# ==========================
# APRIORI ALGORITHM
# ==========================

library(arules)

# Sample Transactions

transactions <- list(
  c("Milk", "Bread", "Butter"),
  c("Milk", "Bread"),
  c("Bread", "Butter"),
  c("Milk", "Butter"),
  c("Milk", "Bread", "Butter", "Eggs"),
  c("Bread", "Eggs"),
  c("Milk", "Eggs"),
  c("Bread", "Butter", "Eggs")
)

# Convert to Transactions
trans <- as(
  transactions,
  "transactions"
)

# Apply Apriori
rules <- apriori(
  trans,
  parameter = list(
    supp = 0.2,
    conf = 0.5
  )
)

cat("===== ASSOCIATION RULES =====\n\n")

inspect(rules)

# Save Rules
capture.output(
  inspect(rules),
  file = "output/apriori_rules.txt"
)

cat("\nApriori rules saved in output folder\n")