# seqc

<!-- TOC -->

* [seqc](#seqc)
  * [Installation](#installation)
  * [Example](#example)
  * [Build Package](#build-package)
  * [Links & Additional Information](#links--additional-information)
    * [Make `R` aware of Bioconductor package dependencies](#make-r-aware-of-bioconductor-package-dependencies)
    * [Credits](#credits)

<!-- /TOC -->

The goal of seqc is to provide quality control figures of cuffdiff results using the cummeRbund package. It produces a HTML report.

## Installation

You can install the development version of seqc using:

```r
# install.packages('devtools')
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

## Links & Additional Information

### Make `R` aware of Bioconductor package dependencies

This tool relies on Bioconductor packages. To make `R` aware that some packages are to be downloaded from bioconductor you can use a trick of adding `biocViews:` in your `DESCRIPTION` file (see [DESCRIPTION](https://github.com/paulklemm/seqc/blob/master/DESCRIPTION)). This was described [in this issue](https://github.com/r-lib/devtools/issues/700)

### Credits

* This package adapts code provided by the [cummeRbund Manual](https://www.bioconductor.org/packages/3.7/bioc/vignettes/cummeRbund/inst/doc/cummeRbund-manual.pdf)
* It also adapts code of the [QC.R script](https://github.com/mpg-age-bioinformatics/htseq-tools/blob/master/QC.R) of the [mpg-age-bioinformatics htseq-tools](https://github.com/mpg-age-bioinformatics/htseq-tools)
