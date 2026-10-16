test_that("discrepancy_stop returns first index below threshold", {
  expect_equal(discrepancy_stop(c(5, 3, 1, 0.5), kappa = 1), 3)
  expect_equal(discrepancy_stop(c(5, 3, 2), kappa = 1), 3)
  expect_equal(discrepancy_stop(c(0.1, 0.05), kappa = 1), 1)
})

test_that("rpf_early_stop runs on a small additive example", {
  set.seed(42)
  n <- 200
  x <- data.frame(x1 = stats::runif(n), x2 = stats::runif(n))
  y <- sin(2 * pi * x$x1) + stats::rnorm(n, sd = 0.3)
  res <- rpf_early_stop(x, y, kappa = 0.09, splits_grid = c(2, 5, 10, 20, 40),
                        max_interaction = 1, ntrees = 10)
  expect_true(res$splits %in% c(2, 5, 10, 20, 40))
  expect_equal(nrow(res$path), 5)
  expect_true(all(res$path$residual_norm > 0))
})
