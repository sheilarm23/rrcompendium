#############################

# Makefile
# Compendium of R code and data for 'The Truth is Revealed: Identity of the Fish Fry "Teti" Fishery in Eastern Cuba'
# Author: Sheila Rodriguez Machado

#############################

all:
				make paper/paper.docx
				make paper/paper.pdf

#install: analysis/install.R
#				Rscript analysis/install.R

paper/paper.docx: paper/paper.Rmd
				Rscript -e "rmarkdown::render('paper.Rmd')"

paper/paper.pdf: paper/paper.Rmd
				Rscript -e "rmarkdown::render('paper.Rmd')"


.PHONY: cleanFigs cleanFasta cleanRaster cleanTree cleanPaper

cleanFigs:
        rm -rf figures/*.png

cleanFasta:
        rm -rf data/raw_data/*.fasta

cleanRaster:
        rm -rf paper/*.rds

cleanTree:
				rm -rf data/derived_data/*.tre

cleanPaper:
				rm -rf paper/paper.docx  paper/paper.pdf
