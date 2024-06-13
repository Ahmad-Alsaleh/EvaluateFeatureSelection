#' Generate scree plot showing the feature importance
#'
#' @param features_scores A vector of feature importance scores
#' @param show_names a boolean indicating whether to show feature names or not
#' @param normalize a boolean indicating whether to use max normalization or not
#'
#' @return A ggplot2 object
#' @export
#'
#' @examples
#' features_scores <- c(
#'   x1 = 0.8165005, x2 = -0.1178857, x3 = 0.1232284, x4 = -1.4277472,
#'   x5 = 1.6594211, x6 = -1.5554892, x7 = -0.7336138,
#'   x8 = -0.9416054, x9 = 0.9448299, x10 = -1.3629773
#' )
#' get_scree_plot(features_scores)
get_scree_plot <- function(
    features_scores, show_names = TRUE, normalize = TRUE) {
  features_scores <- sort(features_scores, decreasing = TRUE)

  if (normalize) {
    features_scores <- features_scores / features_scores[1] # max normalization
    y_axis_label <- "Relative Importance"
  } else {
    y_axis_label <- "Importance Score"
  }

  # using scree plot to choose cutoff for top features
  scree_plot <- ggplot2::ggplot(
    data.frame(index = seq_along(features_scores), score = features_scores),
    ggplot2::aes_string(x = "index", y = "score")
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(x = "Feature", y = y_axis_label) +
    ggplot2::geom_point()

  if (show_names) {
    if (is.null(names(features_scores))) {
      names(features_scores) <- seq_along(features_scores)
    }
    scree_plot <- scree_plot + ggplot2::geom_text(
      ggplot2::aes(label = names(features_scores)),
      hjust = 0,
      vjust = 0,
      angle = 45
    )
  }

  return(scree_plot)
}
