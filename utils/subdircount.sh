#!/bin/bash

find . -maxdepth 1 -type d ! -name \.\* | while read dir; do
    printf "%-25.25s : " "$dir" 
    find "$dir" -maxdepth 1 ! -name ${dir:2} | wc -l
done | sort -k 3 -n -r
