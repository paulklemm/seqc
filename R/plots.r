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

savePlot <- function(path, filename) {

}