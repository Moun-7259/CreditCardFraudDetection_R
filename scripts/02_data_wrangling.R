library(dplyr)

data <- read.csv("data/creditcard.csv")

cat("Original Dataset Size:\n")
print(dim(data))

selected_data <- data %>%
  select(Time, Amount, Class)

cat("\nSelected Columns:\n")
print(head(selected_data))

high_amount <- data %>%
  filter(Amount > 1000)

cat("\nTransactions Above 1000:\n")
print(nrow(high_amount))

data <- data %>%
  mutate(
    TransactionType = ifelse(Class == 1,
                             "Fraud",
                             "Normal")
  )

cat("\nNew Column Added:\n")
print(head(data[, c("Amount","Class","TransactionType")]))