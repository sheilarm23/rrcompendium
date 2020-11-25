
context("test-getBestModel")

test1 <- test_that("getBestModel errors out when a file of class other than 'DNAbin' is taken", {
  expect_error(class(fastaRF)!= c("DNAbin"))
})

test2 <- test_that("getBestModel outputs an object of class modelTest", {
  expect_is(class(getBestModel(fastaRF)), "data.frame")
})

test3 <- test_that("getBestModel(fastaRF) has 24 rows based on the number of model selected", {
  expect_true(nrow(getBestModel(fastaRF)) == 24)
})

test4 <- test_that("getBestModel(fastaRF) has sorted the AICc column from lowest to highest value", {
  expect_true(getBestModel(fastaRF)$AICc[1] == min(getBestModel(fastaRF)$AICc))
})

