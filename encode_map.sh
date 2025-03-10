#!/bin/bash

# Define the parent directory
parent_dir="/home/breiner/foundry-f23/Choco/imgs"

# Iterate over each item in the parent directory
for dir in "$parent_dir"/*/; do
    # Check if the item is a directory
    if [ -d "$dir" ]; then
        # Navigate into the directory
        cd "$dir" || continue
        # Check if the 'map' file exists
        if [ -f "map.svg" ]; then
            # Encode the 'map' file to base64 and append to 'map.txt'
            echo  '"image": "data:image/svg+xml;base64,' >>  map.txt &&  base64 -i map.svg >> map.txt && echo '",' >> map.txt
        else
            echo "No 'map' file found in $dir"
        fi
        # Return to the parent directory
        cd - > /dev/null || exit
    fi
done

