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
dispPlot <- function(cuff) {
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

#' Cross replicate variability
#'
#' @export
#' @import cummeRbund magrittr
#' @param cuff cummeRbund cuff object
#' @param type Type can be either "genes" or "isoforms"
#' @return Plot object
fpkmSCVPlotWrap <- function(cuff, type = 'genes') {
  if (type == 'genes') {
    input <- cuff %>% genes()
  } else {
    input <- cuff %>% isoforms()
  }
  input %>%
    fpkmSCVPlot() %>%
    return()
}

#' Make cummeRbund report from Cuffdiff result
#'
#' @export
#' @import magrittr ggplot2 rmarkdown
#' @param cuffdiff_path Path to cuffdiff folder
#' @param output_path Path to HTML output
#' @param save_plots Save plots into seperate files
#' @return cummeRbund cuff object
createHTMLReport <- function(cuffdiff_path, output_path, save_plots) {
  # https://stackoverflow.com/questions/30377213/how-to-include-rmarkdown-file-in-r-package
  path_to_report <- system.file("rmd/Report.Rmd", package="seqc")
  # Render the document and put it into the output dir
  render(path_to_report, params = list(
    cuffdiff_path = cuffdiff_path,
    save_plots_path = output_path,
    save_plots = save_plots
    ),
    output_dir = output_path
  )
}

#' Save ggplot and print it
#' 
#' @export
#' @import magrittr ggplot2
#' @param plot ggplot2 plot object
#' @param plot_name name of ggplot file
#' @param output_path path to output
#' @param save_plot Save plot to disk
saveAndPrint <- function(plot, save_plot = TRUE, plot_name = '', output_path = '') {
  if (save_plot) {
    # Output the plot to the path
    ggplot2::ggsave(plot = plot, filename = paste0(output_path, '/', plot_name, '.pdf'))
  }
  # Print output
  plot %>% print()
}
