#' gettingBestModel
#' This function provides a dataframe with the list of models of nucleotide evolution sorted by AICc (from lowest to highest)
#'
#' @param fastaORF takes as input a dataset of aligned sequences of the same length and known ORF
#' @return returns a dataframe with the list of models of evolution sorted by AICc, from the lowest to the highest AICc value
#'
#'
gettingBestModel <- function(fastaORF){
  modelFasta <- read.dna(file="/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_newRF.fasta", format = "fasta")
  formatPhyDat <- as.phyDat(modelFasta)                #getting the class used by modelTest: phyDat or pml
  modelChoice <- modelTest(formatPhyDat, tree = NULL, model = c("JC", "K80", "HKY", "TrN", "SYM", "GTR"), multicore = TRUE, mc.cores = 4)
  return(modelChoice)
}
