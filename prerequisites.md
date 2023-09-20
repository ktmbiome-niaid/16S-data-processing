Prerequisites for 16S Data Processing Training
================
Katie McCauley & Lauren Krausfeldt

Date: 2023-09-20

We’re excited you’re joining us for the upcoming 16S rRNA data
processing training! This document is intended to help set up your
computer and gather data before joining the workshop.

**Workshop Details:**

Date: October 2nd, 2023 (2-5pm ET)

## Computer Setup

We’ll do the workshop activities on your personal computer using R and
RStudio. You can download both without administrator privileges by
visiting the NIH Self Service Portal.

In addition to installing R, please also install a few packages that
we’ll use during the workshop by copying and pasting the lines below
into the “Console” (the panel in the lower left when you open a fresh
installation of Rstudio – it should have a carrot sign `>`). The script
can also be found at `install.R`.

``` r
setwd("~/Documents/training/16S-data-processing/")
cat(readLines("install.R", warn=FALSE), sep="\n")
```

    ## This script lists all of the packages that need to be installed

    if (!requireNamespace("BiocManager", quietly = TRUE)) {
      install.packages("BiocManager")
    }

    BiocManager::install("dada2")
    BiocManager::install("phangorn")
    BiocManager::install("phyloseq")
    BiocManager::install("DECIPHER")

    install.packages("ggplot2")

## Bringing Your Own Data

We plan to provide you with data to use on your own computer for
analyzing during the tutorial. However, if you would like to analyze
your own data, you are more than welcome to bring some! If you choose to
go this route, please be aware that your data will need to satisfy
certain criteria.

### Confirm Quality Information

First, you will need FASTQ-formatted data, which means raw sequence data
with quality information. If you look at your files in a text editor
(like TextEdit, Notepad++, vim, Sublime, etc), they may look something
like this:

    @M03213:59:000000000-AWR6D:1:1101:12406:1145 2:N:0:NCCTGAGC+NTATTAAG
    NGACTACTGGGGTTTCTAATCCTGTTTGCTCCCCACGCTTTCGCACATGAGCGTCAGTACATTCCCAAGNGGCTGCCTTCGCCTTCGGTATTCCTCCACATCTCTACGCNTTTCACCGCTACACGTGGAATTCTACCCCTCCCTAAAGTACTCTAGATTCCCAGTCTGAAATGCAATTCCCAGGTTAAGCCCGGGGCTTTCACACCTCACTTAAAAATCCGCCTGCGTGCCCTTTACGCCCAGTTATTCCGATTAACGCT
    +
    #8ACCGGGGGGGFFGGGGFGGGGGGGGGGGGGGGGGGGGGGGEGGFFGGGGGGGGGGGGGGFGFFGG<E#:BFFGGGFGGGGGCGGFEFGFFGGGGG<CFFCFGGGGGG#99@FFGGEGBGGFGGF8CFFFEFGGG<=9DC>DDGGD?C=,;EGFGBFDGFFGGGGCC;@EEFGGGGFGGGGGGGGGFGGFDEGGGAADE5;EEB*07/9<FFCFGFGD@=@EDFF>7>9;C?E</2(2.6;<=)7,9<?(*)6(7,,(-
    @M03213:59:000000000-AWR6D:1:1101:9817:1174 2:N:0:NCCTGAGC+CTATTAAG
    NGACTACTGGGGTTTCTAATCCTGTTCGCTACCCACGCTTTCGAGCCTCAGCGTCAGTTACAAGCCAGAGAGCCGCTTTCGCCACAGGTGTTCCTCCATATATCTACGCATTTCACCGCTACACATGGAATTCCACTCTCCCCTCTTGCACTCAAGTTAAACAGTTTCCAAAGCAAACTATGGTTGAGCCACAGCCTTTGACTTCAGACTTATCTAACCGCCTGCGCTCGCTTTCCGCCCACTAAATCCGTATAACTCTCG
    +
    #8ACCGGGGGGGFCGGGGGGGGGGGGFGGGGGGGGGGGGGGGGFGGGGFGFFGGGFGFGGGGGGG7CFGCFFGGGGBEGGGGGGGG?EGGGGGFGGGGGGGGFGGGGGGGE@DFAFGGGFGEGGGGGGGGGF<,@,DDFGGDGDG=EFGGGFF,=D?8DF,?EGGCFCF,DFFGGFCDGFGG8@E3<?FF8DG8BFDFEEFCBEFA7;@6;A@CGGC7915>8)702/8:4*4A+7=;((/(,/6<29(((*.//,,/)/(

We will cover what everything means when you join us, but to simply
confirm that you have “FASTQ” data, you want to look for the plus signs
every few lines.

### Demultiplex The Data

Second, these files need to be separated by sample (“demultiplexed”), so
if you are analyzing 20 samples, you’ll need to have 40 files. This
should be the default for most FASTQ-generating software now, but it’s
always good to check.

This also brings up another point – we will be focusing on paired-end
data where there are forward and reverse reads that we need to merge
together. You are welcome to bring single-end data, and I will do my
best to point out the modifications that are needed to analyze the data.

### Know the Sequencing Strategy

If you can, gather some information about the sequencing data which you
can typically obtain from a sequence facility. You’ll want to know the
answers to the following questions:

- How long are the reads?

- Are the reads “paired-end”?

- How long is the region of interest?

### Consider a Subset

Finally, if you have a large dataset, consider only working on \~5-10
samples during the workshop. The methods we use should be flexible
enough that you can apply the concepts to more samples after the
workshop, and we’re always available for questions!
(<bioinformatics@niaid.nih.gov>)

Looking forward to having you!

## Resources

We plan to draw heavily from the [tutorial developed by Benjamin
Callahan for DADA2](https://benjjneb.github.io/dada2/tutorial.html), and
encourage you to scan that tutorial prior to the training.
