#### Tutorial DAISIEprep - editing Squamates of Madagascar Phylogenie

library(ape)
library(DAISIEprep)
library(DAISIE)
library(phylobase)
getwd()
rm(list = ls())


# Define the directory containing your RDS files
rds_file_path <- "Tonini_dna_posterior_100.rds"
output_directory <- "C:/Users/danie/OneDrive/Área de Trabalho/Estágio/Nova pasta/aaa/Results"

storage_list_squa <- list()

# Load the list of phylogenetic trees from the RDS file
squatrees <- readRDS(rds_file_path)


library(readxl)
squa_checklist <- read_excel("squa_checklist.xlsx")

# Loop through each tree in the list
for (i in seq_along(squatrees)) {
  # Extract the individual tree
  squa_tree <- squatrees[[i]]

  ### READING THE AMP TREE - DONE!

  ### Now we want to change from S3 to S4 format

  squa_tree <- as(squa_tree, "phylo4")

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

  #### ADDING THE MISSING SPECIES
  ### in the case of the amphibians, the new species came from sampled GENUS in the tree!




  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 9,
    species_to_add_to = "Lygodactylus_madagascariensis")

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Geckolepis_maculata")

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 4,
    species_to_add_to = "Paroedura_bastardi")


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 3,
    species_to_add_to = "Paroedura_oviceps")


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Paroedura_androyensis")


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Phelsuma_dorsivittata"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Phelsuma_madagascariensis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Uroplatus_henkeli"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 6,
    species_to_add_to = "Uroplatus_ebenaui"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Uroplatus_phantasticus"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 4,
    species_to_add_to = "Brookesia_lineata")

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 2,
    species_to_add_to = "Blaesodactylus_boivini")

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 13,
    species_to_add_to = "Calumma_nasutum")


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Alluaudina_bellyi")

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =16,
    species_to_add_to = "Amphiglossus_anosyensis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =3,
    species_to_add_to = "Liophidium_torquatum"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =1,
    species_to_add_to = "Chalarodon_madagascariensis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =2,
    species_to_add_to = "Compsophis_albiventris"
  )


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =3,
    species_to_add_to = "Furcifer_rhinoceratus"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =1,
    species_to_add_to = "Heteroliodon_occipitalis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =2,
    species_to_add_to = "Ithycyphus_miniatus"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =2,
    species_to_add_to = "Langaha_madagascariensis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =2,
    species_to_add_to = "Lycodryas_gaimardi"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =1,
    species_to_add_to = "Lygodactylus_montanus"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =3,
    species_to_add_to = "Lygodactylus_arnoulti"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =3,
    species_to_add_to = "Madagascarophis_meridionalis"
  )


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =4,
    species_to_add_to = "Madascincus_igneocaudatus"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =1,
    species_to_add_to = "Madascincus_arenicola"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species =8,
    species_to_add_to = "Madatyphlops_arenarius"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Matoatoa_brevipes"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Mimophis_mahfalensis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 6,
    species_to_add_to = "Paracontias_kankana"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 6,
    species_to_add_to = "Paragehyra_petiti"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 3,
    species_to_add_to = "Pseudoacontias_menamainty"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 7,
    species_to_add_to = "Pseudoxyrhopus_microps"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Pygomeles_braconnieri"
  )


  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 1,
    species_to_add_to = "Sanzinia_madagascariensis"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 2,
    species_to_add_to = "Trachylepis_aureopunctata"
  )

  island_tbl <- add_missing_species(
    island_tbl = island_tbl,
    num_missing_species = 2,
    species_to_add_to = "Zonosaurus_boettgeri"
  )


  ##### New colonizing clades


  island_tbl <- add_island_colonist(
    island_tbl = island_tbl,
    clade_name = "Ebenavia_maintimainty",
    status = "endemic",
    missing_species = 2,
    col_time = NA_real_,
    col_max_age = FALSE,
    branching_times = NA_real_,
    min_age = NA_real_,
    clade_type = 1,
    species = c("Ebenavia_maintimainty")
  )


  #### Creating DAISIEdata

  data_list <- create_daisie_data(
    data = island_tbl,
    island_age = 88,
    num_mainland_species = 600,
    precise_col_time = TRUE
  )

  # Define the output file name
  output_file <- file.path(output_directory, paste0("tree_sq", i, ".rds"))

  # Save the processed data (adjust saving method if needed, e.g., saveRDS, write.csv, etc.)
  saveRDS(data_list, file = output_file)

  storage_list_squa[[i]] <- data_list

  # Optionally, print progress
  cat("Processed tree", i, "and saved to", output_file, "\n")
}

output_file1 <- file.path(output_directory, paste0("storage_list_squa.rds"))

saveRDS(object=storage_list_squa, file=output_file1)
#cter vector of the arguments concatenated term-by-term and separated by fsep if all arguments have positive length; otherwise, an empty character vector (unlike paste).

#An element of the result will be marked (see Encoding) as UTF-8 if run in a UTF-8 local
cat("All trees processed.")
