# Computes a single AUC value for a given subset of features with a given subset size ----
compute_auc <- function(features, data.train, data.test, predict.func, subset.size, model.func, ...) {
  # creating formula
  formula <- features[1:subset.size, ] %>%
    paste0(collapse = "+") %>%
    paste0("y~", .) %>%
    as.formula()
  # fitting model
  model.fit <- model.func(formula = formula, data = data.train, ...)

  # computing AUC value
  AUC <- predict.func(model.fit, data.test) %>%
    ROCR::prediction(labels = data.test$y) %>%
    ROCR::performance(measure = "auc")
  AUC <- AUC@y.values[[1]]

  return(AUC)
}
