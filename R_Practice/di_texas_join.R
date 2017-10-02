# This is a tutorial for the basics of dplyr and sf
# The goal here is to join Texas General Land Office's lease polygons to 
# DrillingInfo's lease data 
root <- getwd()
while(basename(root) != "covertoperations") {
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
load(file.path(root, "R_Practice/data/state.Rda"))
load(file.path(root, "R_Practice/data/di.Rda"))

# ===========================================================================
# Intersect di and state spatially
# ===========================================================================
# it makes datasets much mroe readable/managable if you slim down to just
# the variables that you need 
di_slim <-
  di %>%
  mutate(di_area = st_area(.)) %>%
  select(leaseId, di_area, DIEffDate = EffDate, DIExprDate = ExprDate)

state_slim <-
  state %>%
  select(Lease_Number, StateEffDate = EffDate, StateExprDate = ExprDate)

# find state leases in the di dataset
# true intersections are deemed to be those leases with
# 1. geometry intersections > .1 * (area of di_lease)
# 2. Effective Date is within 4 months of each other
intersected_leases <-
  st_intersection(di_slim, state_slim) %>%
  mutate(int_area = st_area(.)) %>%
  filter(as.numeric(int_area/di_area) >= int_lb) %>%
  filter(abs(StateEffDate - DIEffDate) < time_int) %>%
  group_by(Lease_Number) %>%
  arrange(Lease_Number, desc(int_area)) %>%
  filter(row_number() == 1) %>%
  group_by(leaseId) %>%
  arrange(leaseId, desc(int_area)) %>%
  filter(row_number() == 1) %>%
  ungroup() %>%
  as.data.frame() %>%
  select(-geometry)

# delete the state leases from di 
di <-
  di %>%
  anti_join(select(intersected_leases, leaseId))
