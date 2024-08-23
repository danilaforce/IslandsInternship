#Define the directory containing your RDS files
rds_file_path <- "Jetz_Pyron_complete_posterior_100.rds"

# Load the list of phylogenetic trees from the RDS file
amptrees <- readRDS(rds_file_path)

# Extract the individual tree
amp_tree <- amptrees[[15]]

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

########## new tree

# Extract the individual tree
amp_tree <- amptrees[[75]]

### READING THE AMP TREE - DONE!

### Now we want to change from S3 to S4 format

amp_tree <- as(amp_tree, "phylo4")

### Now lets edit the Phylogeny to have the species from the island

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

# see the clade names
island_tbl@island_tbl$species
