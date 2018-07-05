# seqc

`seqc` provides quality control figures of `cuffdiff` results using the cummeRbund package. It produces a static HTML report. Optionally you can output the resulting figures separately.

---

<!-- TOC depthFrom:2 -->

- [Installation](#installation)
- [Example](#example)
- [Build Package](#build-package)
- [Links & Additional Information](#links--additional-information)
  - [Make `R` aware of Bioconductor package dependencies](#make-r-aware-of-bioconductor-package-dependencies)
  - [Credits](#credits)

<!-- /TOC -->

---

## Installation

You can install the development version of seqc using:

```r
# install.packages('devtools')
devtools::install_github("paulklemm/seqc")
```

## Example

Create a static HTML report based on a `cuffdiff` output and save all generated figures separately in the `output_path`.

```r
library(seqc)
createHTMLReport(
  cuffdiff_path = '/beegfs/scratch/bruening_scratch/pklemm/htseq-tools-test/cuffdiff_output/TuUp',
  output_path = '/beegfs/scratch/bruening_scratch/pklemm/seqcOutput',
  save_plots = TRUE,
  save_width = 10,
  save_height = 10,
  save_format = 'pdf'
)
```

## Build Package

If you want to customize the image, download this repository, adapt the code and run the following code to build and install it.

```r
roxygen2::roxygenise(); devtools::build(); devtools::install()
```

## Links & Additional Information

These information are not required for running the script and comprise lessons learned and hopefully useful information for fellow `R` users.

### Make `R` aware of Bioconductor package dependencies

This tool relies on Bioconductor packages. To make `R` aware that some packages are to be downloaded from bioconductor you can use a trick of adding `biocViews:` in your `DESCRIPTION` file (see [DESCRIPTION](https://github.com/paulklemm/seqc/blob/master/DESCRIPTION)). This was described [in this issue](https://github.com/r-lib/devtools/issues/700).

### Credits

- This package adapts code provided by the [cummeRbund Manual](https://www.bioconductor.org/packages/3.7/bioc/vignettes/cummeRbund/inst/doc/cummeRbund-manual.pdf)
- It also adapts code of the [QC.R script](https://github.com/mpg-age-bioinformatics/htseq-tools/blob/master/QC.R) of the [mpg-age-bioinformatics htseq-tools](https://github.com/mpg-age-bioinformatics/htseq-tools)
