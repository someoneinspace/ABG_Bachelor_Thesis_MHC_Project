#! /bin/bash

#After creating fst files for all the data and all the data excluding HF, first binary files of each gene is created, then fst files corresponding to each gene are created. Weighted fst is in the text files created.
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data.txt --out all_data_fst_mhc1
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out all_data_fst_mhc1_no_hol
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 27828737 --to-bp 27837725 --make-bed --out 1_BoLA_MHCI_files
plink --bfile 1_BoLA_MHCI_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_1_BoLA_MHCI_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 27870206 --to-bp 27876056 --make-bed --out 2_BOLA_MHCI_files
plink --bfile 2_BOLA_MHCI_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_2_BOLA_MHCI_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 27897513 --to-bp 27905245 --make-bed --out 3_BOLA_alpha_chain_files
plink --bfile 3_BOLA_alpha_chain_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_3_BOLA_alpha_chain_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 27905246 --to-bp 27914198 --make-bed --out 4_MIC1_files
plink --bfile 4_MIC1_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_4_MIC1_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 27942375 --to-bp 27951488 --make-bed --out 5_non_cl_MHC_files
plink --bfile 5_non_cl_MHC_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_5_non_cl_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 27952265 --to-bp 27962282 --make-bed --out 6_MHC_class_I_po_files
plink --bfile 6_MHC_class_I_po_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_6_MHC_class_I_po_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 28054155 --to-bp 28060399 --make-bed --out 7_class_I_A_like_files
plink --bfile 7_class_I_A_like_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_7_class_I_A_like_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 28492346 --to-bp 28506219 --make-bed --out 8_MHC-class-I_M_files
plink --bfile 8_MHC-class-I_M_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_8_MHC-class-I_M_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 28547781 --to-bp 28554089 --make-bed --out 9_BOLA-NC1_files
plink --bfile 9_BOLA-NC1_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_9_BOLA-NC1_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 28662713 --to-bp 28668379 --make-bed --out 10_JSP1_files
plink --bfile 10_JSP1_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_10_JSP1_no_hol_fst
plink --bfile ../AF_EU_MHCI_same --cow --keep-allele-order --nonfounders --chr 23 --from-bp 28719501 --to-bp 28725399 --make-bed --out 11_BOLA-2_files
plink --bfile 11_BOLA-2_files --cow --keep-allele-order --nonfounders --fst --within cluster_info_all_data_no_hol.txt --out gene_11_BOLA-2_no_hol_fst
