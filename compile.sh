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

# Compile the original files
cd initial-submission-tex
pdflatex "$source_file_base_framework-initial-submission.tex"
bibtex "$source_file_base_framework-initial-submission"
pdflatex "$source_file_base_framework-initial-submission.tex"
pdflatex "$source_file_base_framework-initial-submission.tex"
pdflatex "$source_file_base_results-initial-submission.tex"
bibtex "$source_file_base_results-initial-submission"
pdflatex "$source_file_base_results-initial-submission.tex"
pdflatex "$source_file_base_results-initial-submission.tex"
cd ..

# Run the difference command
# Part I - Framework
latexdiff --flatten "initial-submission-tex/$source_file_base_framework-initial-submission.tex" "$source_file_base_framework.tex" > "diff-$source_file_base_framework.tex"
# Part II - Results
latexdiff --flatten "initial-submission-tex/$source_file_base_results-initial-submission.tex" "$source_file_base_results.tex" > "diff-$source_file_base_results.tex"

# Compile the difference files
pdflatex "diff-$source_file_base_framework.tex"
bibtex "diff-$source_file_base_framework"
pdflatex "diff-$source_file_base_framework.tex"
pdflatex "diff-$source_file_base_framework.tex"

pdflatex "diff-$source_file_base_results.tex"
bibtex "diff-$source_file_base_results"
pdflatex "diff-$source_file_base_results.tex"
pdflatex "diff-$source_file_base_results.tex"

open "$destination_file_base_framework.pdf"
open "$destination_file_base_results.pdf"
open "diff-$source_file_base_framework.pdf"
open "diff-$source_file_base_results.pdf"
