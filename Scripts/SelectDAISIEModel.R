library(dplyr)

# Read the CSV
dados <- read.csv("results_amp.csv")

# Select the highest likelihood
resultados <- dados %>%
  group_by(Tree) %>%
  slice(which.max(Likelihood)) %>%
  ungroup()

# Save the Results
print(resultados)
write.csv(resultados, "resultado.csv", row.names = FALSE)
