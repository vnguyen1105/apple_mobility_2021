# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset

# Vanessa Nguyen
# vtnguyen27@usfca.edu
# September 20, 2021

library(readr)
library(dplyr)

# create a function to subset any US state out of the full dataset
# this should also create an output CSV file that is named based on the state
# that is subsetted
subset_mobility_data_to_state <- function(input_file_name,
                                          state_to_subset) {
  # Read in the complete csv file
  all_covid_data <- readr::read_csv(input_file_name)

  # Subset the dataset to only include rows where the sub.region column has
  # the state name in it. We want all columns.
  us_data <- all_covid_data %>%
    filter(country == "United States")
  state_data <- us_data[us_data$`sub-region` == state_to_subset, ]

  # check that the subsetted data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: No rows matching given state name. Did you make a typo?")
  }

  # Save the state data to a new csv file in the output directory
  readr::write_csv(state_data, file = paste0("output/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      state_to_subset,
                                      ".csv"))
}
