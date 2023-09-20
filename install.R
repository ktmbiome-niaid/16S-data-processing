## This script lists all of the packages that need to be installed

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install("dada2")
BiocManager::install("phangorn")
BiocManager::install("phyloseq")
BiocManager::install("DECIPHER")

install.packages("ggplot2")