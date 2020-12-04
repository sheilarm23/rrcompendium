
context("test-getBestModel")

SeqA <- c("ANTCATTTGA")

SeqB1 <- structure(c("123", "456", "789", "101", "AATTCAATGCTCGGGAAGCAAGGAAAGCTA", "AATTCCTAAAACACCAATCAAGTTGGTGTT", "AATTCACCACCACCACTAGCATACCATCCA", "AATTCTATTGGTCATCACAATGGTGGTCCG"), .Dim = c(4L, 2L))
SeqB2 <- t(sapply(strsplit(SeqB1[,2],""), tolower))
rownames(SeqB2) <- SeqB1[,1]
SeqB3 <- as.DNAbin(SeqB2)

test1 <- test_that("getBestModel", {
  expect_is(getBestModel, "function")
})

test2 <- test_that("getBestModel", {
  expect_error(getBestModel(SeqA)) # errors out when a file of class other than -DNAStringSet- is taken
})

bestModel <- getBestModel(SeqB3)

test3 <- test_that("getBestModel", {
  expect_true(class(bestModel) == "data.frame")  # outputs an object of class data.frame
})

test4 <- test_that("getBestModel", {
  expect_equal(nrow(bestModel), 24)   # output has 24 rows based on the number of model selected
})

test5 <- test_that("getBestModel", {
  expect_equal(bestModel$AICc[1], min(bestModel$AICc))  # outputs a data.frame sorted from lowest to highest AICc values
})
