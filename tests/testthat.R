install.packages('knitr')
install.packages('testthat')

library(knitr)
library(testthat)

knitr::knit('analysis/paper/paper.Rmd', tangle=TRUE)

testthat::test_file('tests/testthat/test-getRF.R')
testthat::test_file('tests/testthat/test-getBestModel.R')

system('rm paper.R')
