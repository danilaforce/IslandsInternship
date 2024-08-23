# Define the directory containing your RDS files
rds_file_path <- "Tonini_dna_posterior_100.rds"

# Load the list of phylogenetic trees from the RDS file
sqatrees <- readRDS(rds_file_path)

# Extract the individual tree
squa_tree <- sqatrees[[26]]

### READING THE AMP TREE - DONE!

### Now we want to change from S3 to S4 format

squa_tree <- as(squa_tree, "phylo4")

### Now lets edit the Phylogeny to have the species from the island

library(readxl)
squa_checklist <- read_excel("squa_checklist.xlsx")

# Create data_frame for endemicity_status
island_species <- data.frame(tip_labels=squa_checklist$Name_In_Tree, tip_endemicity_status=squa_checklist$Status_Species)

endemicity_status <- create_endemicity_status(
  phylo = squa_tree,
  island_species = island_species
)

# Now lets join this endemicity_status to the tree!

phylod <- phylobase::phylo4d(squa_tree, endemicity_status)

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

# see the clade names
island_tbl@island_tbl$species

########## new tree

# Extract the individual tree
squa_tree <- sqatrees[[75]]

### READING THE AMP TREE - DONE!

### Now we want to change from S3 to S4 format

squa_tree <- as(squa_tree, "phylo4")

### Now lets edit the Phylogeny to have the species from the island

endemicity_status <- create_endemicity_status(
  phylo = squa_tree,
  island_species = island_species
)

# Now lets join this endemicity_status to the tree!

phylod <- phylobase::phylo4d(squa_tree, endemicity_status)
plot_phylod(phylod = phylod)

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

# see the clade names
island_tbl@island_tbl$species
