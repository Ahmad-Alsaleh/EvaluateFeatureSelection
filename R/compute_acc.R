# Computes a single AUC value for a given subset of features
# with a given subset size ----
compute_acc <- function(
    features, data_train, data_test,
    predict_func, subset_size, model_func, ...) {
  # fitting model
  model_fit <- model_func(data_train[features[1:subset_size, ]], data_train$y, ...)

  # computing AUC value
  pred <- predict_func(model_fit, data_test[features[1:subset_size, ]])
  acctual <- data_test$y
  acc <- sum(pred == acctual) / length(acctual)

  return(acc)
}
