#!/bin/bash

# Set the control file name and output file name
control_file=$1
output_file="/tmp/output_1.txt"

# Use awk to find and remove duplicated fake IP addresses
awk '!a[$1]++' $control_file > $output_file