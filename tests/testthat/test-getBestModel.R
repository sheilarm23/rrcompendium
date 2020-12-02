
context("test-getBestModel")

SeqA <- c("ANTCATTTGA")
SeqB <- as.DNAbin(c("TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC", "TAGTAGGTACTGCCC"))

test1 <- test_that("getBestModel errors out when a file of class other than -DNAStringSet- is taken", {
  expect_error(getBestModel(SeqA))
})

test2 <- test_that("getBestModel outputs an object of class data.frame", {
  expect_true(class(getBestModel(SeqB)) == "data.frame")
})

test3 <- test_that("getBestModel output has 24 rows based on the number of model selected", {
  expect_equal(nrow(getBestModel(SeqB)), 24)
})

test4 <- test_that("getBestModel outputs a data.frame sorted from lowest to highest AICc values", {
  expect_equal(getBestModel(SeqB)$AICc[1], min(getBestModel(SeqB)$AICc))
})
