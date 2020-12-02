
context("test-getBestModel")

SeqA <- c("ANTCATTTGA")
SeqB <- as.DNAbin("TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC")

test_that("getBestModel", {

  #expect_is(getBestModel, "function")  # getBestModel is a function

  expect_error(getBestModel(SeqA))     # getBestModel errors out when a file of class other than "DNAbin" is taken

  bestModel <- getBestModel(SeqB)

  expect_true(class(bestModel) == "data.frame")         # getBestModel outputs an object of class data.frame
  expect_equal(nrow(bestModel), 24)                     # getBestModel output has 24 rows based on the number of model selected
  expect_equal(bestModel$AICc[1], min(bestModel$AICc))  # getBestModel outputs a data.frame sorted from lowest to highest AICc values

})


