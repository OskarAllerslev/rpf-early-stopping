#' Discrepancy-principle stopping index
#'
#' Returns the first index `t` with `residual_norm[t] <= kappa`, i.e. the
#' stopping time \eqn{\tau = \min\{t : \|Y - \hat F_t\|_n^2 \le \kappa\}}.
#' If the threshold is never reached, the last index is returned.
#'
#' @param residual_norm Numeric vector of squared empirical residual norms
#'   along the fitting path.
#' @param kappa Positive threshold, typically of the order of the noise variance.
#' @return Integer index into `residual_norm`.
#' @export
discrepancy_stop <- function(residual_norm, kappa) {
  stopifnot(is.numeric(residual_norm), length(residual_norm) > 0, kappa > 0)
  hit <- which(residual_norm <= kappa)
  if (length(hit) == 0) length(residual_norm) else hit[1]
}

#' Residual path of a random planted forest over the number of splits
#'
#' Refits [randomPlantedForest::rpf()] for each value in `splits_grid` with the
#' same seed and records the squared empirical residual norm
#' \eqn{\|Y - \hat F_s\|_n^2}. Slow (one fit per grid point) but needs no
#' changes to the C++ core.
#'
#' Note: with a fixed seed the fits are not guaranteed to be nested in `s`;
#' this is to be checked before relying on monotonicity of the path.
#'
#' @param x Predictors (data frame or matrix).
#' @param y Numeric response.
#' @param splits_grid Increasing integer vector of split counts.
#' @param seed Seed used before every fit.
#' @param ... Further arguments passed to [randomPlantedForest::rpf()].
#' @return Data frame with columns `splits` and `residual_norm`.
#' @export
rpf_residual_path <- function(x, y, splits_grid, seed = 1L, ...) {
  stopifnot(is.numeric(y), length(splits_grid) > 0, !is.unsorted(splits_grid))
  residual_norm <- vapply(splits_grid, function(s) {
    set.seed(seed)
    fit <- randomPlantedForest::rpf(x, y, splits = s, ...)
    pred <- stats::predict(fit, x)[[".pred"]]
    mean((y - pred)^2)
  }, numeric(1))
  data.frame(splits = splits_grid, residual_norm = residual_norm)
}

#' Early-stopped random planted forest
#'
#' Computes the residual path over `splits_grid`, picks the number of splits by
#' [discrepancy_stop()] and refits at that value.
#'
#' @inheritParams rpf_residual_path
#' @param kappa Stopping threshold passed to [discrepancy_stop()].
#' @return List with the chosen `splits`, the residual `path` and the final `fit`.
#' @export
rpf_early_stop <- function(x, y, kappa, splits_grid, seed = 1L, ...) {
  path <- rpf_residual_path(x, y, splits_grid, seed = seed, ...)
  tau <- discrepancy_stop(path$residual_norm, kappa)
  set.seed(seed)
  fit <- randomPlantedForest::rpf(x, y, splits = path$splits[tau], ...)
  list(splits = path$splits[tau], path = path, fit = fit)
}
