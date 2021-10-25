# Analysis of Apple Mobility Data in the Era of COVID-19

Vanessa Nguyen  
vtnguyen27@usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.

That data is available from the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some of the tabular data. Eventually, it will also include use of ggplot2 to visualize the dataset.

### Change Log

* 2021-10-18: Parameterize Rmd and add bash script to drive knitting.
* 2021-10-08: Add another plot to Rmd.
* 2021-10-05: Add Rmd to drive entire analysis.
* 2021-09-29: Added third script to use tidyr to convert the subsetted state datasets from wide to long form.
* 2021-09-24: Turned the second script into a function. Updated the first and second script to run inside a for loop.
* 2021-09-23: Added second script to use dplyr to tally up the count of cities and counties in a given state that have data from different transportation types.
* 2021-09-22: Initialize a git repository in this project.
* 2021-09-20: A new version of the data file was downloaded, and I also worked to refactor the code to be more general and to allow for any state to be subset from the larger file.
* 2021-09-03: The data file was originally downloaded for analysis.

