
context("test-getRF")

Seq1 <- c("ANTCATTTGA")
Seq2 <- DNAString("TTGAAA-CTC-N")

test1 <- test_that("getRF", {
  expect_is(getRF, "function")
})

test1 <- test_that("getRF", {
  expect_error(getRF(Seq1))   # errors out when a file of class other than -DNAStringSet- is taken
})

test2 <- test_that("getRF", {
  expect_error(getRF(Seq2))   #  errors out when an alignment includes gaps
})
