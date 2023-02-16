#!/bin/bash

# Set input and output files
server_list_file=$1
output_file="servers_version.txt"

# Create the output file
echo "$(date +"%T %D")" > $output_file

# Loop through each server in the file
while read -r line; do
  # Skip empty lines and lines starting with #
  if [[ -z $server || $server == \#* ]]; then
    continue
  fi
  
  # Use ssh to run the command on the remote server
  version=$(ssh myuser@$server ". /etc/os-release; echo "$PRETTY_NAME"")
  
  # Write the results to the output file
  echo "$(date +"%T %D")    $server    $(dig +short $server)    $version" >> $output_file
done < $server_list_file