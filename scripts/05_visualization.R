library(ggplot2)

data <- read.csv("data/creditcard.csv")

# Histogram
hist_plot <- ggplot(data, aes(x = Amount)) +
  geom_histogram(bins = 50) +
  ggtitle("Transaction Amount Histogram")

ggsave(
  "output/histogram.png",
  plot = hist_plot,
  width = 8,
  height = 5
)

# Density Plot
density_plot <- ggplot(data, aes(x = Amount)) +
  geom_density() +
  ggtitle("Transaction Amount Distribution")

ggsave(
  "output/distribution.png",
  plot = density_plot,
  width = 8,
  height = 5
)

cat("Graphs saved successfully in output folder\n")