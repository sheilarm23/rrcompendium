#############################

# Makefile
# Compendium of R code and data for 'The Truth is Revealed: Identity of the Fish Fry "Teti" Fishery in Eastern Cuba'
# Author: Sheila Rodriguez Machado

#############################

.PHONY: all

all:
	make paper/paper.docx

paper/paper.docx: paper/paper.Rmd
	Rscript -e "rmarkdown::render('paper/paper.Rmd')"

.PHONY: clean

clean:
	cd figures; rm -f *.pdf
	cd data/raw_data; rm -f *.fasta
	cd data/derived_data; rm *.tre
	cd paper; rm *.pdf *.rds

