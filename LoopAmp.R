#### Editing Squamates of Madagascar Phylogenie

library(ape)
library(DAISIEprep)
library(DAISIE)
library(phylobase)
getwd()
rm(list = ls())


# Define the directory containing your RDS files
rds_file_path <- "Jetz_Pyron_dna_posterior_100.rds"
output_directory <- "C:/Users/danie/OneDrive/Área de Trabalho/Estágio/Nova pasta/aaa/Results"

# Load the list of phylogenetic trees from the RDS file
amptrees <- readRDS(rds_file_path)
storage_list_amp <- list()

# Loop through each tree in the list
for (i in seq_along(amptrees)) {
  # Extract the individual tree
  amp_tree <- amptrees[[i]]

### READING THE AMP TREE - DONE!

### Now we want to change from S3 to S4 format

amp_tree <- as(amp_tree, "phylo4")

### Now lets edit the Phylogeny to have the species from the island

library(readxl)
amp_checklist <- read_excel("amp_checklist.xlsx")

# Create data_frame for endemicity_status
island_species <- data.frame(tip_labels=amp_checklist$Name_In_Tree, tip_endemicity_status=amp_checklist$Status_Species)

endemicity_status <- create_endemicity_status(
  phylo = amp_tree,
  island_species = island_species
)

# Now lets join this endemicity_status to the tree!

phylod <- phylobase::phylo4d(amp_tree, endemicity_status)

# Preparing the data to DAISIE

phylod <- add_asr_node_states(
  phylod = phylod,
  asr_method = "mk" #more reliable
)

island_tbl <- island_tbl()

island_tbl <- extract_island_species(
  phylod = phylod,
  extraction_method = "asr"
)

#### ADDING THE MISSING SPECIES
### in the case of the amphibians, the new species came from sampled GENUS in the tree!

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 63,
  species_to_add_to = "Blommersia_blommersae")

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 65,
  species_to_add_to = "Stumpffia_hara")


#### Creating DAISIEdata

data_list <- create_daisie_data(
  data = island_tbl,
  island_age = 88,
  num_mainland_species = 200,
  precise_col_time = TRUE
)



# Define the output file name
output_file <- file.path(output_directory, paste0("tree_", i, ".rds"))

# Save the processed data (adjust saving method if needed, e.g., saveRDS, write.csv, etc.)
saveRDS(object=data_list, file = output_file)

storage_list_amp[[i]] <- data_list


# Optionally, print progress
cat("Processed tree", i, "and saved to", output_file, "\n")
}

output_file1 <- file.path(output_directory, paste0("storage_list_amp.rds"))

saveRDS(object=storage_list_amp, file=output_file1)

cat("All trees processed.")
