#!/usr/bin/env bash

resolution=$(ffprobe "$1" 2>&1 | grep Video | grep -o '[0-9]\{2,\}x[0-9]\{2,\}')
width=$(echo $resolution | cut -d "x" -f 1)
height=$(echo $resolution | cut -d "x" -f 2)

if [ -z "$2" ]; then
    output="output.mp4"
else
    output=$2
fi

while [ $width -gt 1000 ] || [ $height -gt 1000  ]; do
    width=$((width / 2))
    height=$((height / 2))
done

ffmpeg -i "$1" -c:v libx264 -crf 30 -preset slow -c:a libmp3lame -ab 256k -s "${width}x${height}" $output
