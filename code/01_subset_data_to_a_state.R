# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset
# uses functions in the code/functions directory

# Vanessa Nguyen
# vtnguyen27@usfca.edu
# September 20, 2021

# load functions
source("code/functions/subset_mobility_data_to_state.R")

# test out the use of the function
subset_mobility_data_to_state(
  input_file_name = "data/raw_data/applemobilitytrends-2021-09-19.csv",
  state_to_subset = "Florida")
