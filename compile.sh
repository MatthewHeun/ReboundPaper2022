#!/bin/bash

# Knit the files
/usr/local/bin/Rscript knit_script.R

source_file_base_framework="HSB_framework"
destination_file_base_framework="HSB_framework_$(date +'%Y-%m-%d')"
source_file_base_results="HSB_results"
destination_file_base_results="HSB_results_$(date +'%Y-%m-%d')"

# Copy the .pdf file to a different name with date appended
cp "$source_file_base_framework.pdf" "$destination_file_base_framework.pdf"
cp "$source_file_base_results.pdf" "$destination_file_base_results.pdf"
# Run the difference command
latexdiff "$source_file_base_framework-initial-submission.tex" "$source_file_base_framework.tex" > "diff_$destination_file_base_framework.tex"
latexdiff "$source_file_base_results-initial-submission.tex" "$source_file_base_results.tex" > "diff_$destination_file_base_results.tex"
# Compile the difference file
pdflatex "diff_$destination_file_base_framework.tex"
bibtex "diff_$destination_file_base_framework"
pdflatex "diff_$destination_file_base_framework.tex"
pdflatex "diff_$destination_file_base_framework.tex"

pdflatex "diff_$destination_file_base_results.tex"
bibtex "diff_$destination_file_base_results"
pdflatex "diff_$destination_file_base_results.tex"
pdflatex "diff_$destination_file_base_results.tex"

open "$destination_file_base_framework.pdf"
open "$destination_file_base_results.pdf"
open "diff_$destination_file_base_framework.pdf"
open "diff_$destination_file_base_results.pdf"