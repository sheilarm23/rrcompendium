
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rrcompendium

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sheilarm23/rrcompendium/master?urlpath=rstudio)

This repository contains the data and code for our future paper:

> Rodriguez-Machado, S., Rodríguez-Cabrera, T.M., and Chakrabarty, P.
> (2020). *The Truth is Revealed: Identity of the Fish Fry “Teti”
> Fishery in Eastern Cuba*. Name of journal/book
> [https://doi.org/{DOI-to-paper}](https://doi.org/%7BDOI-to-paper%7D)

which is still a work in progress…

Our pre-print will be online here:

> Rodriguez-Machado, S., Rodríguez-Cabrera, T.M., and Chakrabarty, P.
> (2020). *The Truth is Revealed: Identity of the Fish Fry “Teti”
> Fishery in Eastern Cuba*. Name of journal/book, Accessed 26 Nov 2020.
> Online at
> [https://doi.org/{DOI-to-compendium}](https://doi.org/%7BDOI-to-compendium%7D)

### How to cite

Please cite this compendium as:

> Rodriguez-Machado, S. (2020). *Compendium of R code and data for `The
> Truth is Revealed: Identity of the Fish Fry "Teti" Fishery in Eastern
> Cuba`*. Accessed 26 Nov 2020. Online at
> [https://doi.org/{DOI-to-compendium}](https://doi.org/%7BDOI-to-compendium%7D)

## Contents

The **analysis** directory contains:

  - [:file\_folder: paper](/analysis/paper): R Markdown source document
    for manuscript. Includes code to reproduce the figures and tables
    generated by the analysis. It also has a rendered version,
    `paper.docx`, suitable for reading (the code is replaced by figures
    and tables in this file)
  - [:file\_folder: data](/analysis/data): Data used in the analysis.
  - [:file\_folder: figures](/analysis/figures): Plots and other
    illustrations
  - [:file\_folder: templates](/analysis/templates): Style of citations
    and reference list

## How to run in your broswer or download and run locally

This research compendium has been developed using the statistical
programming language R. To work with the compendium, you will need
installed on your computer the [R
software](https://cloud.r-project.org/) itself and optionally [RStudio
Desktop](https://rstudio.com/products/rstudio/download/).

The simplest way to explore the text, code and data is to click on
[binder](https://mybinder.org/v2/gh/sheilarm23/rrcompendium/master?urlpath=rstudio)
to open an instance of RStudio in your browser, which will have the
compendium files ready to work with. Binder uses rocker-project.org
Docker images to ensure a consistent and reproducible computational
environment. This way will take a few minutes to be ready but you will
not need to install any packages on your computer.

You can download the compendium as a zip from from this URL:
[master.zip](/archive/master.zip). After unzipping: - open the `.Rproj`
file in RStudio - run `devtools::install()` to ensure you have the
packages this analysis depends on (also listed in the
[DESCRIPTION](/DESCRIPTION) file). - finally, open
`analysis/paper/paper.Rmd` and knit to produce the `paper.docx`, or run
`rmarkdown::render("analysis/paper/paper.Rmd")` in the R console

Makefile: Whatever the option you choose to explore this compendium, you
can also use the makefile (`/analysis/makefile`) in the terminal (`make
all`) to compile the .docx document and then, you can use `make clean`
to remove all files generated during the process.

### Licenses

**Text and figures :**
[CC-BY-4.0](http://creativecommons.org/licenses/by/4.0/)

**Code :** See the [DESCRIPTION](DESCRIPTION) file

**Data :** [CC-0](http://creativecommons.org/publicdomain/zero/1.0/)
attribution requested in reuse

### Contributions

We welcome contributions from everyone. Before you get started, please
see our [contributor guidelines](CONTRIBUTING.md). Please note that this
project is released with a [Contributor Code of Conduct](CONDUCT.md). By
participating in this project you agree to abide by its terms.
