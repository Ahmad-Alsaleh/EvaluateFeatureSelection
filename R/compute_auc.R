# Computes a single AUC value for a given subset of features
# with a given subset size ----
compute_auc <- function(
    features, data_train, data_test,
    predict_func, subset_size, model_func, ...) {
  # creating formula
  formula <- features[1:subset_size, ] %>%
    paste0(collapse = "+") %>%
    paste0("y~", .) %>%
    stats::as.formula()

  # fitting model
  model_fit <- model_func(formula = formula, data = data_train, ...)

  # computing AUC value
  auc <- predict_func(model_fit, data_test) %>%
    ROCR::prediction(labels = data_test$y) %>%
    ROCR::performance(measure = "auc")
  auc <- auc@y.values[[1]]

  return(auc)
}
