all:
				make paper/paper.docx
				make paper/paper.pdf

install: analysis/install.R
				Rscript analysis/install.R

paper/paper.docx: paper/paper.Rmd
				Rscript -e "rmarkdown::render('paper.Rmd')"

paper/paper.pdf: paper/paper.Rmd
				Rscript -e "rmarkdown::render('paper.Rmd')"


.PHONY: cleanFigs cleanFasta cleanRaster cleanTree cleanPaper

cleanFigs:
        rm figures/*.png     or   rm -rf figures/*.png

cleanFasta:
        rm data/raw_data/*.fasta

cleanRaster:
        rm paper/*.rds

cleanTree:
				rm data/derived_data/*.tre

cleanPaper:
				rm -rf paper/paper.docx  paper/paper.pdf
