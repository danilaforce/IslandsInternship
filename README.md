# IslandsInternship
The scripts and Excel sheets of my internship in Island Biogeography 🏝️

You can find in this GITHUB the scripts I used to conduct both the DAISIEPrep and the DAISIE analysis and the scripts to check the clades for both Amphibians and Squamates of Madagascar. There are also the results of this analysis, in the RDS format for the DAISIEPrep and in CSV format for the DAISIE. Three models were applied to each phylogenetic tree and the final results of DAISIE have the ones with the biggest likelihood for each tree.

- In the ChecklistsandStatus folder you can find the updated checklists of the vertebrates of Madagascar (Amphibia, Birds and Squamates), with the inclusion of species recently discovered (2022 onwards). You can also find the excel sheet with the status of the Mammals of Madagascar according to the Red List Assessment.
- In the Scripts Folder you can find all the Scripts that I have used for my internship. I created two scripts to verify the resulting clades for the species of Amphibia and Squamates present in the island (after exporting island_tbl in DAISIEPrep), the Loop Scripts refer to the extraction of DAISIE data for all the 100 phylogenetic trees, the Missing Species which is a Script only for the insertion of the missing species, the DAISIE model and the Script used to verify which DAISIE model had the highest probability within each tree.
- Results DAISIEPrep are two RDS files with the resulting extracted data to apply to the DAISIE model. They are generated when you go through the LoopAmp and LoopSqua scripts.
- Results DAISIE contain the results of the applied DAISIE models in CSV files, with all the resulting parameters computed and their likelihoods. There is also a CSV with the results for the best model for each tree (with the highest likelihood).

There are also the results of the updates of the checklists and the update of the Red List Status for the Mammals of Madagascar.
