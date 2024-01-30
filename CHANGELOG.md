# CHANGELOG


## Unreleased

### Build

* build: bump version to 1.0.0 ([`5f9b698`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/5f9b6986142ac3920b241d335902c01c293f1377))

* build: add .env and venv to ignore files ([`516d180`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/516d180ce343eb70a9030ca07f8fd5029bea8c8e))

* build: add minimum R version ([`ffe819c`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/ffe819cd96df1b9caf37e7e6d92e0d75fdf5755e))

* build: add packages used so far to Imports in DESCREPTION ([`db05745`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/db057457d13ad1f03e143cca4b8e429530f82469))

### Chore

* chore: add .vscode to .gitignore and .Rbuildignore ([`a794fc5`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/a794fc50421e777be2890874ff4f37a7849c2a01))

* chore: add magrittr pipe for internal use ([`8364bc7`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/8364bc7fcc39e7a6ffcc54273eed19ab67b68ce6))

### Documentation

* docs: update the main package documentation ([`aaedc23`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/aaedc236337de74dbaf285d963a572c7a242b8b6))

* docs: update package docs ([`8b27790`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/8b27790f9260b8b43d8c10cbe3e4baff2a4b6be5))

* docs: add package level `.Rd` documentation ([`c1e1c78`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/c1e1c78bf5b89e13578e57272188a71c5685f7ee))

* docs: fix typos in docs of private functions ([`4815aec`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/4815aecaec34a77e37e910f4ceac7a38e3262051))

### Feature

* feat: normalize features scores in `get_scree_plot()` ([`8ac541c`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/8ac541ce0882f35fedc2ed8ad87c54c1751db21c))

* feat: add get_scree_plot() function ([`e6e15ec`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/e6e15ec88b831d7711d85835c667e8942ad29bbe))

* feat: add get_auc_plot() function ([`3ccbc1f`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/3ccbc1fbbab90f82ec54e43f43f257f30db581e4))

* feat: add plot() function ([`4887979`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/4887979766d7e063a6010952c726c89bffd0fcde))

* feat: add compute_aucs() function ([`d192cd8`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/d192cd801a9a4dcb1fb380de8b5d02c30f726b40))

* feat: add compute_auc() function ([`f443dd9`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/f443dd9f8b40952dddbe224d7620e4de6eb8fbea))

* feat: add reverselog_trans() function ([`10abff6`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/10abff6aa4ef2f6c4559f82d8de2b2c680ab35d4))

### Fix

* fix: replace variable name AUC.values with auc_values ([`dc93c8e`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/dc93c8e3f868d914d2d0117db4e9f4ff497b31a4))

* fix: correct variable name in get_scree_plot() ([`b1a96d2`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/b1a96d2cf9e56fa21ee016ce0983576c44467449))

* fix: replace as.formula() with stats::as.formula() ([`18bb735`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/18bb735a19aedda2cd9a20051e04cd1cea01bf79))

### Refactor

* refactor: remove unused function `reverselog_trans()` ([`a91057c`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/a91057c84d879c4578ee2824f624a3ed0d79ec10))

* refactor: fix more issues from linter ([`6fbc4c7`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/6fbc4c7abf47b20b003876256dd81aca03a815e5))

* refactor: fix issue proposed by the linter ([`614dec7`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/614dec7e574eacef17aa2e5c1de021afa09b7782))

* refactor: make returned value in get_auc_plot() invisible ([`3d7a9b8`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/3d7a9b8bc533edabfc944ef41a61122cfb2e0e43))

* refactor: rename plot() to auc_plot() ([`5818b60`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/5818b602cec5f3d538cea3afa3621097365e6890))

### Test

* test: add test for reverselog_trans() ([`68332db`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/68332db6bb25bfa9d8ab5b306d971c4803b17dcd))

### Unknown

* format spelling.R ([`8adb856`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/8adb856b57cd8394cd87bd30de0d673c5284202c))

* add figure to man/ folder ([`743597d`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/743597db07e86972ac73a5a778f062c9f5bf12a4))

* add code coverage checks ([`933a691`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/933a691dd1b233b23f457b29d129b669654ebe37))

* using pkgdown and github pages ([`da28f6d`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/da28f6d64692d96ca6900df840c6e3b383f19bf6))

* update README ([`55c5f44`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/55c5f449c2874867b93df1a352b371b30458b417))

* update DESCREPTION ([`90ed0aa`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/90ed0aa55efe4ced59e35d07b096c1909bc89177))

* use spelling check ([`bcdae20`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/bcdae20b3108ff9ab5ecd76c74f352c4fded1d95))

* add .gitignore and .Rbuildignore files ([`5be8477`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/5be8477f22c20889c61114129057bf205315a982))

* add files to .github folder ([`2627f5c`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/2627f5cdcffda7e24ca91a3eef79c92bcc8e05a2))

* Add GitHub links to DESCRIPTION ([`0f0c3dd`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/0f0c3dd7776681878b0a48e96ab35a875911350e))

* Initial commit ([`494e26f`](https://github.com/Ahmad-Alsaleh/EvaluateFeatureSelection/commit/494e26f0e7df98ae1a9f557f7b445b2369ff8a98))

