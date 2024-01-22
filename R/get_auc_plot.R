#' Generate AUC plots to assess the performance of feature selection methods
#'
#' @param dataset (data.frame) the dataset to be used.
#'  Last column must be the response variable.
#' @param imp_features_names (data.frame) each column contains the names
#'  of the features names sorted from most to least important
#'
#' @return (gtable) a plot with the AUCs of the different models
#' @export
get_auc_plot <- function(dataset, imp_features_names) {
  colnames(dataset)[ncol(dataset)] <- "y"

  # SVM ---
  message("SVM")
  svm_predict_func <- function(model_fit, data_test) {
    attr(
      stats::predict(model_fit, data_test, probability = TRUE), "probabilities"
    )[, levels(data_test$y)[2]]
  }
  svm_auc <- compute_aucs(dataset, imp_features_names, svm_predict_func,
    e1071::svm,
    probability = TRUE
  )
  svm_plot <- auc_plot(svm_auc, "SVM")

  # KNN (k = sqrt(n)) ---
  message("KNN")
  knn_predict_func <- function(model_fit, data_test) {
    stats::predict(
      model_fit, data_test[, -ncol(data_test)],
      type = "prob"
    )[, levels(data_test$y)[2]]
  }
  knn_auc <- compute_aucs(dataset, imp_features_names, knn_predict_func,
    e1071::gknn,
    k = floor(sqrt(nrow(dataset)))
  )
  knn_plot <- auc_plot(
    knn_auc,
    expression(bold(paste("KNN (k = ", sqrt(n), ")")))
  )

  # Naive Bayes ---
  message("Naive Bayes")
  nb_predict_func <- function(model_fit, data_test) {
    stats::predict(model_fit, data_test[, -ncol(data_test)], type = "raw")[, levels(data_test$y)[2]]
  }
  nb_auc <- compute_aucs(
    dataset, imp_features_names, nb_predict_func,
    e1071::naiveBayes
  )
  nb_plot <- auc_plot(nb_auc, "Naive Bayes")

  # Random Forest ---
  message("Random Forest")
  rf_predict_func <- function(model_fit, data_test) {
    stats::predict(
      model_fit, data_test[, -ncol(data_test)],
      type = "prob"
    )[, levels(data_test$y)[2]]
  }
  rf_auc <- compute_aucs(
    dataset, imp_features_names, rf_predict_func,
    randomForest::randomForest
  )
  rf_plot <- auc_plot(
    rf_auc,
    expression(bold(paste("Random Forest (m = ", sqrt(p), ")")))
  )

  # combining all graphs in one grid ---
  combined_plot <- gridExtra::grid.arrange(svm_plot, knn_plot, nb_plot,
    rf_plot,
    nrow = 2, ncol = 2
  )
  invisible(combined_plot)
}
