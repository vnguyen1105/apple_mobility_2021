# the goal of this script is to use the dplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually save it to a csv

# Vanessa Nguyen
# September 22, 2021
# vtnguyen27@usfca.edu

# load the package "dplyr"
library("dplyr")

# We would like to get a count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted.

# load in the dataset from the previous script
input_file_name <- "output/applemobilitytrends-2021-09-19_Florida.csv"
state_data <- read.csv(input_file_name)

# starting off with dplyr chains
count_of_cities_counties_by_transportation <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  # filter(transportation_type == "driving") %>%
  group_by(geo_type, transportation_type) %>%
  tally()

write.csv(count_of_cities_counties_by_transportation,
          "output/florida_cities_counties_counts.csv")
