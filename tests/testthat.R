install.packages('knitr')
install.packages('testthat')
install.packages('ape')
#install.packages('phangorn')
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biostrings")
#BiocManager::install("systemPipeR")

library(knitr)
library(testthat)
library(Biostrings)
library(ape)
#library(phangorn)
#library(systemPipeR)

knitr::knit('analysis/paper/paper.Rmd', tangle=TRUE)
source('analysis/paper/paper.R')

testthat::test_file('tests/testthat/test-getRF.R')
testthat::test_file('tests/testthat/test-getBestModel.R')

system('rm paper.R')
