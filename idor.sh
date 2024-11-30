#!/bin/bash

# Base URL of the application
BASE_URL="https://online.monash.edu/?s&post_type=course&order=ASC&orderby=title&in_search_page=true"

# Read the file line by line
while IFS= read -r id; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}${id}")
    
    if [ "$response" -eq 200 ]; then
        echo "ID $id found: Status $response"
    else
        echo "ID $id returned status code: $response"
    fi
done < ids.txt
