#!/bin/bash

pwd=$(pwd)

source_folder="community/couchbase-server"
file_name="Dockerfile"
destination_folder="$pwd/"

# Get a list of all folders in the source directory
folders=$(find "$source_folder" -type d -name "*[0-9]*" -print0 | xargs -0 -I{} basename {} | sort -r)

# Iterate through the sorted folders
for folder in $folders; do
    # Check if the file exists in the current folder
    file_path="$pwd/$source_folder/$folder/$file_name"
    if [ -f "$file_path" ]; then
        # Copy the file to the destination folder
        cp $pwd/$source_folder/$folder/$file_name $destination_folder
        cp -r $pwd/$source_folder/$folder/scripts $destination_folder
        break
    fi
done

docker build --no-cache . --tag elestio4test/couchbase:latest;