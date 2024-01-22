#' Plot scree plot for feature importance
#'
#' @param features.scores A vector of feature importance scores
#' @param show.names a boolean indicating whether to show feature names or not
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' features.scores <- c(
#'   x1 = 0.8165005, x2 = -0.1178857, x3 = 0.1232284, x4 = -1.4277472,
#'   x5 = 1.6594211, x6 = -1.5554892, x7 = -0.7336138,
#'   x8 = -0.9416054, x9 = 0.9448299, x10 = -1.3629773
#' )
#' get_scree_plot(features.scores)
get_scree_plot <- function(features_scores, show_names = TRUE) {
  features_scores <- sort(features_scores, decreasing = TRUE)

  # using scree plot to choose cutoff for top features
  scree_plot <- ggplot2::ggplot(
    data.frame(index = seq_along(features_scores), score = features_scores),
    ggplot2::aes(x = index, y = score)
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(x = "Number of Features", y = "Importance Score") +
    ggplot2::scale_x_continuous(labels = function(x) {
      glue::glue("{x}\n({round(x / length(features.scores) * 100, 1)}%)")
    }) +
    ggplot2::geom_point()

  if (show_names) {
    if (is.null(names(features_scores))) {
      names(features_scores) <- seq_along(features_scores)
    }
    scree_plot <- scree_plot + ggplot2::geom_text(
      ggplot2::aes(label = names(features_scores)),
      hjust = 0,
      vjust = 0
    )
  }

  return(scree_plot)
}
