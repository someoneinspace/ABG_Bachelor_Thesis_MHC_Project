
Here, you could find the scripts used for analysis. For the nucleotide diversity files, you can start directly readin them. The same is also correct for "fst_analysis.sh". There were some additional scripts
used for creating files need by MDS/PCA and heatmap.

	-To create MDS files of plink per MHCI and MHCII:
	Shell: plink --bfile AF_EU_MHCI_ref_ge_mi --cow --cluster --mds-plot 2 --out AF_EU_MHCI_ref_ge_mi_mds

	-To create PCA files of plink per MHCI and MHCII (later 539 was used after --pca to calculate the variation contained in the first two components):
	Shell: plink --bfile AF_EU_MHCI_ref_ge_mi --cow --keep-allele-order --pca 3 header tabs var-wts --out AF_EU_MHCI_ref_ge_mi_pca

	-To create freqeuncy files of plink of each breed (together in one file) per MHCI and MHCII:
	Shell: plink --bfile AF_EU_MHCI_ref_ge_mi --keep-allele-order --cow --family --nonfounders --freq --out freq_MHCI_allbreed

Also, you could find the population breed information files "cluster_info_all_data" and "cluster_info_all_data_no_hol" in the folder.