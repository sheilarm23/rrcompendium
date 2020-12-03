# Installing packages for binder        # I did not include here "rmarkdown", "testthat", or any other because the project doesn't rely directly on them to run
install.packages("raster")
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("mapproj")
install.packages("here")
install.packages("rentrez")
install.packages("ape")
install.packages("seqinr")
install.packages("phangorn")
install.packages("BiocManager")
BiocManager::install("msa")
BiocManager::install("Biostrings")
BiocManager::install("systemPipeR")
BiocManager::install("ggtree")


