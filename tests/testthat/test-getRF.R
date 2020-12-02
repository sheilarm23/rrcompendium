
context("test-getRF")

Seq1 <- c("ANTCATTTGA")
Seq2 <- DNAString("TTGAAA-CTC-N")

test1 <- test_that("getRF is a function", {
  expect_is(getBestModel, "function")
})

test2 <- test_that("getRF errors out when a file of class other than DNAStringSet is taken", {
  expect_error(getRF(Seq1))
})

test3 <- test_that("getRF errors out when an alignment includes gaps", {
  expect_error(getRF(Seq2))
})




