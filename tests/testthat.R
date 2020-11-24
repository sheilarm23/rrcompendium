install.packages('knitr')
install.packages('testthat')

library(knitr)
library(testthat)

knitr::knit('analysis/paper/paper.Rmd', tangle=TRUE)
source('analysis/paper/paper.R')

testthat::test_file('tests/testthat/test-gettingRF.R')
testthat::test_file('tests/testthat/test-gettingBestModel.R')

system('rm analysis/paper/paper.R')
