##### I'll begin by exporting the trees to check them in FigTREE

library(ape)
library(DAISIEprep)
library(DAISIE)
library(phylobase)
getwd()
rm(list = ls())

### amp tree 1!

Multitrees_amp <- readRDS(file = "Jetz_Pyron_dna_posterior_100.rds")
amp.tree <- Multitrees_amp[[75]]

tre_file_path <- "C:\\Users\\danie\\OneDrive\\Área de Trabalho\\Estágio\\Árvores\\amp3.tre"

# Save the phylogenetic tree in TRE format
write.tree(amp.tree, file = tre_file_path)

### amp tree 2!

amp2.tree <- Multitrees_amp[[50]]

tre_file_path <- "C:\\Users\\danie\\OneDrive\\Área de Trabalho\\Estágio\\Árvores\\amp2.tre"

# Save the phylogenetic tree in TRE format
write.tree(amp2.tree, file = tre_file_path)

### Squa tree 1!

Multitrees_squa <- readRDS(file = "Tonini_complete_posterior_100.rds")
squa.tree <- Multitrees_squa[[15]]

tre_file_path <- "C:\\Users\\danie\\OneDrive\\Área de Trabalho\\Estágio\\Árvores\\squa.tre"

# Save the phylogenetic tree in TRE format
write.tree(squa.tree, file = tre_file_path)

### Squa tree 2!

squa2.tree <- Multitrees_squa[[87]]

tre_file_path <- "C:\\Users\\danie\\OneDrive\\Área de Trabalho\\Estágio\\Árvores\\squa2.tre"

# Save the phylogenetic tree in TRE format
write.tree(squa2.tree, file = tre_file_path)

####AMP MISSING SPECIES
#### I have tried 5 to check the clades for five different random trees for the amp and all had equal division of clades
#### so I just decided to assume that it will be identical among all trees and that means that I will put together a lot of genera
#### that belong to the same clade, like the Blommersia, Guibemantis and the others except Stumpffia.

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 52,
  species_to_add_to = "Blommersia_blommersae")

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 2,
  species_to_add_to = "Stumpffia_hara")

##### IF I ADD ALL THE SPECIES THAT HAD NA IN THE CHECKLIST, EXCEPT FOR THE MINI GENERA

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 77,
  species_to_add_to = "Blommersia_blommersae")

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 52,
  species_to_add_to = "Stumpffia_hara")

##################################
##### SQUA MISSING SPECIES########
##################################

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 9,
  species_to_add_to = "Lygodactylus_madascariensis")

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 1,
  species_to_add_to = "Paroedura_guibeae")

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 1,
  species_to_add_to = "Phelsuma_dorsivittata"
)

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 1,
  species_to_add_to = "Uroplatus_henkeli"
)

####### IF I ADD THE ONES FROM THE CHECKLIST FROM BEFORE



island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species = 9,
  species_to_add_to = "Lygodactylus_madascariensis")

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
  species_to_add_to = "Ebenavia_inunguis")

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
  num_missing_species =5,
  species_to_add_to = "Madatyphlops_arenarius"
)

island_tbl <- add_missing_species(
  island_tbl = island_tbl,
  num_missing_species =2,
  species_to_add_to = "Lemuriatyphlops_microcephalus"
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



### Check missing species

squa_checklist <- read.csv("squa_checklist.csv")

count_missing_species(
  squa_checklist,
  "Name_In_Tree",
  "Genus",
  "DNA_In_Tree",
  "Status_Species",
  "Remove_Species"
)

### IT WORKED, BUT ONE NEEDS TO HAVE THE CSV FILE PRISTINELLY
