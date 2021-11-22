#!/bin/bash

# Vanessa Nguyen
# vtnguyen27@usfca.edu
# October 27, 2021

# This script will take the path to a single compressed fasta file as a command-line
# argument. The goal is to tally up and report the total number of sequences in the datset
# from each country and sort this output from largest to smallest.

# defensive programming to ensure the correct number of input files
if [ $# -eq 0 ]
then
	echo "To run this script, supply a sequencing fasta.gz file."
	exit 1
elif [ $# -gt 1 ]
then
	echo "This script will only run with one sequencing file. Please ensure that only one is supplied"
	exit 1
fi

# Calculate the total number of sequences in the file
echo "The total number of sequences in this file is: "
zgrep -c ">" "$1"

# Tally up the number of sequences in the dataset from each country.
echo "The number of sequences by country is: "
zcat "$1" | zgrep ">" | cut -d"|" -f21 | sort | uniq -c | sort -rn

# Tally up the number of sequences in the dataset that have more than or less than 29000 bp,
# which is the rough length of the full SARS-CoV-2 sequence.
bioawk -c fastx '{print $seq}' "$1" | awk '{print length}' | awk 'BEGIN{s = 0}; $1 < 29000 {s += 1}; END{print "# of seq < 29,000bp: "s}'
bioawk -c fastx '{print $seq}' "$1" | awk '{print length}' | awk 'BEGIN{b = 0}; $1 > 29000 {b += 1}; END{print "# of seq > 29,000bp: "b}'
