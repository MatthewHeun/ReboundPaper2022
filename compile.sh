#!/bin/bash

# Ensure a fresh build by deleting all auxiliary files created by LaTeX.
./clean.sh

/usr/local/bin/Rscript knit_script.R

pdflatex HSB2022.tex
pdflatex HSB2022.tex
# pdflatex HSB2022.tex
open HSB2022.pdf

# Comment the following line if it helps to see the auxiliary files.
# ./clean.sh