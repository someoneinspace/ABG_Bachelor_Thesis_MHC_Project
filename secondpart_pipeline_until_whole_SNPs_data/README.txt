
Firstly, in separate folders, these were run (with explanation above, the script below) per MHCI and MHCII per country (country abbreviations were used):

	-To add a variant ID name in the vcf files (later used to extract variants via plink), regex was used in a text editor:
	Find: ^23\t(\d*)\t.\t
	Replace: 23\t\1\tbt\1\t

	-To change the vcf file into plink binary format:
	Shell: plink --vcf EG_nre_MHCI_high --cow --out EG_nre_MHCI_high_

	-To extract only the SNPs and to turn the binary format into text file format (.map and .ped):
	Shell: plink --bfile EG_nre_MHCI_high_ --cow --keep-allele-order --snps-only --recode compound-genotypes --out EG_nre_MHCI_high_snps

	-To produce a bim file containing just the SNPs:
	Shell: plink --bfile EG_nre_MHCI_high_ --cow --keep-allele-order --snps-only --make-just-bim --out EG_nre_MHCI_high_snps_b

	-Family files were created in nosex file format from the excel and text files of individual id and its country received from Rayner. These were changed with the nosex files already created.
	You could find these in this folder (same for MHCI and MHCII).

Then, the bim files of two countries were merged to keep the common SNPs for which the alternative allele was the same in addition to the country-specific SNPs. This bim file was also used
to update the already present ped files so that genotypes for the common SNPs were kept in addition to the novel SNPs for which all the genotypes of individuals were set as homozygote reference allele.
All of these were carried out in a python script "combination_script.py".

	-map files are created per country:
	Shell: cat EG_SA_MHCI_combined.bim | cut -f 1,2,3,4 > EG_viaSA_nre_MHCI_high_snps.map

	-Then, these updated text files (ped, map) of two countries were merged to produce combined text files using plink:
	Shell: plink --file EG_viaSA_nre_MHCI_high_snps --cow --merge SA_viaEG_nre_MHCI_high_snps --recode compound-genotypes --out EG_SA_MHCI

These combination steps were repeated for the combined text files with another country first to produce the combined continent text files and then to eventually produce the combined MHCI or MHCII text files
of two continents.

	-Then, the text files were turned into binary files of plink while setting the reference alleles correctly as in the reference genome used (i.e., as in the combined bim file):
	Shell: plink --file AF_EU_MHCI --cow --a2-allele AF_EU_MHCI_combined 6 2 '#' --make-bed --out AF_EU_MHCI_ref

	-Then, to increase the genotyping rate by removing SNPs with low genotyping rate:
	Shell: plink --bfile AF_EU_MHCI_ref  --keep-allele-order --cow --allow-no-sex --nonfounders --geno 0.5 --mind 0.5 --make-bed --out AF_EU_MHCI_ref_ge_mi

You could also find the resulting whole SNP data for MHCI and MHCII in the folder as "AF_EU_MHCI_ref_ge_mi" and "AF_EU_MHCII_ref_ge_mi", respectively.