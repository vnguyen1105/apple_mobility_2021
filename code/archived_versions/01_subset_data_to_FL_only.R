# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Florida
# and then write out a csv file that only has that subset

# Vanessa Nguyen
# vtnguyen27@usfca.edu
# September 3, 2021

# Read in the complete csv file
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-09-02.csv")

# Subset the dataset to only include rows where the sub.region column has 
# "Florida" in it. We want all columns.
florida_data <- all_covid_data[all_covid_data$sub.region == "Florida",] 

# Save the Florida data to a new csv file in the output directory
write.csv(florida_data, file = "output/florida_apple_mobility_data.csv")
