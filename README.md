# seqc

The goal of seqc is to provide quality control figures of cuffdiff results using the cummeRbund package. It produces a HTML report.

## Installation

You can install the development version of seqc using:

```r
devtools::install_github("paulklemm/seqc")
```

## Example

This is a basic example which shows you how to solve a common problem:

```r
library(seqc)
createHTMLReport(
  cuffdiff_path = '/beegfs/scratch/bruening_scratch/pklemm/htseq-tools-test/cuffdiff_output/TuUp',
  output_path = '/beegfs/scratch/bruening_scratch/pklemm/seqcOutput',
  save_plots = TRUE
)
```

## Build Package

```r
roxygen2::roxygenise(); devtools::build(); devtools::install()
```

## Credits

* This package largely relies on code provided by the [cummeRbund Manual](https://www.bioconductor.org/packages/3.7/bioc/vignettes/cummeRbund/inst/doc/cummeRbund-manual.pdf)
* It also relies on the [QC.R script](https://github.com/mpg-age-bioinformatics/htseq-tools/blob/master/QC.R) of the [mpg-age-bioinformatics htseq-tools](https://github.com/mpg-age-bioinformatics/htseq-tools)
