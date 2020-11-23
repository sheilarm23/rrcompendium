#' gettingRF
#' This function determines the Open Reading Frame (ORF) of a dataset of nucleotide sequences
#'
#' @param alignedFasta takes as input a dataset of aligned sequences of the same length
#'
#' As output, this function either renames the input file if the sequences are in the ORF 1, or it writes a new fasta file if the input file was in ORF 2 or 3.
#' The output file will be of ORF 1
#'
gettingRF <- function(alignedFasta){
  fasta <- readDNAStringSet("/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_7-gaps.fasta")
  orf1 <- predORF(fasta[1:10], n=1, type="df", mode="orf", strand="sense")   # predORF() do not read seqs with gaps
  # predicts longest ORF for sense strand in each query sequence
  longestSeq1 <- orf1$start[orf1$width == max(orf1$width)]
  codonPosition1 <- longestSeq1[1]/3
  codonConfirmation1 <- round(codonPosition1)
  if (codonPosition1==codonConfirmation1){
    file.rename("/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_7-gaps.fasta", "/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_newRF.fasta")                     # 640 bp
    print("The Reading Frame of these seqs is +1, no further action is required, go to modelTesting")
  } else {
    if (codonPosition1!=codonConfirmation1){
      tempLength <- length(fasta[[1]])
      #remove first nucleotide position
      newRF2 <- subseq(fasta, start = 2, end = tempLength)      # 639 bp
      # getting new RF from the new alignment with -1 bp.
      orf2 <- predORF(newRF2[1:10], n=1, type="df", mode="orf", strand="sense")
      # checking size gain
      longestSeq2 <- orf2$start[orf2$width == max(orf2$width)]
      codonPosition2 <- (longestSeq2[1]+2)/3
      codonConfirmation2 <- round(codonPosition2)
      if (codonPosition2==codonConfirmation2){
        writeXStringSet(newRF2, file="/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_newRF.fasta")
        print("The Reading Frame of these seqs was +2, new fasta file created, go to modelTesting")
      } else {
        if (codonPosition2!=codonConfirmation2){
          #remove first nucleotide position
          tempLength <- length(fasta[[1]])
          newRF3 <- subseq(fasta, start = 3, end = tempLength)
          writeXStringSet(newRF3, file="/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_newRF.fasta")    # 638 bp
          print("The Reading Frame of these seqs was +3, new fasta file created, go to modelTesting")
        }
      }
    }
  }
}
