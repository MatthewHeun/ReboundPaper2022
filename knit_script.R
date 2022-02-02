# knit_script.R

library(ggplot2)     # For graphing functions
library(magrittr)    # For pipe operator, (%>%)
library(MKHthemes)   # For default ggplot2 theme
library(readxl)      # To read Excel files
library(rworldmap)   # For world maps
library(tidyr)
library(viridis)     # For a great color palette for graphs
library(xtable)      # For awesome tables.


# Set the working directory for knitr
# to be the top level directory for the repository.
knitr::opts_knit$set(root.dir = getwd())

# Set default sizes for figures throughout the book.
# We can always override with options on each individual chunk.
# knitr::opts_chunk$set(echo=FALSE, 
#                       fig.width = 6,    # inches
#                       fig.height = 3.5, # inches
#                       fig.align = "center", 
#                       fig.pos = "t")

# Knit files

knitr::knit(input = "HSB2022.Rnw")
