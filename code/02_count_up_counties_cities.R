# the goal of this script is to use the dplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually save it to a csv

# Vanessa Nguyen
# September 22, 2021
# vtnguyen27@usfca.edu

# load functions
source("code/functions/count_cities_counties_by_type.R")

# test out the use of the function
# update the script to run inside a for loop
state_name <- paste0(c("Florida", "California", "Texas", "New York",
                       "Washington", "Nevada", "Virginia"))

for (input_state_file_name in paste0("output/subset_state/applemobilitytrends-",
                                     "2021-10-03_",
                                     state_name,
                                     ".csv"))  {
  count_cities_counties_by_type(input_state_file_name)
}
