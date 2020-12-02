install.packages('knitr')
install.packages('testthat')
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biostrings")

library(knitr)
library(testthat)
library(Biostrings)

knitr::knit('analysis/paper/paper.Rmd', tangle=TRUE)

testthat::test_file('tests/testthat/test-getRF.R')
testthat::test_file('tests/testthat/test-getBestModel.R')

system('rm paper.R')
