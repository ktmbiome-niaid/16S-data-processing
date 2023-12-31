## This script lists all of the packages that need to be installed

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install("dada2")
BiocManager::install("phangorn")
BiocManager::install("phyloseq")
BiocManager::install("DECIPHER")
BiocManager::install("ShortRead")
BiocManager::install("Biostrings")

install.packages("ggplot2")