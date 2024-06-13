#' Generate AUC plots to assess the performance of feature selection methods
#'
#' @param dataset (data.frame) the dataset to be used.
#'  Last column must be the response variable.
#' @param imp_features_names (data.frame) each column contains the names
#'  of the features names sorted from most to least important
#'
#' @return (gtable) a plot with the AUCs of the different models
#' @export
get_acc_plot <- function(dataset, imp_features_names) {
  colnames(dataset)[ncol(dataset)] <- "y"

  # SVM ---
  message("SVM")
  svm_auc <- compute_accs(
    dataset, imp_features_names, stats::predict, e1071::svm
  )
  svm_plot <- acc_plot(svm_auc, "SVM")

  # KNN (k = sqrt(n)) ---
  message("KNN")
  knn_auc <- compute_accs(dataset, imp_features_names, stats::predict, e1071::gknn,
    k = floor(sqrt(nrow(dataset)))
  )
  knn_plot <- acc_plot(
    knn_auc,
    expression(bold(paste("KNN (k = ", sqrt(n), ")")))
  )

  # Naive Bayes ---
  message("Naive Bayes")
  nb_auc <- compute_accs(
    dataset, imp_features_names, stats::predict, e1071::naiveBayes
  )
  nb_plot <- acc_plot(nb_auc, "Naive Bayes")

  # Random Forest ---
  message("Random Forest")
  rf_auc <- compute_accs(
    dataset, imp_features_names, stats::predict, randomForest::randomForest
  )
  rf_plot <- acc_plot(
    rf_auc, expression(bold(paste("Random Forest (m = ", sqrt(p), ")")))
  )

  # combining all graphs in one grid ---
  combined_plot <- gridExtra::grid.arrange(svm_plot, knn_plot, nb_plot,
    rf_plot,
    nrow = 2, ncol = 2
  )
  invisible(combined_plot)
}
