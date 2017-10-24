# This is a tutorial for the basics of dplyr and sf
# The goal here is to identify which state lease polygons are in 
# DrillingInfo's lease data 

root <- getwd()
while(basename(root) != "covertoperations_manual") {
  root = dirname(root)
}

# loading in the libraries we need
library(dplyr)
library(tibble)
library(sf)

# constants we'll use in the rest of the script - remember always to keep 
# constants at the top of the code to make it clear what assumptions we're 
# making; it also makes it easier to go back and change everything
int_lb <- .1
time_int <- 121

# ===========================================================================
# load in datasets
# ===========================================================================
load(file.path(root, "R_Practice/raw_data/state.Rda"))
load(file.path(root, "R_Practice/raw_data/di.Rda"))


