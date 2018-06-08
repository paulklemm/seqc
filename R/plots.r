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
  render(path_to_report, intermediates_dir = output_path, params = list(
    cuffdiff_path = cuffdiff_path,
    save_plots_path = output_path,
    save_plots = save_plots
    ),
    output_dir = output_path,
    output_options=list(
      self_contained = TRUE
    )
  )
}

#' Save image and return it
#' 
#' @export
#' @import magrittr ggplot2
#' @param plot ggplot2 plot object
#' @param plot_name name of ggplot file
#' @param output_path path to output
#' @param save_plot Save plot to disk
#' @param is_ggplot Plot is ggplot object or not
saveReturnPlot <- function(plot, save_plot = TRUE, plot_name = '', output_path = '', is_ggplot = TRUE) {
  if (save_plot) {
    plot_filename <- paste0(output_path, '/', plot_name, '.pdf')
    if (is_ggplot) {
      # Output the plot to the path
      ggplot2::ggsave(plot = plot, filename = plot_filename)
    } else {
      # Is base plot
      pdf(plot_filename)
      plot %>% print()
      dev.off()
    }
  }
  # Return output
  plot %>% return()
}
