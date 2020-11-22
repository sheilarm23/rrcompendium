# INSTALLING PACKAGES AND LIBRARIES - if needed
packages = c("raster", "ggplot2", "ggthemes",
             "rentrez", "ape", "seqinr", "msa", "Biostrings", "systemPipeR", "phangorn", "ggtree")

package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE, warn.conflicts = FALSE, quietly = TRUE)
  }
 }
)
