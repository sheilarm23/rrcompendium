#' getRF
#' This function determines the Reading Frame (RF) of a dataset of nucleotide sequences
#'
#' @param x takes as input a dataset of aligned sequences of the same length
#'
#' As output, this function either renames the input file if the sequences are in the ORF 1, or it writes a new fasta file if the input file was in ORF 2 or 3.
#' The output file will be of RF 1
#'
getRF <- function(x){
  if (class(x)!= c("DNAStringSet")){
    stop("This function only takes files of class 'DNAStringSet'. Use package 'Biostrings' to read the input file")
  }
  if (any(letterFrequency(x, "-", as.prob=TRUE))>0){
    stop("This function do not take gaps as values/strings. Go and replaced gaps with Ns (if the gaps are at the begining or end of the sequences) or choose a subset of sequences that do not contain gaps")
  }
  # predORF() do not read seqs with gaps   # predicts longest ORF for sense strand in each query sequence
  orf1 <- predORF(x[1:10], n=1, type="df", mode="orf", strand="sense")
  longestSeq1 <- orf1$start[orf1$width == max(orf1$width)]
  codonPosition1 <- longestSeq1[1]/3
  codonConfirmation1 <- round(codonPosition1)
  length(x)
  if (codonPosition1==codonConfirmation1){
    file.rename("/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_7-gaps.fasta", "/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_newRF.fasta")                     # 640 bp
    print("The Reading Frame of these seqs is +1, no further action is required, go to modelTesting")
  } else {
    if (codonPosition1!=codonConfirmation1){
      tempLength <- length(x[[1]])
      #remove first nucleotide position
      newRF2 <- subseq(x, start = 2, end = tempLength)      # 639 bp
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
          tempLength <- length(x[[1]])
          newRF3 <- subseq(x, start = 3, end = tempLength)
          writeXStringSet(newRF3, file="/Users/sheila_ffish/Documents/rrcompendium/analysis/data/raw_data/Sicydium_COI_newRF.fasta")    # 638 bp
          print("The Reading Frame of these seqs was +3, new fasta file created, go to modelTesting")
        }
      }
    }
  }
}
