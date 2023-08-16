#!/usr/bin/env python3

"""
Author: Faik Usul
Description: Creates a combined bim file of common SNPs in two countries and
    novel SNPs for each of two countries to be written. Uses the combined bim
    file to update the ped files of two countries to be written.
Usage: python3 combination_script.py <first_bim_name> <second_bim_name>
    <first_ped_name> <second_ped_name>
"""

import numpy as np
import pandas as pd
from sys import argv

def my_update(first_bim_name, second_bim_name, first_ped_name, second_ped_name):
    """Parses two bim files to combine them to be written, and using combined
    bim file, updates the two ped files to be written (README for more info).

    Keyword arguments:
        first_bim_name: a string, bim file of a country of MHCI or MHCII.
        second_bim_name: a string, bim file of a country of MHCI or MHCII.
        first_ped_name: a string, ped file of a country of MHCI or MHCII.
        second_ped_name: a string, ped file of a country of MHCI or MHCII.
	Returns:
        None
	"""
    first_bim = pd.read_csv(first_bim_name, sep = "\t", header = None, names = ["Chr", "Var_ID", "Something", "Loc", "A1", "A2"])
    first_bim.set_index(first_bim.Loc, inplace = True)
    first_bim.index.rename("My_Ind", inplace = True)
    second_bim = pd.read_csv(second_bim_name, sep = "\t", header = None, names = ["Chr", "Var_ID", "Something", "Loc", "A1", "A2"])
    second_bim.set_index(second_bim.Loc, inplace = True)
    second_bim.index.rename("My_Ind", inplace = True)
    # common SNPs are found here.
    common_bim = first_bim.index.intersection(second_bim.index)
    common_bim = list(common_bim)
    common_bim.sort()
    # prints "yes" in case indeed the reference alleles are the same in bim files
    print(np.all(first_bim.loc[common_bim, "A2"] == second_bim.loc[common_bim, "A2"]))
    first_bim_common = first_bim.loc[common_bim]
    second_bim_common = second_bim.loc[common_bim]
    # if the alternative alleles are the same in the common SNPs, they are kept
    first_bim_common_A1same = first_bim_common.loc[first_bim_common.A1 == second_bim_common.A1]
    # SNPs specific to the first bim file are found
    var_only_first = first_bim.index.difference(second_bim.index)
    var_only_first = list(var_only_first)
    var_only_first = sorted(var_only_first)
    # first the combination of the common SNPs with the same alternative and the SNPs specific to the first bim is created
    first_bim_common_A1same_firstonly = pd.concat([first_bim_common_A1same, first_bim.loc[var_only_first]])
    first_bim_ext_first = first_bim_common_A1same_firstonly.sort_index(axis = 0)
    # SNPs specific to the second bim are found
    var_only_second = second_bim.index.difference(first_bim.index)
    var_only_second = list(var_only_second)
    var_only_second = sorted(var_only_second)
    # finally, the combined SNPs of common ones and specific ones are created.
    first_bim_ext = pd.concat([first_bim_ext_first, second_bim.loc[var_only_second]])
    first_bim_ext = first_bim_ext.sort_index(axis = 0)
    # bim outname is created manually here according to the combination step to be written.
    bim_outname = "EG_SA_UG_MHCI_combined.bim"
    first_bim_ext.to_csv(bim_outname, sep="\t", header=False, index=False)

    # columns names of the coming ped file are created containing the variant IDs
    df_column_names = [1,2,3,4,5,6] + list(first_bim.index)
    # first ped file is read
    first_ped = pd.read_csv(first_ped_name, sep = " ", header = None, names = df_column_names)
    index_df_column_names = pd.Index(df_column_names)
    # common SNPs are found between the combined bim file and the ped file
    common_ext_bimfirst = index_df_column_names.intersection(first_bim_ext.index)
    common_ext_bimfirst = list(common_ext_bimfirst)
    common_ext_bimfirst.sort()
    # common SNPs are kept in a dataframe of ped file
    first_ped_common = first_ped[[1,2,3,4,5,6] + common_ext_bimfirst]
    # SNPs specific to the combined bim file are found (novel SNPs)
    differ_ext_first = first_bim_ext.index.difference(df_column_names)
    differ_ext_first = list(differ_ext_first)
    differ_ext_first.sort()

    # Novel SNPs (locations) are traversed to add the genotypes as homozygote reference corresponding to them.
    for i in differ_ext_first:
        my_value = first_bim_ext.loc[i, "A2"] * 2
        first_ped_common[i] = my_value

    first_ped_updated = first_ped_common.sort_index(axis = 1)
    # ped file to be written is named manually here according to the combination step.
    first_ped_outname = "EG_SA_viaUG_nre_MHCI_high_snps.ped"
    first_ped_updated.to_csv(first_ped_outname, sep=" ", header=False, index=False)

    # exactly the same steps are followed here for the second ped file to be written
    df_column_names_second = [1,2,3,4,5,6] + list(second_bim.index)
    second_ped = pd.read_csv(second_ped_name, sep = " ", header = None, names = df_column_names_second)
    index_df_column_names_second = pd.Index(df_column_names_second)
    common_ext_bimsecond = index_df_column_names_second.intersection(first_bim_ext.index)
    common_ext_bimsecond = list(common_ext_bimsecond)
    common_ext_bimsecond.sort()
    second_ped_common = second_ped[[1,2,3,4,5,6] + common_ext_bimsecond]
    differ_ext_second = first_bim_ext.index.difference(df_column_names_second)
    differ_ext_second = list(differ_ext_second)
    differ_ext_second.sort()

    for i in differ_ext_second:
        my_value = first_bim_ext.loc[i, "A2"] * 2
        second_ped_common[i] = my_value

    second_ped_updated = second_ped_common.sort_index(axis = 1)
    second_ped_outname = "UG_viaEG_SA_nre_MHCI_high_snps.ped"
    second_ped_updated.to_csv(second_ped_outname, sep=" ", header=False, index=False)

def main():
    """The main function """

    first_bim_name = argv[1]
    second_bim_name = argv[2]
    first_ped_name = argv[3]
    second_ped_name = argv[4]

    my_update(first_bim_name, second_bim_name, first_ped_name, second_ped_name)

# Function calling starts here.
if __name__ == "__main__":

    main()
