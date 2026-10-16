# rpfstop

Early stopping rules for random planted forests.

## Install
`randomPlantedForest` is not on CRAN; a prebuilt binary is available from R-universe
(no Rtools needed):

```r
install.packages("randomPlantedForest",
                 repos = c("https://plantedml.r-universe.dev", "https://cloud.r-project.org"))
devtools::install("rpfstop")
```

## Develop
```r
devtools::document("rpfstop")  # regenerate NAMESPACE and man/
devtools::test("rpfstop")
```

## Current functions
- `discrepancy_stop()` — first index where the residual norm drops below `kappa`.
- `rpf_residual_path()` — residual norm as a function of the number of splits (refits per grid point).
- `rpf_early_stop()` — combines the two and returns the stopped fit.
