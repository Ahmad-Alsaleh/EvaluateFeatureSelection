# Computes all AUC values for each set of features with different subset sizes ----

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
# `folds`: a list of vectors where each vector contains the indices of testing samples.
# 				If a single value is passed then it corresponds to the number of folds.
# `subset.sizes`: a vector containing the different number of features to be
# 				used when fitting the model. If a single value is passed then it
# 				corresponds to the number of subset sizes to use.
compute_aucs <- function(dataset, imp.features.names, predict.func, model.func, ..., folds = 5, subset.sizes = 10) {
  if (length(folds) == 1) {
    folds <- caret::createFolds(dataset$y, k = folds)
  }

  if (length(subset.sizes) == 1) {
    subset.sizes <- floor(exp(seq(log(5), log(nrow(imp.features.names)),
      length.out = subset.sizes
    )))
  }

  # `AUCs` stores the AUC values of a single fold
  # rows are number of features used (the size of the subset)
  # and columns are the features selection methods
  AUCs <- matrix(
    nrow = length(subset.sizes), ncol = ncol(imp.features.names),
    dimnames = list(subset.sizes, colnames(imp.features.names))
  )

  # setting up parallel processing for CV (Windows not supported)
  if (Sys.info()["sysname"] == "Windows") {
    cores_n <- 1
    message("Multi-core processing on is not currently supported for Windows.\nRunning on a single core\n")
  } else {
    cores_n <- parallelly::availableCores()
    message("Multi-core processing using ", cores_n, " core(s)\n")
  }

  # cross validation to find AUC values
  cv.AUCs <- parallel::mclapply(folds, mc.cores = cores_n, FUN = function(fold) {
  # cv.AUCs <- lapply(folds, FUN = function(fold) {
    for (feature_i in 1:ncol(imp.features.names)) {
      for (subset.size_i in 1:length(subset.sizes)) {
        set.seed(42)
        AUCs[subset.size_i, feature_i] <-
          compute_auc(
            imp.features.names[feature_i], dataset[-fold, ], dataset[fold, ],
            predict.func, subset.sizes[subset.size_i], model.func, ...
          )
      } # next subset of features
    } # next feature selection method
    return(AUCs %>% as.data.frame())
  })

  # combining AUCs values of the k folds (using the arithmetic mean)
  cv.AUCs <- cv.AUCs %>%
    abind::abind(along = 3) %>%
    apply(1:2, mean) %>%
    as.data.frame()
  cv.AUCs <- cbind(subset.size = subset.sizes, cv.AUCs)
  rownames(cv.AUCs) <- NULL
  return(cv.AUCs)
}
