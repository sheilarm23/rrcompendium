
context("test-gettingBestModel")

test1 <- test_that("input file is of a given class", {
  expect_is(fastaRF, "DNAbin")
})

test2 <- test_that("gettingBestModel outputs an object of class modelTest", {
  expect_is(gettingBestModel(fastaRF), "modelTest")
})

test3 <- test_that("gettingBestModel outputs a data.frame", {
  expect_is(gettingBestModel(fastaRF), "data.frame")
})

test4 <- test_that("gettingBestModel(fastaRF) has 24 rows based on the number of model selected", {
  expect_true(nrow(gettingBestModel(fastaRF)) == 24)
})

test5 <- test_that("gettingBestModel(fastaRF) has sorted the AICc column from lowest to highest value", {
  expect_true(gettingBestModel(fastaRF)$AICc[1] == min(gettingBestModel(fastaRF)$AICc))
})

