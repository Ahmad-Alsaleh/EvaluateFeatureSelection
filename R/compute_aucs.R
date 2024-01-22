# Computes all AUC values for each set of features with
# different subset sizes ----

# Arguments:
# `data`: the dataset used to fit the model. Last column contains the response
# 				and should be called `y`.
# `imp.features.names`: a data.frame where each column contains the names of the
# 				features to be used in fitting the model.
# `predict.func`: a function with two arguments: `model.fit` and `data.train` in
# 				this order and returns the predictions probabilities of levels(data$y)[2].
# 				If the model's predict function takes different arguments, use a wrapper
# 				function.
# `model.func`: a function with two arguments of the following names: `formula`
# 				and `data`. If the model's implementation takes different arguments,
# 				use a wrapper function.
# `...`: optional arguments passed to `model.func`.
# `folds`: a list of vectors where each vector contains the indices of
#               testing samples. If a single value is passed then it corresponds
#               to the number of folds.
# `subset.sizes`: a vector containing the different number of features to be
# 				used when fitting the model. If a single value is passed then it
# 				corresponds to the number of subset sizes to use.
compute_aucs <- function(
    dataset, imp_features_names, predict_func, model_func, ...,
    folds = 5, subset_sizes = 10) {
  if (length(folds) == 1) {
    folds <- caret::createFolds(dataset$y, k = folds)
  }

  if (length(subset_sizes) == 1) {
    subset_sizes <- floor(exp(
      seq(log(5),
        log(nrow(imp_features_names)),
        length.out = subset_sizes
      )
    ))
  }

  # `AUCs` stores the AUC values of a single fold
  # rows are number of features used (the size of the subset)
  # and columns are the features selection methods
  aucs <- matrix(
    nrow = length(subset_sizes), ncol = ncol(imp_features_names),
    dimnames = list(subset_sizes, colnames(imp_features_names))
  )

  # setting up parallel processing for CV (Windows not supported)
  if (Sys.info()["sysname"] == "Windows") {
    cores_n <- 1
    message(
      "Multi-core processing on is not currently supported for Windows.\nRunning on a single core\n" # nolint: line_length_linter.
    )
  } else {
    cores_n <- parallelly::availableCores()
    message("Multi-core processing using ", cores_n, " core(s)\n")
  }

  # cross validation to find AUC values
  cv_aucs <- parallel::mclapply(folds, mc.cores = cores_n, FUN = function(fold) {
    # cv.AUCs <- lapply(folds, FUN = function(fold) {
    for (feature_i in seq_along(imp_features_names)) {
      for (subset.size_i in seq_along(subset_sizes)) {
        set.seed(42)
        aucs[subset.size_i, feature_i] <- compute_auc(
          imp_features_names[feature_i], dataset[-fold, ], dataset[fold, ],
          predict_func, subset_sizes[subset.size_i], model_func, ...
        )
      } # next subset of features
    } # next feature selection method
    return(aucs %>% as.data.frame())
  })

  # combining AUCs values of the k folds (using the arithmetic mean)
  cv_aucs <- cv_aucs %>%
    abind::abind(along = 3) %>%
    apply(1:2, mean) %>%
    as.data.frame()
  cv_aucs <- cbind(subset.size = subset_sizes, cv_aucs)
  rownames(cv_aucs) <- NULL
  return(cv_aucs)
}
