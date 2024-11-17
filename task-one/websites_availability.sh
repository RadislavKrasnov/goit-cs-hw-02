#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)
log_file="website_status.log"

for website in "${websites[@]}"; do
    status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
    
    if [ $status -eq 200 ]; then
        echo "<$website> is UP" >> "$log_file"
    else
        echo "<$website> is DOWN" >> "$log_file"
    fi
done

echo "Results have been logged in the file: $log_file"
