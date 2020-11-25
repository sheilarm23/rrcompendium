#' gettingBestModel
#' This function provides a dataframe with the list of models of nucleotide evolution sorted by AICc (from lowest to highest)
#'
#' @param fastaRF takes as input a dataset of aligned sequences of the same length and known ORF
#' @return returns a dataframe with the list of models of evolution sorted by AICc, from the lowest to the highest AICc value
#'
#'
gettingBestModel <- function(fastaRF){
  if (class(fastaRF)!= c("DNAbin")){
    stop("This function only takes files of class 'DNAbin'. Use package 'ape' to read the input file")
  }
  formatPhyDat <- as.phyDat(fastaRF)                #getting the class used by modelTest: phyDat or pml
  modelChoice <- modelTest(formatPhyDat, tree = NULL, model = c("JC", "K80", "HKY", "TrN", "SYM", "GTR"), multicore = TRUE, mc.cores = 4)
  modelChoiceSorted <- modelChoice[order(modelChoice$AICc),]
  return(modelChoiceSorted)
}
