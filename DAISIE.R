library(ape)
library(DAISIEprep)
library(DAISIE)
library(phylobase)

# Initialize an empty data frame to store results
results_d <- data.frame(Tree = integer(),
                         Model = integer(),
                         Cladogenesis = numeric(),
                         Extinction = numeric(),
                         Carrying_capacity = numeric(),
                         Colonisation = numeric(),
                         Anagenesis = numeric(),
                         Likelihood = numeric(),
                         stringsAsFactors = FALSE)

# Loop through each tree in storage_list
for (i in seq_along(storage_list))  {
  tree <- storage_list[[i]]

  # Run the DAISIE_ML models
  M1_1 <- DAISIE_ML(
    datalist = tree,
    initparsopt = c(0.08, 0.00000000000000623, 322, 0.000027, 0.02),
    ddmodel = 11,
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL
  )

  M1_2 <- DAISIE_ML(
    datalist = tree,
    initparsopt = as.numeric(M1_1[1:5]),
    ddmodel = 11,
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL
  )

  M1_3 <- DAISIE_ML(
    datalist = tree,
    initparsopt = as.numeric(M1_2[1:5]),
    ddmodel = 11,
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL
  )

  # Extract and store results for each model
  models_list <- list(M1_1, M1_2, M1_3)

  # Loop through models and store results
  for (j in seq_along(models_list)) {
    result <- models_list[[j]]

    # Debug: Print the structure of result
    print(paste("Processing Model:", j))
    print(result)

    # Extract the results (assuming result is a named list or vector)
    cladogenesis <- result$lambda_c  # Replace with actual key if different
    extinction <- result$mu  # Replace with actual key if different
    carrying_capacity <- result$K
    colonisation <- result$gamma
    anagenesis <- result$lambda_a
    likelihood <- result$loglik  # Replace with actual key if different

    # Create a new row for the results data frame
    new_row <- data.frame(Tree = i,  # Replace `1` with actual tree index if necessary
                          Model = j,
                          Cladogenesis = cladogenesis,
                          Extinction = extinction,
                          Carrying_capacity = carrying_capacity,
                          Colonisation = colonisation,
                          Anagenesis = anagenesis,
                          Likelihood = likelihood,
                          stringsAsFactors = FALSE)

    # Debug: Print the new row to verify it was created correctly
    print("New row created:")
    print(new_row)

    # Check if new_row was created successfully
    if (nrow(new_row) == 1) {
      # Append the new row to the data frame
      results_d <- rbind(results_d, new_row)
    } else {
      # Debugging: Print a message if the new_row is not created as expected
      print(paste("Failed to create new_row for Tree:", i, "Model:", j))
    }
  }
}
  # Print the final results data frame
  print("Final results:")
  print(results_d)

  write.csv(results_df, file="C:\\Users\\danie\\OneDrive\\Documentos\\results_amp.csv")
