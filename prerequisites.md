Prerequisites for 16S Data Processing Training
================
Katie McCauley

Date: 2024-10-23

We’re excited you’re joining us for the upcoming 16S rRNA data
processing training! This document is intended to help set up your
computer and gather data before joining the workshop.

**Workshop Details:**

Date: October 23rd, 2024 (2-5pm ET)

## Computer Setup

We’ll do the workshop activities on your local computer (in other words, not using a server or web tool) using R and
RStudio. You can download both on your NIH computer without administrator privileges by
visiting the NIH Self Service Portal.

In addition to installing R, please also install a few packages that
we’ll use during the workshop by copying and pasting the lines below
into the “Console” (the panel in the lower left when you open a fresh
installation of Rstudio – it should have a carrot sign `>`). The script
can also be found at `install.R`.

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

### Binder

For this training, I would also like to try a tool called "Binder", which provides an analysis environment that has all of the packages that we need pre-installed. You can access it using the badge on the homepage README file, or by clicking the badge below. Both will take you to the same location.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ktmbiome-niaid/base-binder-env/HEAD?urlpath=git-pull?repo=https://github.com/ktmbiome-niaid/16S-data-processing)

## Download Materials

You might want to consider downloading the materials prior to the
training (they’re about 2.5 GB because I include the practice data).
Both methods can be slow, so I suggest considering turning off the NIH VPN
if you’re using one.

### Using git clone

To use the command line git (if you have it installed), you can do the
following in your preferred directory.

    git clone https://github.com/ktmbiome-niaid/16S-data-processing.git

### Downloading a Zip File

You can also download a zip file of all materials.
[The link here](https://github.com/ktmbiome-niaid/16S-data-processing/archive/refs/heads/main.zip) will start the download, but you can also obtain the files by visiting the main
repository page
(<https://github.com/ktmbiome-niaid/16S-data-processing/>) and
then clicking on the green button that says `<Code>`. At the bottom of
the menu, there is a button called `Download Zip` which will begin
downloading the zip file.

## Bringing Your Own Data

We will provide you with data to use for
analysis during the tutorial. However, if you would like to analyze
your own data, please bring some bring some! If you choose to
go this route, be aware that your data will need to satisfy
certain criteria:

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

### Know the Sequencing Strategy

If you can, gather some information about the sequencing data which you
can typically obtain from a sequence facility. You’ll want to know the
answers to the following questions:

- How long are the reads?

- Are the reads “paired-end”?

- How long is the region of interest?

### Confirm Data is “Demultiplexed”

These files need to be separated by sample (“demultiplexed”). This
should be the default for most FASTQ-generating software now, but it’s
always good to check. To confirm, you should either have one or two
files per sample. If you have two files per sample, this is typically
“paired-end” which means that the forward reads are separate from the
reverse reads, and this is typically noted by a “\_1”/“\_2” or
“\_R1”/“\_R2” somewhere in the file name.

If your data is not demultiplexed, or you’re unsure, and you could use
some help, feel free to reach out to Katie before the workshop
(<kathryn.mccauley@nih.gov>).

This also brings up another point – we will be focusing on paired-end
data. You are welcome to bring single-end data, and I will do my best to
point out the modifications needed to analyze the data.

### Consider a Subset

Finally, if you have a large dataset, consider only working on \~10-20
samples during the workshop. The methods we use should be flexible
enough that you can apply the concepts to more samples after the
workshop, and we’re always available for questions!

Visit us at [bioinformatics.niaid.nih.gov](https://bioinformatics.niaid.nih.gov) to see more trainings or reach out to our team.

Looking forward to having you!

## Resources

We plan to draw heavily from the [tutorial developed by Benjamin
Callahan for DADA2](https://benjjneb.github.io/dada2/tutorial.html), and
encourage you to scan that tutorial prior to the training.
