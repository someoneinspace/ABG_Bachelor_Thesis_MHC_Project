#! /bin/bash

#IBS matrix of individuals are created in a child folder per MHCI, in this case, or MHCII. After keep fam, the text file including the name of the breed is given.
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Western_Finn_cattle_name.txt --distance square0 1-ibs flat-missing --out distance_Western_Finn
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Eastern_Finn_cattle_name.txt --distance square0 1-ibs flat-missing --out distance_Eastern_Finn
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Northern_Finn_cattle_name.txt --distance square0 1-ibs flat-missing --out distance_Northern_Finn
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Finn_Holstein_Friesian_name.txt --distance square0 1-ibs flat-missing --out distance_Finn_HF
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Deep_red_name.txt --distance square0 1-ibs flat-missing --out distance_Deep_red
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Dutch_belted_name.txt --distance square0 1-ibs flat-missing --out distance_Dutch_belted
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Groninger_Whiteheaded_name.txt --distance square0 1-ibs flat-missing --out distance_Groninger_Whiteheaded
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Fries_Hollands_name.txt --distance square0 1-ibs flat-missing --out distance_Fries_Hollands
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/MRY_name.txt --distance square0 1-ibs flat-missing --out distance_MRY
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Holstein_Friesian_name.txt --distance square0 1-ibs flat-missing --out distance_NL_HF
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/MIR_name.txt --distance square0 1-ibs flat-missing --out distance_MIR
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/BAR_name.txt --distance square0 1-ibs flat-missing --out distance_BAR
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/MER_name.txt --distance square0 1-ibs flat-missing --out distance_MER
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Egyptian_name.txt --distance square0 1-ibs flat-missing --out distance_Egyptian
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Holstein_Fresian_name.txt --distance square0 1-ibs flat-missing --out distance_EG_HF
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Ankole_name.txt --distance square0 1-ibs flat-missing --out distance_Ankole
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Karamojong_name.txt --distance square0 1-ibs flat-missing --out distance_Karamojong
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Ntuku_name.txt --distance square0 1-ibs flat-missing --out distance_Ntuku
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Nganda_name.txt --distance square0 1-ibs flat-missing --out distance_Nganda
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Nkedi_name.txt --distance square0 1-ibs flat-missing --out distance_Nkedi
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Friesian_name.txt --distance square0 1-ibs flat-missing --out distance_UG_HF
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Afrikaner_name.txt --distance square0 1-ibs flat-missing --out distance_Afrikaner
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Bonsmara_name.txt --distance square0 1-ibs flat-missing --out distance_Bonsmara
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Tuli_name.txt --distance square0 1-ibs flat-missing --out distance_Tuli
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Nguni_name.txt --distance square0 1-ibs flat-missing --out distance_Nguni
plink --bfile ../AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --nonfounders --no-sex --keep-fam ./pop_info/Holstein_name.txt --distance square0 1-ibs flat-missing --out distance_Holstein

#R script "nuc_div_script.R" is used to print the nucleotide diversity and standard deviation of the pairwise nucleotide diversity values on the shell per MHCI or MHCII. These values are copied to an excel document.
Rscript --vanilla nuc_div_script.R distance_Western_Finn.mdist
Rscript --vanilla nuc_div_script.R distance_Eastern_Finn.mdist
Rscript --vanilla nuc_div_script.R distance_Northern_Finn.mdist
Rscript --vanilla nuc_div_script.R distance_Finn_HF.mdist
Rscript --vanilla nuc_div_script.R distance_Deep_red.mdist
Rscript --vanilla nuc_div_script.R distance_Dutch_belted.mdist
Rscript --vanilla nuc_div_script.R distance_Groninger_Whiteheaded.mdist
Rscript --vanilla nuc_div_script.R distance_Fries_Hollands.mdist
Rscript --vanilla nuc_div_script.R distance_MRY.mdist
Rscript --vanilla nuc_div_script.R distance_NL_HF.mdist
Rscript --vanilla nuc_div_script.R distance_MIR.mdist
Rscript --vanilla nuc_div_script.R distance_BAR.mdist
Rscript --vanilla nuc_div_script.R distance_MER.mdist
Rscript --vanilla nuc_div_script.R distance_Egyptian.mdist
Rscript --vanilla nuc_div_script.R distance_EG_HF.mdist
Rscript --vanilla nuc_div_script.R distance_Ankole.mdist
Rscript --vanilla nuc_div_script.R distance_Karamojong.mdist
Rscript --vanilla nuc_div_script.R distance_Ntuku.mdist
Rscript --vanilla nuc_div_script.R distance_Nganda.mdist
Rscript --vanilla nuc_div_script.R distance_Nkedi.mdist
Rscript --vanilla nuc_div_script.R distance_UG_HF.mdist
Rscript --vanilla nuc_div_script.R distance_Afrikaner.mdist
Rscript --vanilla nuc_div_script.R distance_Bonsmara.mdist
Rscript --vanilla nuc_div_script.R distance_Tuli.mdist
Rscript --vanilla nuc_div_script.R distance_Nguni.mdist
Rscript --vanilla nuc_div_script.R distance_Holstein.mdist
