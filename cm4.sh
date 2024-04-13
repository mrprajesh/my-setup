#!/bin/bash

#~ START:Sun,14-Apr-2024,00:49:38 IST
#~ STOPP:Sun,14-Apr-2024,03:26:01 IST
#~ AuTHoR: Rajesh Pandian M | mrprajesh.co.in

# alias cm='$HOME/my-setup/cm4.sh' # Append ~/.bashrc

# cm -l          # complies last modified file in pwd. c/cpp/cu for now
# cm file.cpp    # complies based on the cmds on first line/comment 
# cm file.cpp v4 # complies & outputs a suffixed v4 executable
# cm -l v3       # complies last modified file and produce *v3.out file

# Assumes the first line contains one of the below
# g++ file.cpp -o file.out   # gcc/g++/nvcc
# g++ -Wall filename.cpp     # This creates filename.out


# Function to display usage message
display_usage() {
    echo "Usage: $0 [-l [<version>]] [<filename> [<version>]]"
    echo "Options:"
    echo "  -l                  Use the last modified file as the filename"
    echo "  <filename>          Specify the filename"
    echo "  <version>           Specify the version number (optional)"
    echo "=== v.4 === mrprajesh.co.in ==="
}

# Check if no arguments are provided
if [ "$#" -eq 0 ]; then
    display_usage
    exit 1
fi

# Check if the user provided the '-l' flag
if [ "$1" = "-l" ]; then

    # Find the last modified file with .c, .cpp, or .cu extension in the current directory
    filename=$(ls -t | grep -E "\.(c|cpp|cu)$" | head -n 1)

    # Check if a matching file is not found
    if [ -z "$filename" ]; then
        echo "Error: No .c, .cpp, or .cu files found in the current directory."
        exit 1
    fi

    # Shift the arguments to remove the '-l' flag
    shift

    # If version is provided, use it
    version="$1"
    shift
else
    # Check if a filename is provided
    if [ -f "$1" ]; then
        filename="$1"
        shift
    else
        display_usage
        exit 1
    fi
fi

# If version is provided, use it
if [ "$#" -gt 0 ]; then
    version="$1"
fi

# Get the first line of the file
first_line=$(head -n 1 "$filename")

# Check if the first line contains a comment
if ! echo "$first_line" | grep -q "//"; then
    echo "Error: '$filename' missing firstline comment/cmds."
    exit 1
fi

# Extract the command after single line comment "//"
cmd=$(echo "$first_line" | sed 's/.*\/\/\(.*\)/\1/' | xargs)


# Extract *.out from the cmd.
# outfile_name_noext=$(echo $cmd | grep -o '\b[[:alnum:]_]*\(?=\.out\b\)')
outfile_name_noext=$(echo $cmd | awk '{match($0, /[[:alnum:]]+\.out/); print substr($0, RSTART, RLENGTH-4)}')
# echo " ="$outfile_name_noext

#if *.out NOT found. USE FILE.out and append the cmd
if [ -z "$outfile_name_noext" ]; then
    outfile_name_noext="${filename%.*}"
    # echo $cmd
    cmd=" $cmd -o $outfile_name_noext.out"
fi

# If version is provided, modify the output executable name in the cmd
if [ -n "$version" ]; then
    output_name="${outfile_name_noext}-$version.out"
    # Replace the placeholder with the new output name
    cmd="${cmd/${outfile_name_noext}.out/$output_name}"
fi

#show the cmd
echo "$cmd"

# Execute the modified or original command
`$cmd`
