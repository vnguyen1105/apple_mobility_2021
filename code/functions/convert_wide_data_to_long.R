# Script to read in Apple mobility data subsetted by state from a csv file
# and convert the dataset to long form using tidyr package.

# Vanessa Nguyen
# vtnguyen27@usfca.edu
# September 29, 2021

library(readr)
library(tidyr)

# create a function to convert any subset US state dataset to long form
# this should also create an output CSV file that is named based on the state
convert_wide_data_to_long <- function(state_name) {
  subset_state_data <- paste0("output/subset_state/applemobilitytrends-",
                              "2021-10-03_",
                              state_name,
                              ".csv")

  wide_to_long_state <- pivot_longer(read_csv(subset_state_data),
    cols = starts_with("20"),
    names_to = "date",
    values_to = "relative_mobility"
  )

  write_csv(wide_to_long_state, file = paste0("output/long_data/",
         tools::file_path_sans_ext(basename(subset_state_data)),
         "_long.csv"))
}
