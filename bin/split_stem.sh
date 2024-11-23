#!/bin/sh

# This script splits a stem file into 5 separate files: stereo mix, and 4 stems.
#./split_stem.sh <input_file> <output_directory>

# if no input or output directory is provided, exit and print usage message
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <input_file> <output_directory>"
    exit 1
fi

# Get the input filename from the first argument
input_file="$1"

# get the output directory from the second argument
output_directory="$2"

# Check if the input file is provided
if [ -z "$input_file" ]; then
    echo "Error: Please provide a stem file as the first argument."
    exit 1
fi

# get the base filename without the extension
base_filename=$(basename "$input_file" .stem.m4a)
echo "$base_filename"

# Create output directory if it doesn't exist in current directory

# split stem based on input file
ffmpeg -i "$input_file" -map 0:0 "$base_filename"_stereo_mix.m4a \
-map 0:1 "$base_filename"_stem_1.m4a -map 0:2 "$base_filename"_stem_2.m4a \
-map 0:3 "$base_filename"_stem_3.m4a -map 0:4 "$base_filename"_stem_4.m4a
