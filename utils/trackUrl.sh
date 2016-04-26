#!/bin/bash

# Track url after redirection
# Example call: ./trackUrl www.example.com
# Output format: www.example.com___www.exampleredirected.com

curl $1 -s -L -I -o /dev/null -w $1___'%{url_effective}\n' 
