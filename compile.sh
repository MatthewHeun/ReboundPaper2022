#!/bin/bash

/usr/local/bin/Rscript knit_script.R

source_file_base="HSB_framework"
destination_file_base="HSB_framework_$(date +'%Y-%m-%d')"

# echo "File copy from $source_file_base.pdf started"

# Copy the file with the new name
cp "$source_file_base.pdf" "$destination_file_base.pdf"

# echo "File copied successfully to $destination_file_base.pdf"

# echo "Started latexdiff"

# Run the difference command
latexdiff "$source_file_base-initial-submission.tex" "$source_file_base.tex" > diff_framework.tex

# echo "Finished latexdiff"

# echo "Started compiling diff.tex"

pdflatex diff_framework.tex
open "$destination_file_base.pdf"
open diff_framework.pdf


# echo "Completed compiling diff.tex"

source_file_base="HSB_results"
destination_file_base="HSB_results_$(date +'%Y-%m-%d')"

cp "$source_file_base.pdf" "$destination_file_base.pdf"
latexdiff "$source_file_base-initial-submission.tex" "$source_file_base.tex" > diff_results.tex
pdflatex diff_results.tex
bibtex diff_results
pdflatex diff_results.tex
pdflatex diff_results.tex


open "$destination_file_base.pdf"

open diff_results.pdf
