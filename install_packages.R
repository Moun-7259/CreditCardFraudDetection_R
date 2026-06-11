packages <- c(
  "dplyr",
  "ggplot2",
  "caret",
  "class",
  "factoextra",
  "arules"
)

for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "https://cloud.r-project.org")
    library(pkg, character.only = TRUE)
  }
}

cat("All required packages are installed successfully!\n")