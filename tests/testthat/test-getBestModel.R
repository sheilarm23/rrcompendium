
context("test-getBestModel")

test_that("getBestModel", {
  expect_is(getBestModel, "function")

  bestModel <- getBestModel(fastaRF)
  expect_true(class(bestModel) == "data.frame")    # "getBestModel outputs an object of class data.frame"
  expect_equal(nrow(bestModel), 24)  # getBestModel(fastaRF) has 24 rows based on the number of model selected"
  expect_equal(bestModel$AICc[1], min(bestModel$AICc))  # getBestModel(fastaRF) has sorted the AICc column from lowest to highest values

  expect_error(getBestModel(fastaRF = c("ANTCATTTGA")))

})
