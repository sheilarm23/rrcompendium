
context("test-getRF")

test1 <- test_that("getRF errors out when a file of class other than DNAStringSet is taken", {
  expect_error(class(alignedFasta)!= c("DNAStringSet"))
})

test2 <- test_that("getRF errors out when an alignment includes gaps", {
  expect_error(any(letterFrequency(alignedFasta, "-", as.prob=TRUE))>0)
})




