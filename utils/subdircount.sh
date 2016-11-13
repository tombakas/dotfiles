#!/bin/bash

find . -maxdepth 1 -type d ! -name \.\* | while read dir; do
    printf "%-25.25s : " "$dir" 
    find "$dir" -type f | wc -l
done
