
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EvaluateFeatureSelection

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R-CMD-check](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

Generates plots to visualize and assess the performance of feature
selection methods using supervised learning. It also provides functions
to plot scree plots to visualize good cutting points for the number of
features to be selected.

## Installation

You can install the development version of EvaluateFeatureSelection like
so:

``` r
install.packages("remotes")
remotes::install_github("Ahmad-Alsaleh/EvaluateFeatureSelection")
```

## Example

Generate a scree plot

``` r
library(EvaluateFeatureSelection)
features_scores <- c(x1 = 0.8165005, x2 = -0.1178857, ...)
get_scree_plot(features_scores)
```

<figure>
<figcaption aria-hidden="true">BAM Scores Scree Plot</figcaption>
<img
src="https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/assets/61240880/46da58ea-c7d0-4247-8d8b-af6758d2ff18"
alt="BAM Scores Scree Plot" />
</figure>

Similarly, you can use `get_auc_plot(...)` or `get_acc_plot(...)` to
evaluate the performance of feature selection methods using supervised
learning and AUC/accuracy as the performance metric.

<figure>
<figcaption aria-hidden="true">AUC of Different Feature Selection Methods</figcaption>
<img
src="https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/assets/61240880/5684b533-ae91-491e-8584-9f356a909a20"
alt="image" />
</figure>
