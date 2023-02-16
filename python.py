#!/usr/bin/env python3

import sys

#Set the input and output file
input_file = 'c:/Users/Grieco/Documents/output_1.txt'
output_file = 'c:/Users/Grieco/Documents/output_2.txt'

with open(input_file, 'r') as f_in, open(output_file, 'w') as f_out:
    for line in f_in:
        # Split the line to get the IP address and hostname
        fields = line.strip().split()
        ip_address = fields[0]
        hostname = fields[1]
        
        # Indent the rest of the columns with 3 spaces between them
        indent = f"{ip_address.ljust(15)}{hostname.ljust(20)}"
        indent += "   ".join(fields[2:])
        
        # Write to the output file
        f_out.write(indent + "\n")