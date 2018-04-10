#' Read in Cuffdiff result
#'
#' @export
#' @import cummeRbund magrittr
#' @param path Path to cuffdiff folder
#' @return cummeRbund cuff object
read_cuffdiff <- function(path) {
  cuff <- readCufflinks(dir = path)
  cuff %>% return()
}

#' Quality Control: Dispersion plot
#'
#' @export
#' @import cummeRbund magrittr
#' @param cuff cummeRbund cuff object
#' @return Plot object
dispersionPlot <- function(cuff) {
  genes(cuff) %>%
    dispersionPlot() %>%
    return()
}

#' Identify outlier replicates
#'
#' @export
#' @import cummeRbund magrittr
#' @param cuff cummeRbund cuff object
#' @return Plot object
csBoxPlot <- function(cuff) {
  genes(cuff) %>%
    csBoxplot(replicates = TRUE) %>%
    return()
}

#' Make cummeRbund report from Cuffdiff result
#'
#' @export
#' @import cummeRbund magrittr ggplot2 rmarkdown
#' @param cuffdiff_path Path to cuffdiff folder
#' @param output_path Path to HTML output
#' @return cummeRbund cuff object
createReport <- function(cuffdiff_path, output_path) {
  path_to_report <- system.file("rmd/Report.Rmd", package="seqc")
  render(path_to_report, params = list(
    cuffdiff_path = cuffdiff_path
    ),
    output_dir = output_path
  )
}