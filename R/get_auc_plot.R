#' Generate AUC plots to assess the performance of feature selection methods
#'
#' @param dataset (data.frame) the dataset to be used. Last column must be the response variable.
#' @param imp.features.names (data.frame) each column contains the names of the features names sorted from most to least important
#'
#' @return (gtable) a plot with the AUCs of the different models
#' @export
get_auc_plot <- function(dataset, imp.features.names) {
  colnames(dataset)[ncol(dataset)] <- "y"

  # SVM ---
  message("SVM")
  SVM.predict.func <- function(model.fit, data.test) {
    attr(stats::predict(model.fit, data.test, probability = T), "probabilities")[, levels(data.test$y)[2]]
  }
  SVM.AUC <- compute_aucs(dataset, imp.features.names, SVM.predict.func, e1071::svm, probability = T)
  SVM.plot <- auc_plot(SVM.AUC, "SVM")

  # KNN (k = sqrt(n)) ---
  message("KNN")
  KNN.predict.func <- function(model.fit, data.test) {
    stats::predict(model.fit, data.test[, -ncol(data.test)], type = "prob")[, levels(data.test$y)[2]]
  }
  KNN.AUC <- compute_aucs(dataset, imp.features.names, KNN.predict.func, e1071::gknn, k = floor(sqrt(nrow(dataset))))
  KNN.plot <- auc_plot(KNN.AUC, expression(bold(paste("KNN (k = ", sqrt(n), ")"))))

  # Naive Bayes ---
  message("Naive Bayes")
  NB.predict.func <- function(model.fit, data.test) {
    stats::predict(model.fit, data.test[, -ncol(data.test)], type = "raw")[, levels(data.test$y)[2]]
  }
  NB.AUC <- compute_aucs(dataset, imp.features.names, NB.predict.func, e1071::naiveBayes)
  NB.plot <- auc_plot(NB.AUC, "Naive Bayes")

  # Random Forest ---
  message("Random Forest")
  RF.predict.func <- function(model.fit, data.test) {
    stats::predict(model.fit, data.test[, -ncol(data.test)], type = "prob")[, levels(data.test$y)[2]]
  }
  RF.AUC <- compute_aucs(dataset, imp.features.names, RF.predict.func, randomForest::randomForest)
  RF.plot <- auc_plot(RF.AUC, expression(bold(paste("Random Forest (m = ", sqrt(p), ")"))))

  # combining all graphs in one grid ---
  combined_plot <- gridExtra::grid.arrange(SVM.plot, KNN.plot, NB.plot, RF.plot, nrow = 2, ncol = 2)
  return(combined_plot)
}
