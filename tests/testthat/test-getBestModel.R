
context("test-getBestModel")

SeqA <- c("ANTCATTTGA")
SeqB <- as.DNAbin(c("TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC"))

test1 <- test_that("getBestModel", {
  expect_is(getBestModel, "function")
})

test2 <- test_that("getBestModel", {
  expect_error(getBestModel(SeqA)) # errors out when a file of class other than -DNAStringSet- is taken
})

bestModel <- getBestModel(SeqB)

test3 <- test_that("getBestModel", {
  expect_true(class(bestModel) == "data.frame")  # outputs an object of class data.frame
})

test4 <- test_that("getBestModel", {
  expect_equal(nrow(bestModel), 24)   # output has 24 rows based on the number of model selected
})

test5 <- test_that("getBestModel", {
  expect_equal(bestModel$AICc[1], min(bestModel$AICc))  # outputs a data.frame sorted from lowest to highest AICc values
})
