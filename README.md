# seqc

The goal of seqc is to provide quality control figures of cuffdiff results using the cummeRbund package.

## Installation

You can install the development version of seqc using:

```r
devtools::install_github("paulklemm/seqc")
```

## Example

This is a basic example which shows you how to solve a common problem:

```r
library(seqc)
library(magrittr)
cuff <- read_cuffdiff('/beegfs/scratch/bruening_scratch/pklemm/htseq-tools-test/cuffdiff_output/TuUp')
disp_plot <- cuff %>% dispersionPlot()
# Print out results
print("Summary of cuffdiff dataset")
cuff %>% print()
disp_plot %>% print()
# Save the plot
library(ggplot2)
disp_plot %>% ggsave("disp_plot.pdf")
```

## Generate Report

```r
createHTMLReport(cuffdiff_path = '/beegfs/scratch/bruening_scratch/pklemm/htseq-tools-test/cuffdiff_output/TuUp', output_path = '/beegfs/scratch/bruening_scratch/pklemm/seqcOutput', save_plots = TRUE)
```

## Build Package

```r
roxygen2::roxygenise(); devtools::build(); devtools::install()
```
