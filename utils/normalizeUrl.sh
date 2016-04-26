#!/bin/bash

# Make url suitable for matching 
# For example if we have two files from different sources containing similar urls, with this utility + comm we can find duplicates, missing ones... etc. 

# Example call: echo "https://www.example.com/pages\?id\=12" | ./normalizeUrl.sh
# Output format: example.com

egrep -o "(https?://)[^/]+" | sed -r 's#https?://##' | sed -r "s/www.//"
