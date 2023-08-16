
After obtaining non repeating vcf files separately per MHCI or MHCII per country, genotypes called with reads mapped more than 35 were set as missing using bcftools. This was run in cmd:

Shell:
	bcftools filter -S . -e 'FMT/DP<1  | FMT/DP>35' -o EG_nre_MHCI_high.vcf Usul_EG_non_repeat_MHCI.vcf

Some abbreviations: EG = Egypt, UG = Uganda, SA = South Africa, FL = Finland, NL = Netherlands, PT = Portugal.

After obtaining vcf files, each MHCI and MHCII files were sent to folders corresponding to the country name.