#!/usr/bin/env python3

"""
Author: Faik Usul
Description: It extracts the variants given the gene regions (MHCI genes and
    MHCII genes, separately) in the vcf file format.
Usage: python3 extract_snp_in_gene_adj <gene_list_filename> <vcf_infilename>
"""

from sys import argv

def extract_gene_pos(gene_list_filename):
    """Parses the gene list file to get gene positions in a dictionary.

    Keyword arguments:
        gene_list_filename: a string, contains gene names and positions in a
        tsv format
	Returns:
        a dictionary; keys are gene names, values are strings of
        "gene start-gene end"
	"""

    with open(gene_list_filename) as gene_list:

        dict_gene_list = dict()
        first_line = gene_list.readline()
        for line in gene_list:
            line_list = line.strip().split()
            gene_name = line_list[3]
            gene_range = line_list[1] + "-" + line_list[2]
            dict_gene_list[gene_name] = gene_range

    return dict_gene_list


def extract_non_repeat_snp(vcf_infilename):
    """Parses the vcf file to extract non-repeating variants to be written in
    vcf format

    Keyword arguments:
        vcf_infilename: a string, contains variants per country
	Returns:
        a string; vcf filename to be written
	"""

    vcf_outfilename = vcf_infilename[:-4] + "_non_repeat" + ".vcf"
    with open(vcf_infilename) as vcf_infile:
        with open(vcf_outfilename, "a", newline = "\n") as vcf_outfile:

            pos_normal = 0
            pos_abnormal = 0
            for line in vcf_infile:

                if line.startswith("#"):

                    vcf_outfile.write(line)

                else:

                    line_list = line.strip().split()
                    pos = int(line_list[1])

                    if pos > pos_normal and pos > pos_abnormal:
                        pos_normal = pos
                        vcf_outfile.write(line)
                    else:
                        pos_abnormal = pos_normal

    return vcf_outfilename


def extract_snp_from_vcf(vcf_infilename_ext, dict_gene_list):
    """Parses the vcf file to extract the variants given a gene position
    dictionary to be written in vcf file.

    Keyword arguments:
        vcf_infilename_ext: a string, vcf file containing non-repeating variants
	Returns:
        None
	"""

    vcf_outfilename = vcf_infilename_ext[:-4] + "_MHCII" + ".vcf"# change this
    with open(vcf_infilename_ext) as vcf_infile:
        with open(vcf_outfilename, "a", newline = "\n") as vcf_outfile:

            for line in vcf_infile:

                if line.startswith("#"):
                    vcf_outfile.write(line)

                else:

                    line_list = line.strip().split()
                    pos = line_list[1]

                    for gene in dict_gene_list:

                        gene_start, gene_end = dict_gene_list[gene].split("-")
                        if int(gene_start) <= int(pos) <= int(gene_end):

                            vcf_outfile.write(line)

    return None

'''
def check_ref_alleles(vcf_infilename, bim_filename):

    with open(vcf_infilename) as vcf_infile:
        with open(bim_filename) as bim_file:

            for line_vcf, line_bim in zip(vcf_infile, bim_file):

                line_vcflist = line_vcf.strip().split()
                line_bimlist = line_bim.strip().split()

                list_alt_vcf = line_vcflist[4].split(",")
                str_alt_freq_vcf = line_vcflist[7]
                list_alt_freq_vcf = str_alt_freq_vcf.split(";")[3][3:].split(",")
                list_alt_freq_vcf = [float(x) for x in list_alt_freq_vcf]
                alt_bim = line_bimlist[4]
                if alt_bim == list_alt_vcf[list_alt_freq_vcf.index(max(list_alt_freq_vcf))]:

                    pass

                else:

                    print(f"not the max freq alt {list_alt_vcf[list_alt_freq_vcf.index(max(list_alt_freq_vcf))]} at pos {line_vcflist[1]}")

    return None
'''

def main():
    ''' The main funtion'''

    gene_list_filename = argv[1]
    vcf_infilename = argv[2]
    dict_gene_list = extract_gene_pos(gene_list_filename)
    vcf_infilename_ext = extract_non_repeat_snp(vcf_infilename)
    extract_snp_from_vcf(vcf_infilename_ext, dict_gene_list)
    # check_ref_alleles(vcf_infilename, bim_filename)


# The function calling starts here.
if __name__ == '__main__':

    main()
