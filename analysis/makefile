#############################

# Makefile
# Compendium of R code and data for 'The Truth is Revealed: Identity of the Fish Fry "Teti" Fishery in Eastern Cuba'
# Author: Sheila Rodriguez Machado

#############################

.PHONY: all

all: paper/paper.docx

paper/paper.docx: paper/paper.Rmd
	Rscript -e "rmarkdown::render('paper/paper.Rmd')"

.PHONY: clean

clean:
	cd paper; rm *.docx *.rds
	cd figures; rm -f *.png
	cd data/raw_data; rm -f *.fasta
	cd data/derived_data; rm *.tre

