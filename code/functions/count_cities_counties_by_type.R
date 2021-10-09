# Script to read in Apple mobility data from an already subset csv file
# to select columns including data about geography type, the region of the
# state, and the type of transportation recorded. Then write out a csv
# file that only has these parameters.

# Vanessa Nguyen
# vtnguyen27@usfca.edu
# September 23, 2021

# load the package "dplyr"
library(dplyr)
library(readr)

# create a function to create counts of cities and counties in any given
# subsetted US state sorted by transportation type. this should also create
# an output CSV file that is named based on the state that is subsetted.

count_cities_counties_by_type <- function(input_state_file_name) {
  # read in the subsetted state csv file
  state_subset_data <- readr::read_csv(input_state_file_name)

  # use dplyr chains to select and filter the data. then tally the number of
  # cities and counties with mobility data, sorted by transportation type.
  count_state_transportation <- state_subset_data %>%
    dplyr::filter(!is.na(geo_type)) %>%
    dplyr::select(geo_type, region, transportation_type) %>%
    dplyr::group_by(geo_type, transportation_type) %>%
    dplyr::tally()

  # check that the dplyr pipeline actually has data in it
  if (nrow(count_state_transportation) < 2) {
    stop("ERROR: Double check to make sure the input file is subsetted.")
  }

  if (nrow(count_state_transportation) > 6) {
    stop("ERROR: Double check to make sure the input file is subsetted.")
  }

  # write out the result of the dplyr chain as a csv named based on the input
  # file name.
  readr::write_csv(count_state_transportation, file = paste0("output/",
                                                             "mobility_tally/",
                                             tools::file_path_sans_ext(
                                              basename(input_state_file_name)),
                                             "_cities_counties_count.csv"))
}
